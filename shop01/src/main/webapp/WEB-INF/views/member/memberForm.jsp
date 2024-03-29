<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입창</title>
    
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/memberForm.css" rel="stylesheet" type="text/css">
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
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript">

<!-- 다음 주소검색-->
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('roadAddress').value = fullRoadAddr;
      document.getElementById('jibunAddress').value = data.jibunAddress;
      window.close();
      
      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
    	  self.close()  
      }
      
    }
  }).open();
}

function fn_overlapped(){
    var _id=$("#_userid").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#idCheck').prop("disabled", true);
       	    $('#_userid').prop("disabled", true);
       	    $('#userid').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }	
</script>
</head>
  <body style="overflow-x: hidden">
    <div id="wrap">
      <!-- header--------------------------------------------------------------- -->
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
          
          <form action="${pageContext.request.contextPath}/member/addMember.do" method="post">
          <table>
            <tbody>
              <tr>
                <th>
                  아이디
                  <img src="${pageContext.request.contextPath}/resources/img/section/ico_required.gif" alt="필수" />
                </th>
                <td>
                  <input type="text" name="_userid" id="_userid" size="20"/>
                  <input type="hidden" name="userid" id="userid"/>
                  (영문소문자/숫자, 4~16자)
                  	<input type="button"  id="idCheck" value="ID 중복체크" onClick="fn_overlapped()" />
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
   <!--                <input class="input2" type="text" name="useraddress" /> -->
   <ul>
					   <li>
                           <input type="text" id="zipcode" name="zipcode" size="5"
						value="${orderer.zipcode }"> 
						 <input type="hidden" id="h_zipcode" name="h_zipcode" value="${orderer.zipcode }" /> 
                           	<a id="zipcode_searchbtn" href="javascript:execDaumPostcode()">주소검색</a>     
                           	             
                          </li>
                          <li>
                            <input type="text" id="roadAddress" name="roadAddress" size="50" value="${orderer.roadAddress }" />
                            		 <input type="hidden"  id="h_roadAddress" name="h_roadAddress"  value="${orderer.roadAddress }" /> 
                          </li>
                          <li>
                            <input type="hidden" id="jibunAddress" name="jibunAddress" size="50"
								              value="${orderer.jibunAddress }" />
								              	 <input type="hidden"  id="h_jibunAddress" name="h_jibunAddress" value="${orderer.jibunAddress }" /> 
								              	         </li>
								              	         <li>
							  <input type="text" id="namujiAddress"  name="namujiAddress" size="50"
								     value="${orderer.namujiAddress }" />                                     											
						 <input type="hidden"  id="h_namujiAddress" name="h_namujiAddress" value="${orderer.namujiAddress }" /> 
						 </ul>
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
