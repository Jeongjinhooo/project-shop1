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
<!-- 총할인금액 -->
<c:set var="total_discount_price" value="0" />
<!-- 총 배송비 -->
<c:set var="total_delivery_price" value="0" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>주문하기</title>
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/order.css" rel="stylesheet" type="text/css">
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
    <script defer src="js/script.js"></script>
       <style>
   header #h_sec02 #left_icon_menu ul .menu_btn a{background: url('${pageContext.request.contextPath}/resources/img/header/all_cate_icon.png') no-repeat;}
   </style>
  </head>

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
            <h2>ORDER</h2>
          </div>
          <div id="orderinner">
            <div id="orderProduct">
              <div class="ordertitle">
                <h2>주문상품</h2>
              </div>
              <div id="order_contents">
                <div id="prdBox">
                  <div id="thumbnail">
                    <a href="">
                      <img
                        src="/img/section/7a9b01c64d317b3c5a76b0093a3e7041.jpg"
                        alt=""
                      />
                    </a>
                  </div>
                  <div id="description">
                    <strong class="prdName">
                      <a href="">상품명</a>
                    </strong>
                    <ul id="info">
                      <li>
                        <p>[옵션: C/BLUE / S]</p>
                      </li>
                      <li>수량 : 1개</li>
                      <li>상품구매금액: KRW 79,000</li>
                      <li>[무료] / 기본배송</li>
                    </ul>
                  </div>
                  <button id="btn_productdelete"></button>
                </div>
              </div>
            </div>
            <div id="shippingaddress">
              <div class="ordertitle">
                <h2>배송지</h2>
              </div>
              <div id="shipping_contents">
                <table>
                  <caption>
                    배송정보입력
                  </caption>
                  <colgroup>
                    <col style="width: 102px" />
                    <col style="width: 1000px" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>받는사람</th>
                      <td>
                        <input type="text" />
                      </td>
                    </tr>
                    <tr>
                      <th>주소</th>
                      <td>
                        <ul>
                          <li>
                            <input type="text" />
                            <button id="zipcode_searchbtn">주소검색</button>
                          </li>
                          <li>
                            <input type="text" />
                          </li>
                          <li>
                            <input type="text" />
                          </li>
                        </ul>
                      </td>
                    </tr>
                    <tr>
                      <th>휴대전화</th>
                      <td>
                        <input type="text" />
                      </td>
                    </tr>
                    <tr>
                      <th>이메일</th>
                      <td>
                        <input type="text" />
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="shipping_message">
                <select name="omessage_select" id="omessage_select">
                  <option value="oMessage-0" selected="selected">
                    --메시지 선택 (선택사항)--
                  </option>
                  <option value="oMessage-1" selected="selected">
                    배송 전에 미리 연락바랍니다.
                  </option>
                  <option value="oMessage-2" selected="selected">
                    부재 시 경비실에 맡겨주세요.
                  </option>
                  <option value="oMessage-3" selected="selected">
                    부재 시 문 앞에 놓아주세요.
                  </option>
                  <option value="oMessage-4" selected="selected">
                    빠른 배송 부탁드립니다.
                  </option>
                  <option value="oMessage-5" selected="selected">
                    택배함에 보관해 주세요.
                  </option>
                  <option value="oMessage-input" selected="selected">
                    직접입력
                  </option>
                </select>
                <div id="omessageInput">
                  <textarea name="omessage" id="omessage" cols="70"></textarea>
                </div>
              </div>
            </div>

            <div id="payment">
              <div class="ordertitle">
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
                      <th>주문상품</th>
                      <td>
                        <span>KRW 79,000</span>
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
                    <span>79,000</span>
                  </strong>
                </div>
              </div>
            </div>
            <div id="paymethod">
              <div class="ordertitle">
                <h2>결제수단</h2>
              </div>
              <div id="paymethod_contents">
                <ul>
                  <li>
                    <label for=""> 결제수단 선택</label>
                    <div id="paymethod_inner">
                      <span>
                        <input
                          id="addr_paymethod0"
                          name="addr_paymethod"
                          type="radio"
                          checked="checked"
                        />
                        <label for="addr_paymethod0">신용카드</label>
                      </span>
                      <span>
                        <input
                          id="addr_paymethod1"
                          name="addr_paymethod"
                          type="radio"
                          checked="checked"
                        />
                        <label for="addr_paymethod1">계좌이체</label>
                      </span>
                      <span>
                        <input
                          id="addr_paymethod2"
                          name="addr_paymethod"
                          type="radio"
                          checked="checked"
                        />
                        <label for="addr_paymethod2">무통장입금</label>
                      </span>
                      <span>
                        <input
                          id="addr_paymethod3"
                          name="addr_paymethod"
                          type="radio"
                          checked="checked"
                        />
                        <label for="addr_paymethod3">카카오페이</label>
                      </span>
                      <span>
                        <input
                          id="addr_paymethod0"
                          name="addr_paymethod"
                          type="radio"
                          checked="checked"
                        />
                        <label for="addr_paymethod4">네이버페이</label>
                      </span>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div id="orderbtn">
              <button>
                <span>결제하기</span>
              </button>
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
