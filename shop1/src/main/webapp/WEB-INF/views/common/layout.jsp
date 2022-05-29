<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
   <link href="${contextPath}/resources/css/section.css" rel="stylesheet" type="text/css" media="screen">
   <link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
   <link href="${contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" media="screen">
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="${contextPath}/resources/js/script.js" type="text/javascript"></script>
</head>
<body style="overflow-x: hidden">
	 <div id="wrap">
	 		<header>
				   <tiles:insertAttribute name="header" />
			</header>
			
			<footer>
        		<tiles:insertAttribute name="footer" />
        	</footer>
	 
	 </div>
</body >
</html>