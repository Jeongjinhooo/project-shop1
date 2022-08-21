<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>장바구니</title>
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/myCartList.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css">
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <!-- Montserrat:whgt700 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap"
      rel="stylesheet"
    />
    <script defer src="${pageContext.request.contextPath}/resources/js/script.js"></script>
     <style>
   header #h_sec02 #left_icon_menu ul .menu_btn a{background: url('${pageContext.request.contextPath}/resources/img/header/all_cate_icon.png') no-repeat;}
   </style>
   	 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   <script type="text/javascript">

   //----------장바구니 수량변경
	function modify_cart_qty(goods_id,goodsPrice,index){
		//alert(index);
	   var length=document.frm_order_all_cart.cart_goods_qty.length;
	   console.log(length);
	   var _cart_goods_qty=0;
		if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
			_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty[index].value;		
		}else{
			_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
		}
			
		var cart_goods_qty=Number(_cart_goods_qty);
		//alert("cart_goods_qty:"+cart_goods_qty);
		//console.log(cart_goods_qty);
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${pageContext.request.contextPath}/cart/modifyCartQty.do",
			data : {
				goods_id:goods_id,
				cart_goods_qty:cart_goods_qty
			},
			
			success : function(data, textStatus) {
				//alert(data);
				if(data.trim()=='modify_success'){
					alert("수량을 변경했습니다!!");
					window.location.reload()
				}else{
					alert("다시 시도해 주세요!!");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
// --------------------------장바구니 삭제
	function delete_cart_goods(cart_id){
		var cart_id=Number(cart_id);
		var formObj=document.createElement("form");
		var i_cart = document.createElement("input");
		i_cart.name="cart_id";
		i_cart.value=cart_id;
		
		formObj.appendChild(i_cart);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${pageContext.request.contextPath}/cart/removeCartGoods.do";
	    formObj.submit();
	}
//-----------------------
    function calcGoodsPrice(goodsPrice,obj){
		var totalPrice,final_total_price,totalNum;
		var goods_qty=document.getElementById("select_goods_qty");
		//alert("총 상품금액"+goods_qty.value);
		var p_totalNum=document.getElementById("p_totalNum");
		var p_totalPrice=document.getElementById("p_totalPrice");
		var p_final_totalPrice=document.getElementById("p_final_totalPrice");
		var h_totalNum=document.getElementById("h_totalNum");
		var h_totalPrice=document.getElementById("h_totalPrice");
		var h_totalDelivery=document.getElementById("h_totalDelivery");
		var h_final_total_price=document.getElementById("h_final_totalPrice");
		if(obj.checked==true){
		//	alert("체크 했음")
			
			totalNum=Number(h_totalNum.value)+Number(goods_qty.value);
			//alert("totalNum:"+totalNum);
			totalPrice=Number(h_totalPrice.value)+Number(goods_qty.value*goodsPrice);
			//alert("totalPrice:"+totalPrice);
			final_total_price=totalPrice+Number(h_totalDelivery.value);
			//alert("final_total_price:"+final_total_price);

		}else{
		//	alert("h_totalNum.value:"+h_totalNum.value);
			totalNum=Number(h_totalNum.value)-Number(goods_qty.value);
		//	alert("totalNum:"+ totalNum);
			totalPrice=Number(h_totalPrice.value)-Number(goods_qty.value)*goodsPrice;
		//	alert("totalPrice="+totalPrice);
			final_total_price=totalPrice-Number(h_totalDelivery.value);
		//	alert("final_total_price:"+final_total_price);
		}
		
		h_totalNum.value=totalNum;
		
		h_totalPrice.value=totalPrice;
		h_final_total_price.value=final_total_price;
		
		p_totalNum.innerHTML=totalNum;
		p_totalPrice.innerHTML=totalPrice;
		p_final_totalPrice.innerHTML=final_total_price;
	} 

//선택상품주문
	
    function fn_order_each_goods(goods_id,goods_name,goods_price,fileName,goods_color){
    	
		var _isLogOn=document.getElementById("isLogOn");
    	var isLogOn=_isLogOn.value;
    	
    	 if(isLogOn=="false" || isLogOn=='' ){
    		alert("로그인 후 주문이 가능합니다!!!");
    	} 
    	
	
		var total_price,final_total_price;
		var order_goods_qty=document.getElementById("cart_goods_qty");
		var order_goods_size = document.getElementById("goods_size");
		
		console.log(order_goods_size);
	var formObj=document.createElement("form");
	var i_goods_id = document.createElement("input"); 
    var i_goods_name = document.createElement("input");
    var i_goods_price=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_goods_color=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    var i_order_goods_size=document.createElement("input");
    i_goods_id.name="goods_id";
    i_goods_name.name="goods_name";
    i_goods_price.name="goods_price";
    i_fileName.name="goods_fileName";
    i_goods_color.name ="goods_color";
    i_order_goods_qty.name="order_goods_qty";
    i_order_goods_size.name="order_goods_size";
    i_goods_id.value=goods_id;
    i_goods_name.value=goods_name;
    i_goods_price.value=goods_price;
    i_fileName.value=fileName;
    i_goods_color.value=goods_color;
    i_order_goods_qty.value=order_goods_qty.value;
    i_order_goods_size.value = order_goods_size.value;
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_name);
    formObj.appendChild(i_goods_price);
    formObj.appendChild(i_fileName);
	formObj.appendChild(i_goods_color);
    formObj.appendChild(i_order_goods_qty);
    formObj.appendChild(i_order_goods_size);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${pageContext.request.contextPath}/order/orderEachGoods.do"; 
    formObj.submit();
	}	  

	
	//전체상품주문
	function fn_order_all_cart_goods(){
//		alert("모두 주문하기");
		var order_goods_qty;
		var order_goods_id;
		var objForm=document.frm_order_all_cart;
		var cart_goods_qty=objForm.cart_goods_qty;
		var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
		var checked_goods=objForm.checked_goods;
		var length=checked_goods.length;
		
		
		//alert(length);
		if(length>1){
			for(var i=0; i<length;i++){
				if(checked_goods[i].checked==true){
					order_goods_id=checked_goods[i].value;
					order_goods_qty=cart_goods_qty[i].value;
					cart_goods_qty[i].value="";
					cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
					//alert(select_goods_qty[i].value);
					console.log(cart_goods_qty[i].value);
				}
			}	
		}else{
			order_goods_id=checked_goods.value;
			order_goods_qty=cart_goods_qty.value;
			cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
			//alert(select_goods_qty.value);
		}
			
	 	objForm.method="post";
	 	objForm.action="${pageContext.request.contextPath}/order/orderAllCartGoods.do";
		objForm.submit();
	}

</script> 
</head>
<body style="overflow-x: hidden">
    <div id="wrap">
        <!-- header------------------------------------------------------------- -->
               <header>
        <div id="h_sec01" class="flex_center">
          <div id="top_logo" class="flex_center">
            <a href="${pageContext.request.contextPath}/main.do">
              <img src="${pageContext.request.contextPath}/resources/img/header/top_logo.png" alt="" />
            </a>
          </div>
          <ul>
           <c:choose>
		     <c:when test="${isLogOn==true and not empty memberInfo }">
			   <li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="${pageContext.request.contextPath}/mypage/myPageMain.do">마이페이지</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="${pageContext.request.contextPath}/cart/myCartList.do">장바구니</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="#">주문배송</a></li>
			    <li><a href="#">|</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			   <li><a href="#">|</a></li>
			        <li><a href="${pageContext.request.contextPath}/member/memberForm.do">회원가입</a></li>
			   <li><a href="#">|</a></li>
			 </c:otherwise>
			</c:choose>
			   <li><a href="#">고객센터</a></li>
    <%-- 	  <c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">  
	   	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
	    </c:if>  --%>
			  
          </ul>
        </div>
        <div id="h_sec02">
          <div id="left_icon_menu">
            <ul>
              <li class="menu_btn"><a href="#"></a></li>
              <li>
                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/header/top_search.png" alt="" /></a>
              </li>
            </ul>
          </div>
          <div id="hcategory">
            <ul id="mainmenu">
              <li>
                NEW ARRIVALS
                <ul class="submenu hidden">
                  <li>22S</li>
                </ul>
              </li>
              <li>
                MEN
                <ul class="submenu hidden">
                  <li>상의</li>
                  <li>하의</li>
                  <li>셋업</li>
                  <li>아우터</li>
                </ul>
              </li>
              <li>
                WOMEN
                <ul class="submenu hidden">
                  <li>상의</li>
                  <li>하의</li>
                  <li>셋업</li>
                  <li>아우터</li>
                </ul>
              </li>
              <li>
                ACC
                <ul class="submenu hidden">
                  <li>가방</li>
                  <li>모자</li>
                  <li>용품</li>
                </ul>
              </li>
              <li>LOOKBOOK</li>
            </ul>
          </div>
          <div id="right_icon_menu">
            <ul>
              <li>
                <a href="#">
                  <img src="${pageContext.request.contextPath}/resources/img/header/top_cart.png" alt="" />
                </a>
              </li>
              <li id="loginmenu">
                <a href="#">
                  <img src="${pageContext.request.contextPath}/resources/img/header/top_my.png" alt="" />
                 <!--  <ul class="toplogin">
                    <a href=""></a>
                    <li><a href="">로그인</a></li>
                    <li><a href="">회원가입</a></li>
                    <li><a href="">주문조회</a></li>
                    <li><a href="">고객센터</a></li>
                  </ul> -->
                </a>
              </li>
            </ul>
          </div>
        </div>
      </header>


      <!-- section ------------------------------------------------------->
         <section>
        <div id="sectioninner">
          <div id="titleArea2">
            <h2>장바구니</h2>
          </div>
            <form name="frm_order_all_cart">
          <div class="orderListArea">
            <table>
              <colgroup>
                <col style="width: 30px" />
                <col style="width: 90px" />
                <col style="width: 1000px" />
                <col style="width: 90px" />
                <col style="width: 110px" />
                <col style="width: 100px" />
                <col style="width: 90px" />
                <col style="width: 90px" />
                <col style="width: 100px" />
                <col style="width: 110px" />
              </colgroup>
              <thead>
                <tr>
                  <th scope="col">
                    <input type="checkbox" />
                  </th>
                  <th scope="col">이미지</th>
                  <th scope="col">상품정보</th>
                  <th scope="col">수량</th>
                  <th scope="col">상품구매금액</th>
                  <th scope="col">할인금액</th>
                  <th scope="col">적립금</th>
                  <th scope="col">배송구분</th>
                  <th scope="col">배송비</th>
                  <th scope="col">선택</th>
                </tr>
              </thead>
             
              <tbody class="textcenter">
              	 <c:choose>
				    <c:when test="${empty myCartList}">
				    <tr>
				       <td colspan=8 class="fixed">
				         <strong>장바구니에 상품이 없습니다.</strong>
				       </td>
				     </tr>
				    </c:when>
			        <c:otherwise>
               
               		  <c:forEach var="item" items="${myGoodsList}" varStatus="cnt">
				       <c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
				       <c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
				       <c:set var="goods_size" value="${myCartList[cnt.count-1].goods_size}" />
				        <tr>
                  <td>
                   <input type="checkbox" name="checked_goods"  checked  value="${item.goods_id }"  onClick="calcGoodsPrice(${item.goods_price },this)">
                  </td>
                  <td>
                   <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
						<img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"  />
                    </a>
                  </td>
                  <td class="textleft pdleft10">
                    <strong>
                    			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_name}</a>
                    </strong>
                    <ul>
                      <li>[색상 : ${item.goods_color}]<br>
                          [사이즈 : ${goods_size}]
                          <input type="hidden" name="goods_size" id="goods_size" value="${goods_size}"/>
                          
                      </li>
                    </ul>
                  </td>
                  <td>    
                      <input type="text" id="cart_goods_qty" name="cart_goods_qty" size=3 value="${cart_goods_qty}"><br>		
						 <a href="javascript:modify_cart_qty(${item.goods_id},${item.goods_price},${cnt.count-1});" class="btnnormal">변경</a>
                   
                  </td>
                  <td>
                    <div>
                    <strong>					  
					   ${item.goods_price*cart_goods_qty}원
					</strong>
                    </div>
                  </td>
                  <td>
                    <span>-</span> 
                  </td>
                  <td>
                    <span>-</span>
                  </td>
                  <td>
                    <div>
                      기본배송
                      <br />
                    </div>
                  </td>
                  <td>무료</td>
                  <td class="button">
                  
                    <a href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_name }','${item.goods_price}','${item.goods_fileName}','${item.goods_color}');" class="btnnormal">주문하기</a>
                    <a href="#" class="btnnormal">관심상품등록</a>
                    <a href="javascript:delete_cart_goods('${cart_id}')" class="btnnormal">삭제</a>
                  </td>
                </tr>
                <c:set  var="totalGoodsPrice" value="${totalGoodsPrice+item.goods_price*cart_goods_qty }" />
				<c:set  var="totalGoodsNum" value="${totalGoodsNum+1 }" />
			   </c:forEach>
              	 </c:otherwise>
				</c:choose> 
              </tbody>
            </table>
            <div id="totalpricetable">
              <table>
                <caption>
                  총 주문금액
                </caption>
                <colgroup>
                  <col style="width: 20%" />
                  <col style="width: 20%" />
                  <col style="width: 60%" />
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col">
                      <strong>총 상품금액</strong>
                    </th>
                    <th scope="col">
                      <strong>총 배송비</strong>
                    </th>
                    <th scope="col">
                      <strong>결제예정금액</strong>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <div>
                          <strong class="txt16">
                          KRW
                          </strong>
                       <p id="p_totalGoodsPrice" class="txt23">
	          <fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
				         ${total_goods_price}원
	      	    </p>
	          <input id="h_totalGoodsPrice"type="hidden" value="${totalGoodsPrice}" />                   
                 
                      </div>
                    </td>
                    <td>
                      <div>
                        <strong class="txt23">+ </strong>
                        <strong class="txt16">
                          KRW
                              </strong>
                            <p id="p_totalDeliveryPrice" class="txt23">${totalDeliveryPrice }원  </p>
	   				     <input id="h_totalDeliveryPrice"type="hidden" value="${totalDeliveryPrice}" />
                      </div>
                    </td>
                    <td>
                      <div>
                        <strong class="txt23">= </strong>
                        <strong class="txt16">
                          KRW
                        </strong>
                         <p id="p_final_totalPrice" class="txt23">
	       		   <fmt:formatNumber  value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
	       			     ${total_price}원
	       				   </p>
	      		    <input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
                      </div>
                    </td>
                  </tr>
                </tbody>
                 <tfoot>
                <tr>
                  <td colspan="10">
                  
                    <span class="gLeft">[기본배송]</span>
                    상품구매금액
                    <strong>
                        ${total_price}원
                      <span></span>
                    </strong>
                    + 배송비
                    <span>0 (무료)</span>
                    = 합계 :
                    <strong>
                      KRW
                      <span class="txt18">  ${total_price}원</span>
                    </strong>
                  </td>
                </tr>
              </tfoot>
              </table>
              <div id="totalorder">
                <a href="javascript:fn_order_all_cart_goods()" class="btnSubmit">주문하기</a>
                <span><a href="location.href='${pageContext.request.contextPath}/main.do'" class="btnnormal">쇼핑계속하기</a></span>
              </div>
         
            </div>
          </div>
         </form>
        </div>
      </section>
      <!-- footer---------------------------------------------------------- -->
      <footer class="flex_center">
        <div id="ft_inner">
          <div id="ft_sec01">
            <div id="ft_sec01_txt">
              연습 코리아에서 판매되는 제품은 "
              <span>정식제조, 정식수입절차를 통해서 유통되는 100% 정품</span>"
              입니다.
            </div>
            <div id="ft_menuright">
              <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">이용안내</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">이용약관</a></li>
              </ul>
            </div>
          </div>
          <div id="ft_sec02">
            <div id="ft_left">
              <div id="ft_number">
                000-0000-0000
                <p>
                  평일 10:00 ~ 18:00 / 점심시간 12:00 ~ 13:30 / 주말, 공휴일
                  휴무
                </p>
              </div>
              <div id="ft_info">
                주식회사 에프에프에프<span></span> 대표 : 정진호<span
                ></span> 주소 : 대전광역시 서구 탄방동 0000
                <span></span> 사업자등록번호 : 123-00-00000<br />
                통신판매업신고번호 : 0000-대전둔산동-0000<span></span> 대표번호
                : 070-0000-0000<span></span> 개인정보관리책임자 : 정진호<span
                ></span> 이메일 : test11@gmail.com
              </div>
              <div id="ft_copy">
                COPYRIGHT ⓒ 주식회사 에프에프에프 . ALL RIGHTS RESERVED.
              </div>
              <div id="ft_sns">
                <ul>
                   <li>
                    <a href="#"><img src="${pageContext.request.contextPath}/resources/img/footer/ft_sns01.png" alt="" /></a>
                  </li>
                  <li>
                    <a href="#"><img src="${pageContext.request.contextPath}/resources/img/footer/ft_sns02.png" alt="" /></a>
                  </li>
                  <li>
                    <a href="#"><img src="${pageContext.request.contextPath}/resources/img/footer/ft_sns03.png" alt="" /></a>
                  </li>
                </ul>
              </div>
            </div>
            <div id="ft_right">
              <ul>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">문의하기</a></li>
                <li><a href="#">상품후기</a></li>
              </ul>
              <ul>
                <li><a href="#">회원가입</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">위시리스트</a></li>
                <li><a href="#">자주묻는 질문</a></li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
