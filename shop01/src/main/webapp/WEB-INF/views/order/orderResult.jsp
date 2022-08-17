<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!-- 주문자 휴대폰 번호 -->
<c:set  var="orderer_hp" value=""/>
<!-- 최종 결제 금액 -->
<c:set var="final_total_order_price" value="0" />
<!-- 총주문 금액 -->
<c:set var="total_order_price" value="0" />
<!-- 총 상품수 -->
<c:set var="total_order_goods_qty" value="0" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>주문하기</title>
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/orderResult.css" rel="stylesheet" type="text/css">
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

    <!-- font-family: "Montserrat", sans-serif; -->
       <style>
   header #h_sec02 #left_icon_menu ul .menu_btn a{background: url('${pageContext.request.contextPath}/resources/img/header/all_cate_icon.png') no-repeat;}
   section
  #sectioninner
  #orderinner
  #paymethod
  #paymethod_contents
  ul
  li
  #paymethod_inner
  span
  input[type="radio"] {
  margin: 0;
  width: 25px;
  height: 25px;
  border: 0;
  cursor: pointer;
  background: url(${pageContext.request.contextPath}/resources/img/section/bg_radio.png) no-repeat 0 0;
  background-size: 25px 25px;
  -webkit-appearance: none;
}

section
  #sectioninner
  #orderinner
  #paymethod
  #paymethod_contents
  ul
  li
  #paymethod_inner
  span
  input:not(:disabled):checked[type="radio"] {
  background-image: url(${pageContext.request.contextPath}/resources/img/section/bg_radio_checked.png);
  -webkit-appearance: none;
}

section #sectioninner #orderinner #resultarea::after {
  position: absolute;
  top: 100%;
  left: 0;
  display: block;
  content: "";
  width: 100%;
  height: 5px;
  background: url(${pageContext.request.contextPath}/resources/img/section/bg_resultarea.png) repeat-x 0 bottom;
  background-size: auto 5px;
}

section #sectioninner #orderinner #resultarea p {
  padding: 56px 0 13px;
  text-align: center;
  font-size: 18px;
  color: #333;
  line-height: 26px;
  background: url(${pageContext.request.contextPath}/resources/img/section/ico_resultarea_message.png) no-repeat center 0;
  background-size: 38px 42px;
}

   </style>
  </head>
  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      <script defer src="${pageContext.request.contextPath}/resources/js/script.js"></script>
 	 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>


  <body style="overflow-x: hidden">
    <div id="wrap">
      <!-- header--------------------------------------------------------- -->
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
        <div id="sectioninner">
          <div id="titleArea2">
            <h2>주문완료</h2>
          </div>
          <div id="orderinner">
            <div id="resultarea">
              <p>
                <strong>
                  고객님의 주문이
                  <br />
                  정상적으로 완료되었습니다
                </strong>
              </p>
              <div id="resultInfo">
                <div>
                  <table>
                    <caption>
                      주문정보
                    </caption>
                    <colgroup>
                      <col style="width: 94px" />
                      <col style="width: auto" />
                      <col style="width: auto" />
                    </colgroup>
                    <tbody>
                      
                      <tr>
                        <th style="line-height: 49px">결제수단</th>
                        <td>
                          <span>무통장입금</span>
                          <br />
                          <span>입금자 : 정진호, 계좌번호 : 국민은행 80590104363437
                            ((주)한성에프아이)
                          </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div id="orderProduct">
              <div class="ordertitle resulttitle">
                <h2>주문상품</h2>
              </div>
              <div id="order_contents">
              		<c:forEach var="item" items="${myOrderList }">
                <div id="prdBox">
                  <div id="thumbnail">
                	  <a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					    <img width="75" alt=""  src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
					    </a>
                  </div>
                  <div id="description">
                    <strong class="prdName">
             <a class="prdName" href="${pageContext.request.contextPath}/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_name }</a>
                    </strong>
                    <ul id="info">
                      <li>
                        <p>[옵션: ${item.goods_color} / ${item.order_goods_size}]</p>
                      </li>
                      <li>수량 : ${item.order_goods_qty }개</li>
                      <li> 상품구매금액 : KRW ${item.goods_price * item.order_goods_qty}</li>
                      <li>[무료] / 기본배송</li>
                    </ul>
                  </div>
                </div>
                            	<c:set var="final_total_order_price"
				value="${final_total_order_price+ item.goods_price* item.order_goods_qty}" />
			<c:set var="total_order_price"
				value="${total_order_price+ item.goods_price* item.order_goods_qty}" />
			<c:set var="total_order_goods_qty"
				value="${total_order_goods_qty+item.order_goods_qty }" />
				<c:set var="order_id"  value="${item.order_id}"  />
                		</c:forEach>
              </div>
            </div>

            <div id="deliveryInfo">
              <div class="ordertitle resulttitle">
                <h2>배송지</h2>
              </div>
              <div id="delivery_contents">
                <table>
                  <caption>
                    배송지정보
                  </caption>
                  <colgroup>
                    <col style="width: 94px" />
                    <col style="width: auto" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>받는사람</th>
                      <td>${myOrderInfo.receiver_name }
                     </td>
                      
                    </tr>
                    <tr>
                      <th>주소</th>
                      <td> ${myOrderInfo.delivery_address}</td>
                    </tr>
                    <tr>
                      <th>연락처</th>
                      <td>	  ${myOrderInfo.receiver_tel}</td>
                    </tr>
                    <tr>
                      <th>배송요청</th>
                      <td>${myOrderInfo.delivery_message}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <div id="payment">
              <div class="ordertitle resulttitle">
                <h2>결제정보</h2>
              </div>
              <div id="payment_contents">
                <div>
                  <table>
                    <caption>
                      결제정보 상세
                    </caption>
                    <colgroup>
                      <col style="width: 122px" />
                      <col style="width: 878px" />
                    </colgroup>
                                <tr>
                      <th>주문번호</th>
                      <td>				
                      	<span>${order_id}</span> 
                      </td>
                    </tr>
                                    <tr>
                      <th>주문상품수</th>
                      <td>				
                      	<span>${total_order_goods_qty} 개</span> 
                      </td>
                    </tr>
                    <tr>
                      <th>주문상품</th>
                       <td>
                      	<span>KRW ${total_order_price}</span> 
                      </td>
                    </tr>
                    <tr>
                      <th>할인/부가결제</th>
                      <td>
                        -
                        <span>KRW 0</span>
                      </td>
                    </tr>
                    <tr>
                      <th>배송비</th>
                      <td>
                        +
                        <span>KRW 0</span>
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="totalPay">
                  <h3>결제금액</h3>
                  <strong>
                    KRW
                <span>${final_total_order_price}</span>   
                  </strong>
                </div>
              </div>
            </div>

            <div id="orderresultbtn">
              <button>주문확인하기</button>
              <button onclick="location.href='${pageContext.request.contextPath}/main.do'">쇼핑계속하기</button>
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
