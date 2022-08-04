<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageList }"  />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>상세페이지</title>
    
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/goodsDetail.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css">
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat&family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
        <!-- Montserrat:whgt700 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap"
      rel="stylesheet"
    />
    
    <script defer src="${pageContext.request.contextPath}/resources/js/script.js"></script>
 	 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
 
 <script type="text/javascript">
//-------------------------상품 수량 변경  
 Number.prototype.format = function(){
   if(this==0) return 0;

   var reg = /(^[+-]?\d+)(\d{3})/;
   var n = (this + '');

   while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

   return n;
 };
  

 String.prototype.format = function(){
   var num = parseFloat(this);
   if( isNaN(num) ) return "0";

   return num.format();
 };
     
 var basic_amount = parseInt('${goods.goods_price}');

 function change_qty2(t){
   //var min_qty = '수량버튼'*1;
   var min_qty = 1;
   var this_qty = $("#quantity").val()*1;
   var max_qty = '200'; // 현재 재고
   console.log(this_qty);
   if(t=="m"){
     this_qty -= 1;
     if(this_qty<min_qty){
       //alert("최소구매수량 이상만 구매할 수 있습니다.");
       alert("수량은 1개 이상 입력해 주십시오.");
       return;
       }
     }
     else if(t=="p"){
       this_qty += 1;
       if(this_qty>max_qty){
         alert("죄송합니다. 재고가 부족합니다.");
         return;
         }
     }

   var show_total_amount = basic_amount * this_qty;
   //$("#quantity_txt").text(this_qty); 
   $("#quantity").val(this_qty);
   $("#it_pay").val(show_total_amount);
   $("#total_amount").html(show_total_amount.format());
 }
 
//--------------------장바구니로 데이터 넘기기
	function add_cart(goods_id) {
		var cart_goods_qty = $("#quantity").val();
		var goods_size = $("input:radio[name=size]:checked").val();
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${pageContext.request.contextPath}/cart/addGoodsInCart.do",
			data : {
				goods_id:goods_id,
				cart_goods_qty:cart_goods_qty,
				goods_size:goods_size
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					alert("장바구니에 담았습니다.");
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 상품입니다.");	
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

//---------------------
	
  /*  function fn_order_each_goods(goods_id,goods_name,goods_price,fileName){
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	 if(isLogOn=="false" || isLogOn=='' ){
		alert("로그인 후 주문이 가능합니다!!!");
	} 
	
	
		var total_price,final_total_price;
		var order_goods_qty=document.getElementById("order_goods_qty");
		
	var formObj=document.createElement("form");
	var i_goods_id = document.createElement("input"); 
    var i_goods_name = document.createElement("input");
    var i_goods_price=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    
    
    i_goods_id.name="goods_id";
    i_goods_name.name="goods_name";
    i_goods_price.name="goods_price";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    
    i_goods_id.value=goods_id;
    i_order_goods_qty.value=order_goods_qty.value;
    i_goods_name.value=goods_name;
    i_goods_price.value=goods_price;
    i_fileName.value=fileName;
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_name);
    formObj.appendChild(i_goods_price);
    formObj.appendChild(i_fileName);
    formObj.appendChild(i_order_goods_qty);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${pageContext.request.contextPath}/order/orderEachGoods.do"; 
    formObj.submit();
	}	  */
</script>
 
   <style>
   header #h_sec02 #left_icon_menu ul .menu_btn a{background: url('${pageContext.request.contextPath}/resources/img/header/all_cate_icon.png') no-repeat;}
   </style>
  </head>

  <body style="overflow-x: hidden">
    <div id="wrap">
      <!-- header----------------------------------------------------------- -->
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
			   <li><a href="${pageContext.request.contextPath}/member/mypage.do">마이페이지</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="${pageContext.request.contextPath}/cart/myCartList.do">장바구니</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="#">주문배송</a></li>
			    <li><a href="#">|</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a></li>
			   <li><a href="#">|</a></li>
			        <li><a href="${pageContext.request.contextPath}/member/memberForm.do">회원가입</a></li>
			   <li><a href="#">|</a></li>
			 </c:otherwise>
			</c:choose>
			   <li><a href="#">고객센터</a></li>
    <%-- 	  <c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">  
	   	   <li class="no_line"><a href="${pageContext.request.contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
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
       <div id="detailarea">
           <div id = "detailleft">
               <div id="bigimage">
                   <a href="">
                       <img src="${pageContext.request.contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
                   </a>
               </div>
               <div id="detailgoods"><span></span>
                   <h3>
                       <span>   
                            제품 상세
                       </span>
                    </h3>
               </div>
               <div id="detail_content">
                   	<c:forEach var="image" items="${imageList }">
					<img 
						src="${pageContext.request.contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
				</c:forEach>
               </div>
           </div>
           <div id="detailright">
           <div id="detail_table">
               <div id="detailname">
                   <h2>${goods.goods_name}</h2>
               </div>
               <div id="detailprice">
                   <span>
						<fmt:formatNumber  value="${goods.goods_price}" type="number" var="goods_price" />
		          ${goods.goods_price}원
					</span>
               </div>
               <table>
                   <caption>상품옵션</caption>
                   <tbody>
                       <tr>
                           <th>색상</th>
                           <td>
                               <ul>
                                   <li class="selectcolor">
                                      <input type="checkbox" id="selectcolor" name="shop" disabled><label for="selectcolor">${goods.goods_color}</label>
                                    
                                   
                                    </li>
                               </ul>
                               <!-- <p>
                                           [필수] 
                                           <span>
                                               색상을 먼저 선택해주세요
                                           </span>
                                       </p> -->
                           </td>
                       </tr>
                   </tbody>
                   <tbody>
                       <tr>
                           <th>사이즈</th>
                           <td>
                               <ul>
                                   <li class="selectsize"> 
                                      
                                         <input type="radio" id="select" name="size" value="S"><label for="select">S</label>
                                      
                                    </li>
                                    <li class="selectsize"> 
                                     
                                         <input type="radio" id="select2" name="size" value="M"><label for="select2">M</label>
                                   
                                    </li>
                                    <li class="selectsize"> 
                                   
                                         <input type="radio" id="select3" name="size" value="L"><label for="select3">L</label>
                                   
                                    </li>
                                    <li class="selectsize"> 
                                      
                                         <input type="radio" id="select4" name="size" value="XL"><label for="select4">XL</label>
                                      
                                    </li>
                               </ul>
                              <!--  <p>
                                   [필수]
                                   <span>
                                       색상을 먼저 선택해주세요
                                   </span>
                               </p> -->
                           </td>
                       </tr>
                       <tr>
                           <th>수량</th>
                           <td>
                           <div id="cart_goods_qty">                 
                                  <input type="text" name="quantity" id="quantity" value="1" readonly="readonly">
                               
                                  <a href="javascript:change_qty2('p')"  >
                                    <img src="${pageContext.request.contextPath}/resources/img/section/btn_quantity_up.gif" alt="증가" class="quantity_up" >
                                  </a>
                              
                                
                                  <a href="javascript:change_qty2('m')">
                                    <img src="${pageContext.request.contextPath}/resources/img/section/btn_quantity_down.gif" alt="감소" class="quantity_down">
                                  </a>
                             
                               </div>
                           </td>
                       </tr>
                       <tr>
					<td>배송료</td>
					<td><strong>무료</strong></td>
				</tr>
				<tr>
					<td>배송안내</td>
					<td><strong>[당일배송]</strong> 당일배송 서비스 시작!</TD>
				</tr>
				<tr>
					<td>도착예정일</td>
					<td>지금 주문 시 내일 도착 예정</td>
				</tr>
                   </tbody>
               </table>
               <div id="totalprice">
                    <strong>총 상품금액</strong>               
                    <span>
                    	
                        <strong>                    
                            <em id="total_amount">${goods.goods_price}</em>
                        </strong>
                       원
                    </span>
                 
               </div>
                  <div id="detailbtn">
                        <button id="detailbtn_buy">BUY NOW</button>
                       	<a id="detailbtn_cart" href="javascript:add_cart('${goods.goods_id}')">CART</a>
                    </div>
            </div>
           </div>
       
       </div>
        <form   action='${pageContext.request.contextPath}/cart/myCartList.do'>				
		<input  type="submit" value="장바구니 보기">
</form> 
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
