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
    <link href="${pageContext.request.contextPath}/resources/css/myPageMain.css" rel="stylesheet" type="text/css">
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
   	 
 <!-- 주문취소메세지--------------------- -->
  <c:if test="${message=='cancel_order'}">
	<script>
	window.onload=function()
	{
	  init();
	}
	
	function init(){
		alert("주문을 취소했습니다.");
	}
	</script>
</c:if>
 <script type="text/javascript">
<!-- 주문취소--------------------- -->
function fn_cancel_order(order_id){
	var answer=confirm("주문을 취소하시겠습니까?");
	if(answer==true){
		var formObj=document.createElement("form");
		var i_order_id = document.createElement("input"); 
	    
	    i_order_id.name="order_id";
	    i_order_id.value=order_id;
		
	    formObj.appendChild(i_order_id);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${pageContext.request.contextPath}/mypage/cancelMyOrder.do";
	    formObj.submit();	
	}
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
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="${pageContext.request.contextPath}/mypage/myPageMain.do">마이페이지</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="${contextPath}/cart/myCartList.do">장바구니</a></li>
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
            <h2>MY PAGE</h2>
          </div>
          <div id="myPagecommon">
            <div>
              <h2>${memberInfo.userid }</h2>
              <p>마이페이지</p>
            </div>
            <ul>
              <li>
                <strong class="mptitle">적립금</strong>
                <strong class="mpdata">0</strong>
              </li>
              <li>
                <strong class="mptitle">포인트</strong>
                <strong class="mpdata">0</strong>
              </li>
              <li>
                <strong class="mptitle">쿠폰</strong>
                <strong class="mpdata">0</strong>
              </li>
              <li>
                <strong class="mptitle">총주문</strong>
                <strong class="mpdata">0</strong>
              </li>
            </ul>
          </div>
          <div id="myPageMain">
            <!-- 네비게이션 -->
            <nav>
              <div>
                <h3>MY PAGE</h3>
                <a href="${pageContext.request.contextPath}/mypage/myPageMain.do">주문 내역 조회</a>
                <a href="">반품/교환 신청 및 조회</a>
                <a href="">취소 주문 내역</a>
                <a href="${pageContext.request.contextPath}/mypage/myDetailInfo.do">회원정보관리</a>
              </div>
            </nav>
   <!-- 주문내역*--------- -->
            <div id="myorderInfo">
              <h3>주문내역조회</h3>
               <table>
              <colgroup>
            <col style="width: 120px" />
                <col style="width: 140px" />
                <col style="width: 700px" />
                <col style="width: 130px" />
                <col style="width: 150px" />
                <col style="width: 140px" />
                <col style="width: 140px" />
              </colgroup>
              <thead>
                <tr>
                  <th scope="col">
                    주문일자
                    <br>
                    [주문번호]
                  </th>
                  <th scope="col">이미지</th>
                  <th scope="col">상품정보</th>
                  <th scope="col">수량</th>
                  <th scope="col">상품구매금액</th>             
                  <th scope="col">주문처리상태</th>
                  <th scope="col">주문취소</th>          
                </tr>                
              </thead>
              <tbody class="textcenter">
               <c:choose>
         <c:when test="${ empty myOrderList  }">
		  <tr>
		    <td colspan=5 class="fixed">
				  <strong>주문한 상품이 없습니다.</strong>
		    </td>
		  </tr>
		     
        </c:when>
        	<c:otherwise>
	    	  <c:forEach var="item" items="${myOrderList }"  varStatus="i">
	     	  <c:choose> 
              <c:when test="${ pre_order_id != item.order_id}">
                <c:choose>
	              <c:when test="${item.delivery_state=='delivery_prepared' }">
	                <tr  bgcolor="lightgreen">    
	              </c:when>
	              <c:when test="${item.delivery_state=='finished_delivering' }">
	                <tr  bgcolor="lightgray">    
	              </c:when>
	              <c:otherwise>
	                <tr  bgcolor="orange">   
	              </c:otherwise>
	          </c:choose> 
           
           
			  <tr>
              	<td>
                <a href="${pageContext.request.contextPath}/mypage/myOrderDetail.do?order_id=${item.order_id}"><span>${item.order_id}</span>  </a>
                <p>${item.pay_order_time}</p>
              </td>
                  <td>
                    <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
						<img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"  />
                    </a>
                  </td>
                  <td class="textleft pdleft10">
                    <strong>
                    			
			    
			            <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_name }</a><br>
			        
			
				    </strong>
                    <ul>
                      <li>[색상 : ${item.goods_color}]<br>
                          [사이즈 : ${item.order_goods_size}]
                          <input type="hidden" name="goods_size" id="goods_size" value="${goods_size}"/>
                          
                      </li>
                    </ul>
                  </td>
                  <td>    
                     ${item.order_goods_qty}개
                  </td>
                  <td>
                    <div>
                    <strong>					  
                      ${item.goods_price*item.order_goods_qty}원
					</strong>
                    </div>
                  </td>
              
                  <td>
                      <c:choose>
			    <c:when test="${item.delivery_state=='delivery_prepared' }">
			       배송준비중
			    </c:when>
			    <c:when test="${item.delivery_state=='delivering' }">
			       배송중
			    </c:when>
			    <c:when test="${item.delivery_state=='finished_delivering' }">
			       배송완료
			    </c:when>
			    <c:when test="${item.delivery_state=='cancel_order' }">
			       주문취소
			    </c:when>
			    <c:when test="${item.delivery_state=='returning_goods' }">
			       반품완료
			    </c:when>
			  </c:choose>
                  </td>
                  <td>
             <c:choose>
			   <c:when test="${item.delivery_state=='delivery_prepared'}">
			       <input  type="button" class="btnnormal" onClick="fn_cancel_order('${item.order_id}')" value="주문취소"  />
			   </c:when>
			   <c:otherwise>
			      <input  class="btnnormal"type="button" onClick="fn_cancel_order('${item.order_id}')" value="주문취소" disabled />
			   </c:otherwise>
			  </c:choose>                                
                  </td>
                </tr>
                   <c:set  var="pre_order_id" value="${item.order_id}" />
           </c:when>
      </c:choose>
	   </c:forEach>
	  </c:otherwise>
    </c:choose> 	    
              </tbody>
            </table>
            </div>
          </div>
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
