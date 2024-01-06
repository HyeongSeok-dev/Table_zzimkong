<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review_comment.css">
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/resources/css/global.css"> --%>
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_comment.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="comment-header">
    <h3>${comName}</h3>
</div><!-- <div class="review-button"  id="closeButton"> -->
<%--     <img src="${pageContext.request.contextPath}/resources/img/comment_close.png" alt="닫기"  />  --%>
<!-- </div> -->
</div>
	<p class="no-comments">등록된 댓글이 없습니다.</p>
<div class="comment-container">
	<hr class="separator">
	
    <div class="comment-box" contenteditable="true" placeholder="리뷰에 따뜻한 댓글을 달아주세요."></div>
    <button class="submit-comment">등록</button>
</div>
</body>
</html>