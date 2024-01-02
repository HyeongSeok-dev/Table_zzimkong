<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>


</head>
<body>
	<header>
		<jsp:include page="../inc/top2_search_bar.jsp"/>
	</header>
	<main>
	<div align="center">
	<br><br><br><br><br><br>
	<h1>본인 인증</h1>
	<br><br>
		
	<h5>회원가입을 위한 휴대폰 본인 인증을 진행해 주세요.</h5>
	<button type="submit" id="api">본인 인증</button>
	<button type="button" id="my_delete" >취소</button>
	</div>
	</main>
</body>
</html>