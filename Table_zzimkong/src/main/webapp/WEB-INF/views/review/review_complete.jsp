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
<script src="${pageContext.request.contextPath}/resources/js/review_complete.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>	
	<input type="hidden" name="com_id" value="${param.com_id}">		
	<div class="review_complete_ment">
	<img src="${pageContext.request.contextPath}/resources/img/complete_check.svg" id="check">
<%-- 	<a href="${pageContext.request.contextPath}/review/redetail?com_id=1"> --%>
	<a href="${pageContext.request.contextPath}/review/redetail?com_id=${param.com_id}">
	<img src="${pageContext.request.contextPath}/resources/img/complete_x.svg" id="closeImage">
	</a>
	<h1 class="review_complete">리뷰 쓰기 완료!</h1>
    <div class="review_complete_content">장소를 찾는 사람들에게 많은 도움이 될 거예요!</div>
    </div>
</body>
</html>