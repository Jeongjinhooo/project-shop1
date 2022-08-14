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

section #sectioninner #orderinner #shippingaddress #shipping_message select {
  background: #fff url(${pageContext.request.contextPath}/resources/img/section/ico_select.gif) no-repeat 100% 50%;
  background-size: auto 40px;
}

   </style>
  </head>
  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      <script defer src="${pageContext.request.contextPath}/resources/js/script.js"></script>
 	 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   <script type="text/javascript">
<!--------------------------------주소검색---------------------------->
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
     
    <!---------배송메세지 직접입력 보이게 ------->
    function handleOnChange(e) {
        // 선택된 데이터 가져오기
        const value = e.value;

        // 데이터 출력
        if (value == "Messageinput") {
          document.getElementById("messageinput").classList.replace('disno', 'disbl');
        } else {
          document.getElementById("messageinput").classList.replace('disbl', 'disno');
        }
      }
     
    
    <!--------------------------------기본배송지 새로입력---------------------------->
  window.onload=function()
  {
    init();
  }

  function init(){
  	var form_order=document.form_order;
  	var h_tel=form_order.h_tel;
  	var tel=h_tel.value;
  	var select_tel=form_order.tel;
  	select_tel.value=tel;
  }    
    
	function reset_all() {
		var e_receiver_name = document.getElementById("receiver_name");
		var e_tel = document.getElementById("tel");
		var e_email = document.getElementById("email")


		var e_zipcode = document.getElementById("zipcode");
		var e_roadAddress = document.getElementById("roadAddress");
		var e_jibunAddress = document.getElementById("jibunAddress");
		var e_namujiAddress = document.getElementById("namujiAddress");

		e_receiver_name.value = "";
		e_tel.value = "";
		e_email.value = "";
		e_zipcode.value = "";
		e_roadAddress.value = "";
		e_jibunAddress.value = "";
		e_namujiAddress.value = "";
	}

	function restore_all() {
		var e_receiver_name = document.getElementById("receiver_name");

		var e_tel = document.getElementById("tel");
		var e_email = document.getElementById("email");


		var e_zipcode = document.getElementById("zipcode");
		var e_roadAddress = document.getElementById("roadAddress");
		var e_jibunAddress = document.getElementById("jibunAddress");
		var e_namujiAddress = document.getElementById("namujiAddress");

		var h_receiver_name = document.getElementById("h_receiver_name");


		var h_tel = document.getElementById("h_tel");
		var h_email = document.getElementById("h_email");


		var h_zipcode = document.getElementById("h_zipcode");
		var h_roadAddress = document.getElementById("h_roadAddress");
		var h_jibunAddress = document.getElementById("h_jibunAddress");
		var h_namujiAddress = document.getElementById("h_namujiAddress");

		e_receiver_name.value = h_receiver_name.value;


		e_tel.value = h_tel.value;
		e_email.value = h_email.value;

		e_zipcode.value = h_zipcode.value;
		e_roadAddress.value = h_roadAddress.value;
		e_jibunAddress.value = h_jibunAddress.value;
		e_namujiAddress.value = h_namujiAddress.value;

	}
	
////-------------------------------주문하기

var goods_id="";
var goods_name="";
var goods_fileName="";

var order_goods_qty;
var each_goods_price;
var total_order_goods_price;
var total_order_goods_qty;
var orderer_name;
var receiver_name;
var tel;
var receiver_tel_num;
var delivery_address;
var delivery_message;
var pay_method;

function fn_process_pay_order(){
	
	alert("최종 결제하기");
	
	goods_id="";
	goods_name="";
	
	var frm=document.form_order;
	var h_goods_id=frm.h_goods_id;
	var h_goods_name=frm.h_goods_name;
	var h_goods_fileName=frm.h_goods_fileName;
	var h_order_goods_qty=document.getElementById("h_order_goods_qty");
	var h_total_order_goods_qty=document.getElementById("h_total_order_goods_qty");
	var h_final_total_Price=document.getElementById("h_final_total_Price");
	var h_orderer_name=document.getElementById("h_orderer_name");
	var i_receiver_name=document.getElementById("receiver_name");
	
	
	if(h_goods_id.length <2 ||h_goods_id.length==null){
		goods_id+=h_goods_id.value;
	}else{
		for(var i=0; i<h_goods_id.length;i++){
			goods_id+=h_goods_id[i].value+"<br>";
			
		}	
	}
	
	if(h_goods_name.length <2 ||h_goods_name.length==null){
		goods_name+=h_goods_name.value;
	}else{
		for(var i=0; i<h_goods_name.length;i++){
			goods_name+=h_goods_name[i].value+"<br>";
			
		}	
	}
	
	
	if(h_goods_fileName.length <2 ||h_goods_fileName.length==null){
		goods_fileName+=h_goods_fileName.value;
	}else{
		for(var i=0; i<h_goods_fileName.length;i++){
			goods_fileName+=h_goods_fileName[i].value+"<br>";
			
		}	
	}
	
	
	total_order_goods_price=h_final_total_Price.value;
	total_order_goods_qty=h_total_order_goods_qty.value;
	
		
			
	var r_pay_method  =  frm.pay_method;
	
	if(r_pay_method.length <2 ||r_pay_method.length==null){
		pay_method+=r_pay_method.value;
	}else{
		for(var i=0; i<r_pay_method.length;i++){
			pay_method+=r_pay_method[i].value+"<br>";
		
		}	
	}
		
	var i_tel1=document.getElementById("tel");
	
	var i_zipcode=document.getElementById("zipcode");
	var i_roadAddress=document.getElementById("roadAddress");
	var i_jibunAddress=document.getElementById("jibunAddress");
	var i_namujiAddress=document.getElementById("namujiAddress");
	var i_delivery_message=document.getElementById("delivery_message");
	var i_pay_method=document.getElementById("pay_method");

	order_goods_qty=h_order_goods_qty.value;
	
	orderer_name=h_orderer_name.value;
	receiver_name=i_receiver_name.value;

	tel=tel.value;

	
	receiver_tel=tel;
	
	delivery_address="우편번호:"+i_zipcode.value+"<br>"+
						"도로명 주소:"+i_roadAddress.value+"<br>"+
						"[지번 주소:"+i_jibunAddress.value+"]<br>"+
								  i_namujiAddress.value;
	
	delivery_message=i_delivery_message.value;
	

	var formObj=document.createElement("form");
    var i_receiver_name=document.createElement("input");
   
   
    var i_receiver_tel=document.createElement("input");
   
    var i_delivery_address=document.createElement("input");
    var i_delivery_message=document.createElement("input");
    var i_pay_method=document.createElement("input");
   
    i_receiver_name.name="receiver_name";
    i_receiver_tel.name="receiver_tel"; 
    i_delivery_address.name="delivery_address";
    i_delivery_message.name="delivery_message";
    i_pay_method.name="pay_method"; 
    i_receiver_name.value=receiver_name;
    i_receiver_tel.value=tel;
    i_delivery_address.value=delivery_address;
    i_delivery_message.value=delivery_message;
    i_pay_method.value=pay_method;
    
    formObj.appendChild(i_receiver_name);
    formObj.appendChild(i_receiver_tel);
    formObj.appendChild(i_delivery_address);
    formObj.appendChild(i_delivery_message);   
    formObj.appendChild(i_pay_method);
  

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${pageContext.request.contextPath}/order/payToOrderGoods.do";
    formObj.submit();
   
}
</script>

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
          <form  name="form_order">	
            <div id="orderProduct">
              <div class="ordertitle">
                <h2>주문상품</h2>
              </div>
              <div id="order_contents">
              <c:forEach var="item" items="${myOrderList }">
                <div id="prdBox">
                  <div id="thumbnail">
                  
                   			  <a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					    <img width="75" alt=""  src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
					    <input   type="hidden" id="h_goods_id" name="h_goods_id" value="${item.goods_id }" />
					    <input   type="hidden" id="h_goods_fileName" name="h_goods_fileName" value="${item.goods_fileName }" />
					  </a>
                  </div>
                  <div id="description">
                    <strong >
                        <a class="prdName" href="${pageContext.request.contextPath}/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_name }</a>
					      <input   type="hidden" id="h_goods_name" name="h_goods_name" value="${item.goods_name }" />
                    </strong>
                    <ul id="info">
                      <li>
                        <p>[옵션: ${item.goods_color} / ${item.order_goods_size}]</p>
                      </li>
                      <li>  수량 : ${item.order_goods_qty }개
					    <input   type="hidden" id="h_order_goods_qty" name="h_order_goods_qty" value="${item.order_goods_qty}" />
					    </li>
                   
                      <li>
                      상품구매금액 : KRW ${item.goods_price * item.order_goods_qty}
                       <input  type="hidden" id="h_each_goods_price"  name="h_each_goods_price" value="${item.goods_price * item.order_goods_qty}" />
                      </li>                   
					 
                      <li>[무료] / 기본배송</li>
                    </ul>
                  </div>
                  <button id="btn_productdelete"></button>
                </div>
                	<c:set var="final_total_order_price"
				value="${final_total_order_price+ item.goods_price* item.order_goods_qty}" />
			<c:set var="total_order_price"
				value="${total_order_price+ item.goods_price* item.order_goods_qty}" />
			<c:set var="total_order_goods_qty"
				value="${total_order_goods_qty+item.order_goods_qty }" />
                </c:forEach>
              </div>
            </div>
            
             <div id="ordererInfo">
              <div class="ordertitle">
                <h2>주문자 정보</h2>
              </div>
              <div id="ordererInfo_contents">
                <table>
                  <caption>
                    주문자 정보
                  </caption>
                  <colgroup>
                    <col style="width: 102px" />
                    <col style="width: 1000px" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>주문자</th>
                      <td>
                        <input  type="text" value="${orderer.username}" size="15" />
                      </td>
                    </tr>  
                    <tr>               
                      <th>전화번호</th>
                      <td>
                            <input  type="text" value="${orderer.tel}" size="15" />
                      </td>
                    </tr>
                    <tr>
                      <th>이메일</th>
                      <td>
                             <input  type="text" value="${orderer.email}" size="15" />
                      </td>
                    </tr>
                  </tbody>
                </table>
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
                   <tr id="shipping_select">
                      <th>배송지 선택</th>
                      <td>
                        <input type="radio" name="delivery_place"
						onClick="restore_all()" value="기본배송지" checked>
           기본배송지 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="delivery_place" value="새로입력" onClick="reset_all()">
           새로입력 

                      </td>
                    </tr>
                    <tr>
                      <th>받는사람</th>
                      <td>
                     <input id="receiver_name" name="receiver_name" type="text" size="40" value="${orderer.username }" />
					   <input type="hidden" id="h_orderer_name" name="h_orderer_name"  value="${orderer.username }" /> 
					   <input type="hidden" id="h_receiver_name" name="h_receiver_name"  value="${orderer.username }" /> 
                      </td>
                    </tr>
                    <tr>
                      <th>주소</th>
                      <td>
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
						 </li> 
                        </ul>
                      </td>
                    </tr>
                    <tr>
                      <th>휴대전화</th>
                      <td>
                  		 <input size="10px" type="text" id="tel" name="tel" value="${orderer.tel }"> 
                        		  <input type="hidden" id="h_tel" name="h_tel" value="${orderer.tel}" /> 
                        	  <c:set  var="orderer_tel" value="${orderer.tel}"/>
                      </td>
                    </tr>
                    <tr>
                      <th>이메일</th>
                      <td>
                      	 <input  type="text" id="email" name="email" value="${orderer.email}" size="15" />
                      	  <input  type="hidden" id="h_email" name="h_email" value="${orderer.email}"/>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            <div id="shipping_message">
                <select name="delivery_message" id="delivery_message" onchange="handleOnChange(this)">
                  <option value="Message0" selected="selected">
                    --메시지 선택 (선택사항)--
                  </option>
                  <option value="Message1">
                    배송 전에 미리 연락바랍니다.
                  </option>
                  <option value="Message2">
                    부재 시 경비실에 맡겨주세요.
                  </option>
                  <option value="Message3">
                    부재 시 문 앞에 놓아주세요.
                  </option>
                  <option value="Message4"">
                    빠른 배송 부탁드립니다.
                  </option>
                  <option value="Message5">
                    택배함에 보관해 주세요.
                  </option>
                  <option value="Messageinput">
                    직접입력
                    
                  </option>
                </select>
                <div id="messageinput" class="disno">
                   			   <input id="directinput" name="directinput" type="text" size="50"
						                   placeholder="택배 기사님께 전달할 메시지를 남겨주세요." />
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
                      <th>주문상품수</th>
                      <td>				
                      	<span id="p_totalNum">${total_order_goods_qty} 개</span> 
              	<input id="h_total_order_goods_qty" type="hidden" value="${total_order_goods_qty}" />        
                      </td>
                    </tr>
                    
                    <tr>
                      <th>주문상품금액</th>
                      <td>
                      	<span id="p_totalPrice">KRW ${total_order_price}</span> 
               <input id="h_totalPrice" type="hidden" value="${total_order_price}" />           
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
                    <span>${final_total_order_price}원</span>                   		
				<input id="h_final_total_Price" type="hidden" value="${final_total_order_price}" />
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
                          id="paymethod"
                          name="paymethod"
                          type="radio"
                          checked="checked"
                          value="통합결제"
                        />
                        <label for="paymethod0">통합결제</label>
                      </span>
                 <!--    <span>
                        <input
                          id="paymethod"
                          name="paymethod"
                          type="radio"
                 
                        />
                        <label for="paymethod1">계좌이체</label>
                      </span> -->
                      <span>
                        <input
                          id="paymethod"
                          name="paymethod"
                          type="radio"
               		      value="무통장 입금"
                        />
                        <label for="paymethod2">무통장입금</label>
                      </span>
             <!--          <span>
                        <input
                          id="paymethod"
                          name="paymethod"
                          type="radio"
                      
                        />
                        <label for="paymethod3">카카오페이</label>
                      </span>
                      <span>
                        <input
                          id="paymethod"
                          name="paymethod"
                          type="radio"
                       
                        />
                        <label for="paymethod">네이버페이</label>
                      </span> -->
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div id="orderbtn">
              <button onClick="fn_process_pay_order()">
                <span>결제하기</span>
              </button>
            </div>
             </form>
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