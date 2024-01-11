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
<!-- X누르면 메인페이지로 이동 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('closeImage').addEventListener('click', function() {
        window.location.href = "${pageContext.request.contextPath}/";
    });
});
</script>

<title>회원탈퇴</title>
</head>
<body>	
	<div class="review_complete_ment">
	<img src="${pageContext.request.contextPath}/resources/img/complete_check.svg" id="check">
	<%-- X표시 누르면 main으로 이동--%> 
<%-- 	<img src="${pageContext.request.contextPath}/resources/img/complete_x.svg" id="closeImage"> --%>
	<h1 class="review_complete">회원탈퇴 완료!</h1>
    <div class="review_complete_content">지금까지 찜콩테이블을 이용해주셔서 감사합니다!<br>
    개인정보는 30일 후 자동 삭제됩니다.</div>
    
    </div>
</body>
</html>
