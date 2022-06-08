<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
	<link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/section.css">
    <link rel="stylesheet" href="resources/css/footer.css">
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script defer src="resources/js/script.js"></script>
   <style>
   header #h_sec02 #left_icon_menu ul .menu_btn a{background: url('resources/img/header/all_cate_icon.png') no-repeat;}
   </style>
</head>
<body style="overflow-x: hidden">
    <div id="wrap">
        <!-- header--------------------------------------------------------- -->
               <header>
            <div id="h_sec01" class="flex_center">
                <div id="top_logo" class="flex_center">
                    <a href="${pageContext.request.contextPath}/main.do">
                        <img src="resources/img/header/top_logo.png" alt="">
                    </a>
                </div>
              <ul>
		   <c:choose>
		     <c:when test="${isLogOn==true and not empty memberInfo }">
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="${contextPath}/member.insert.do">마이페이지</a></li>
			   <li><a href="#">|</a></li>
			   <li><a href="#">장바구니</a></li>
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
                        <li><a href="#"><img src="resources/img/header/top_search.png" alt=""></a></li>
                    </ul>

                </div>
                <div id="hcategory">
                    <ul id="mainmenu">
                        <li>NEW ARRIVALS
                            <ul class="submenu hidden">
                                <li>22S</li>

                            </ul>
                        </li>
                        <li>MEN
                            <ul class="submenu hidden">

                                <li>상의</li>
                                <li>하의</li>
                                <li>셋업</li>
                                <li>아우터</li>

                            </ul>
                        </li>
                        <li>WOMEN
                            <ul class="submenu hidden">
                                <li>상의</li>
                                <li>하의</li>
                                <li>셋업</li>
                                <li>아우터</li>
                            </ul>
                        </li>
                        <li>ACC
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
                                  <img src="resources/img/header/top_cart.png" alt="">
                              </a>
                        
                        </li>
                        <li id="loginmenu">
                            <a href="#">
                               <img src="resources/img/header/top_my.png" alt="">
                               
                               <%-- <ul class="toplogin">
                               <c:choose> <!-- 로그인시 로그아웃 표시 -->
                                <c:when test="${isLogOn==true and not empty memberInfo}">
                                <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
                                <li><a href="${contextPath}/member/insert.do">마이페이지</a></li>
                                <li><a href="#">주문조회</a></li>
                                <li><a href="#">고객센터</a></li>
                                </c:when>
                                 <c:otherwise> <!-- 로그아웃시 로그인 표시 -->
                                      <li><a href="${pageContext.request.contextPath}/member/loginForm.do"">로그인</a></li>
                                <li><a href="${pageContext.request.contextPath}/member/memberForm.do">회원가입</a></li>
                                <li><a href="">주문조회</a></li>
                                <li><a href="">고객센터</a></li>
                                  </c:otherwise>
                                  </c:choose>
                                  <!-- 관리자로 로그인시 관리자 표시 -->
                                  <c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">  
	 		  	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
								    </c:if> 
                            </ul> --%>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>


        <!-- section ------------------------------------------------------->
        <section>
            <div id="slider">
                <div id="sliderinner">
                    <div><img src="resources/img/section/main_visual_rashguard.jpg" alt=""></div>
                    <div><img src="resources/img/section/main_visual_22SS.jpg" alt=""></div>
                    <div><img src="resources/img/section/micro_1_3.jpg" alt=""></div>
                </div>
            </div>


            <div id="main_goods">
                <div id="main_goodsinner">
                    <div id="m_title">
                        <div id="m_titlel">NEW ARRIVALS</div>
                        <div id="m_titler">
                            <ul>
                                <li>TOP </li>
                                <li>OUTER </li>
                                <li>BOTTOM </li>
                                <li>ACC</li>
                            </ul>
                        </div>
                    </div>
                    <div class="m_box">
                        <div class="tumnail">
                            <a href="">
                                <img src="" alt="">
                            </a>
                        </div>
                        <div class="description">
                            <div>
                                <div class="name"></div>
                                <div class="price"></div>
                            </div>
                        </div>
                    </div>
                    <div class="m_box">
                         <div class="tumnail">
                            <a href="">
                                <img src="" alt="">
                            </a>
                        </div>
                        <div class="description">
                            <div>
                                <div class="name"></div>
                                <div class="price"></div>
                            </div>
                        </div>
                    </div>
                    <div class="m_box">
                         <div class="tumnail">
                            <a href="">
                                <img src="" alt="">
                            </a>
                        </div>
                        <div class="description">
                            <div>
                                <div class="name"></div>
                                <div class="price"></div>
                            </div>
                        </div>
                    </div>
                    <div class="m_box">
                         <div class="tumnail">
                            <a href="">
                                <img src="" alt="">
                            </a>
                        </div>
                        <div class="description">
                            <div>
                                <div class="name"></div>
                                <div class="price"></div>
                            </div>
                        </div>
                    </div>
                    <div class="m_box">
                         <div class="tumnail">
                            <a href="">
                                <img src="" alt="">
                            </a>
                        </div>
                        <div class="description">
                            <div>
                                <div class="name"></div>
                                <div class="price"></div>
                            </div>
                        </div>
                    </div>
                    <div class="m_box">
                         <div class="tumnail">
                            <a href="">
                                <img src="" alt="">
                            </a>
                        </div>
                        <div class="description">
                            <div>
                                <div class="name"></div>
                                <div class="price"></div>
                            </div>
                        </div>
                    </div>
                    <div class="m_box">
                         <div class="tumnail">
                            <a href="">
                                <img src="" alt="">
                            </a>
                        </div>
                        <div class="description">
                            <div>
                                <div class="name"></div>
                                <div class="price"></div>
                            </div>
                        </div>
                    </div>
                    <div class="m_box">
                         <div class="tumnail">
                            <a href="">
                                <img src="" alt="">
                            </a>
                        </div>
                        <div class="description">
                            <div>
                                <div class="name"></div>
                                <div class="price"></div>
                            </div>
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
                            <p>평일 10:00 ~ 18:00 / 점심시간 12:00 ~ 13:30 / 주말, 공휴일 휴무</p>
                        </div>
                        <div id="ft_info">
                            주식회사 에프에프에프<span></span> 대표 : 정진호<span></span> 주소 : 대전광역시 서구 탄방동 0000 <span></span> 사업자등록번호
                            : 123-00-00000<br>
                            통신판매업신고번호 : 0000-대전둔산동-0000<span></span> 대표번호 : 070-0000-0000<span></span> 개인정보관리책임자 :
                            정진호<span></span> 이메일 : test11@gmail.com
                        </div>
                        <div id="ft_copy">
                            COPYRIGHT ⓒ 주식회사 에프에프에프 . ALL RIGHTS RESERVED.
                        </div>
                        <div id="ft_sns">
                            <ul>
                                <li><a href="#"><img src="resources/img/footer/ft_sns01.png" alt=""></a></li>
                                <li><a href="#"><img src="resources/img/footer/ft_sns02.png" alt=""></a></li>
                                <li><a href="#"><img src="resources/img/footer/ft_sns03.png" alt=""></a></li>
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