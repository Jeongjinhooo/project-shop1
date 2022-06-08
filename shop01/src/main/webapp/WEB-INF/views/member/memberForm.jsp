<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입창</title>
    
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/insert.css" rel="stylesheet" type="text/css">
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
        <div id="sectioninner">
          <div id="titleArea2">
            <h2>회원가입</h2>
          </div>

          <h3>기본정보</h3>
          <p>
            <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" /> 필수입력사항
          </p>
          
          <form action="${pageContext.request.contextPath}/member/insert.do" method="post">
          <table>
            <tbody>
              <tr>
                <th>
                  아이디
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input type="text" name="userid" />
                  (영문소문자/숫자, 4~16자)
                     <button id = "idCheck">ID 중복체크</button>
                </td>
              </tr>
              <tr>
                <th>
                  비밀번호
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input type="password" name="userpw"/>
                  (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
                </td>
              </tr>
              <tr>
                <th>
                  비밀번호 확인
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input type="password" />
                </td>
              </tr>
              <tr>
                <th>
                  이름
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input type="text" name="username" />
                </td>
              </tr>
              <tr>
                <th>
                  주소
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input class="input2" type="text" name="useraddress" />
                </td>
              </tr>
              <tr>
                <th>
                  이메일
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input class="input2" type="email" name="email"/>
                </td>
              </tr>
              <tr>
                <th>
                  전화번호
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input class="input2" type="tel" name="tel"/>
                </td>
              </tr>
              <tr>
                <th>
                  생년월일
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input class="input2" type="date" name="birthDate"/>
                </td>
              </tr>
            </tbody>
          </table>
          <div id="titleArea3">약관동의</div>
          <div id="AllCheckbox">
            <p>
              <span><input type="checkbox" /></span>
              <label for=""
                >이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두
                동의합니다.
              </label>
            </p>
          </div>
          <div id="Linebox">
            <div>
              <p>
                <input type="checkbox" />
                <label for=""> [필수] 이용약관 동의 </label>
                <span>약관보기</span>
              </p>
            </div>
            <div>
              <p>
                <input type="checkbox" />
                <label for=""> [필수] 개인정보 수집 및 이용 동의 </label>
                <span>약관보기</span>
              </p>
            </div>
            <div>
              <p>
                <input type="checkbox" />
                <label for=""> [선택] SMS 수신 동의 </label>
                <input type="checkbox" />
                <label for=""> [선택] 이메일 수신 동의 </label>
                <span>약관보기</span>
              </p>
            </div>

        
          <div id="joinbtn">
                   <button type="submit">회원가입</button>
            </div>
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
