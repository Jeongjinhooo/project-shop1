<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인창</title>
    
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
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
        <div id="sectioninner">
          <div id="titleArea2">
            <h2>로그인</h2>
          </div>
           <form action="${pageContext.request.contextPath}/member/login.do" method="post">
          <div id="login">
            <fieldset>
              <legend>회원로그인</legend>
              <div class="login_title">ID</div>
              <label id="id_ePlaceholder" title="아이디">
                <input name="userid" type="text" placeholder="아이디" />
              </label>
              <div class="login_title">PASSWORD</div>
              <label id="password_ePlaceholder" title="비밀번호">
                <input name="userpw" type="password" placeholder="비밀번호" />
              </label>
              <div class="security">
                <img src="${pageContext.request.contextPath}/resources/img/section/ico_access.gif" alt="보안접속" />
                <ul>
                  <li><a href="">아이디 찾기</a></li>
                  <li><a href="">/</a></li>
                  <li><a href="">비밀번호 찾기</a></li>
                </ul>
              </div>
              <img src="" alt="" />
              <ul class="snsArea">
                <li>
                  <a
                    ><img src="" alt="" />
                    <img
                      src="${pageContext.request.contextPath}/resources/img/section/btn_naver_login.gif"
                      alt="네이버로그인"
                    />
                  </a>
                </li>
                <li>
                  <a>
                    <img
                      src="${pageContext.request.contextPath}/resources/img/section/btn_kakao_login.gif"
                      alt="카카오로그인"
                    />
                  </a>
                </li>
              </ul>
                   <button type="submit" id="loginbtn">로그인</button>
              <div class="join_box">
                아직 회원이 아니신가요?
                <br />
                회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.
                <br />
                <br />
                <a href="${pageContext.request.contextPath}/member/memberForm.do">회원가입</a>
              </div>
            </fieldset>
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
