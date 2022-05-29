<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
     <div id="h_sec01" class="flex_center">
                <div id="top_logo" class="flex_center">
                    <a href="#">
                        <img src="img/header/top_logo.png" alt="">
                    </a>
                </div>
                <ul>
                    <li><a href="#">REVIEW</a></li>
                    <li><a href="#">|</a></li>
                    <li><a href="#">STORE</a></li>
                    <li><a href="#">|</a></li>
                    <li><a href="#">NOTICE</a></li>
                    <li><a href="#">|</a></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>
            <div id="h_sec02">
                <div id="left_icon_menu">

                    <ul>
                        <li class="menu_btn"><a href="#"></a></li>
                        <li><a href="#"><img src="img/header/top_search.png" alt=""></a></li>
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
                        <li><a href="#"><img src="img/header/top_my.png" alt=""></a></li>
                        <li><a href="#"><img src="img/header/top_cart.png" alt=""></a></li>
                    </ul>
                </div>
            </div>