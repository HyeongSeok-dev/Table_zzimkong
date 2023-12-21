<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/complete_total.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<!-- Js -->
<!-- <script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('closeImage').addEventListener('click', function() {
        window.close();
    });
});
</script> -->
<title>회원가입</title>
</head>
<body>	
	<div class="review_complete_ment">
	<img src="${pageContext.request.contextPath}/resources/img/complete_check.svg" id="check">
<%-- 	<img src="${pageContext.request.contextPath}/resources/img/complete_x.svg" id="closeImage"> --%>
	<h1 class="review_complete">회원가입 완료!</h1>

    <div class="review_complete_content">찜콩테이블 회원가입을 축하드립니다!</div>
   	<br><br>
    <%--로그인하러가기 버튼 --%>
    <button type="button" onclick="location.href='${pageContext.request.contextPath}/login'">
    	로그인하러가기
    </button>
    
    </div>
</body>
</html>
