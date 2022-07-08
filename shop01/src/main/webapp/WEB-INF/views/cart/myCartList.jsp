<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}" />
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script defer src="${pageContext.request.contextPath}/resources/js/script.js"></script>
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
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="${contextPath}/member/mypage.do">마이페이지</a></li>
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
            <h2>장바구니</h2>
          </div>
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
              <tfoot>
                <tr>
                  <td colspan="10">
                    <span class="gLeft">[기본배송]</span>
                    상품구매금액
                    <strong>
                      69000
                      <span></span>
                    </strong>
                    + 배송비
                    <span>0 (무료)</span>
                    = 합계 :
                    <strong>
                      KRW
                      <span class="txt18">69,000</span>
                    </strong>
                  </td>
                </tr>
              </tfoot>
              <tbody class="textcenter">
            <c:choose>
				    <c:when test="${ empty myCartList }">
				    <tr>
				       <td colspan=8 class="fixed">
				         <strong>장바구니에 상품이 없습니다.</strong>
				       </td>
				     </tr>
				    </c:when>
			        <c:otherwise>
			 <tr>       
               <form name="frm_order_all_cart">
				      <c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
				       <c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
				       <c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
					<td><input type="checkbox" name="checked_goods"  checked  value="${item.goods_id }"  onClick="calcGoodsPrice(${item.goods_sales_price },this)"></td>
					<td class="goods_image">
					<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
						<img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"  />
					</a>
					</td>
					<td>
						<h2>
							<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_title }</a>
						</h2>
					</td>
					<td class="price"><span>${item.goods_price }원</span></td>
					<td>
					   <strong>
					      <fmt:formatNumber  value="${item.goods_sales_price*0.9}" type="number" var="discounted_price" />
				            ${discounted_price}원(10%할인)
				         </strong>
					</td>
					<td>
					   <input type="text" id="cart_goods_qty" name="cart_goods_qty" size=3 value="${cart_goods_qty}"><br>
						<a href="javascript:modify_cart_qty(${item.goods_id },${item.goods_sales_price*0.9 },${cnt.count-1 });" >
						    <img width=25 alt=""  src="${contextPath}/resources/image/btn_modify_qty.jpg">
						</a>
					</td>
					<td>
					   <strong>
					    <fmt:formatNumber  value="${item.goods_sales_price*0.9*cart_goods_qty}" type="number" var="total_sales_price" />
				         ${total_sales_price}원
					</strong> </td>
					<td>
					      <a href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}');">
					       	<img width="75" alt=""  src="${contextPath}/resources/image/btn_order.jpg">
							</a><br>
					 	<a href="#"> 
					 	   <img width="75" alt=""
							src="${contextPath}/resources/image/btn_order_later.jpg">
						</a><br> 
						<a href="#"> 
						   <img width="75" alt=""
							src="${contextPath}/resources/image/btn_add_list.jpg">
						</A><br> 
						<a href="javascript:delete_cart_goods('${cart_id}');""> 
						   <img width="75" alt=""
							   src="${contextPath}/resources/image/btn_delete.jpg">
					   </a>
					</td>
			</tr>
				<c:set  var="totalGoodsPrice" value="${totalGoodsPrice+item.goods_sales_price*0.9*cart_goods_qty }" />
				<c:set  var="totalGoodsNum" value="${totalGoodsNum+1 }" />
			   </c:forEach>
		    
		</tbody>
	</table>
     	
	<div class="clear"></div>
	 </c:otherwise>
	</c:choose> 
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
                          <span class="txt23"> 69,000 </span>
                        </strong>
                      </div>
                    </td>
                    <td>
                      <div>
                        <strong class="txt23">+ </strong>
                        <strong class="txt16">
                          KRW
                          <span class="txt23">0 </span>
                        </strong>
                      </div>
                    </td>
                    <td>
                      <div>
                        <strong class="txt23">= </strong>
                        <strong class="txt16">
                          KRW
                          <span class="txt23">69,000 </span>
                        </strong>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div id="totalorder">
                <a href="" class="btnSubmit">전체상품주문</a>
                <a href="" class="btnSubmit">선택상품주문</a>
                <span><a href="" class="btnnormal">쇼핑계속하기</a></span>
              </div>
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
                    <a href="#"><img src="img/footer/ft_sns01.png" alt="" /></a>
                  </li>
                  <li>
                    <a href="#"><img src="img/footer/ft_sns02.png" alt="" /></a>
                  </li>
                  <li>
                    <a href="#"><img src="img/footer/ft_sns03.png" alt="" /></a>
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
