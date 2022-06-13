<%@page contentType="text/html; charset=UTF-8"%>
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
          			   <li><a href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a></li>
            <li><a href="#">|</a></li>
        <li><a href="${pageContext.request.contextPath}/member/memberForm.do">회원가입</a></li>
            <li><a href="#">|</a></li>
            <li><a href="#">고객센터</a></li>
  <!--           <li><a href="#">|</a></li>
            <li><a href="#">FAQ</a></li> -->
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
                       <img src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
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
						src="${contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
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
						<fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		       		   ${goods_price}원
					</span>
               </div>
               <table>
                   <caption>상품옵션</caption>
                   <tbody>
                       <tr>
                           <th>색상</th>
                           <td>
                               <ul>
                                   <li>
                                       <a href="">
                                        <span>COLOR</span>
                                      </a>
                                    </li>
                               </ul>
                               <p>
                                           [필수] 
                                           <span>
                                               색상을 먼저 선택해주세요
                                           </span>
                                       </p>
                           </td>
                       </tr>
                   </tbody>
                   <tbody>
                       <tr>
                           <th>사이즈</th>
                           <td>
                               <ul>
                                   <li> 
                                       <a href="">
                                         <span>S</span>
                                       </a>
                                    </li>
                                    <li> 
                                       <a href="">
                                         <span>M</span>
                                       </a>
                                    </li>
                                    <li> 
                                       <a href="">
                                         <span>L</span>
                                       </a>
                                    </li>
                                    <li> 
                                       <a href="">
                                         <span>XL</span>
                                       </a>
                                    </li>
                               </ul>
                               <p>
                                   [필수]
                                   <span>
                                       색상을 먼저 선택해주세요
                                   </span>
                               </p>
                           </td>
                       </tr>
                       <tr>
                           <th>수량</th>
                           <td>
                                <select style="width: 60px;" id="order_goods_qty">
				                     <option>1</option>
						        	<option>2</option>
						        	<option>3</option>
						          	<option>4</option>
						        	<option>5</option>
			                   </select>
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
                    (수량) : 
                    <span>
                        <strong>
                            <em>KRW 0</em>
                             (0개)
                        </strong>
                    </span>
                 
               </div>
                  <div id="detailbtn">
                        <button id="detailbtn_buy">BUY NOW</button>
                        <button id="detailbtn_cart">CART</button>
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
