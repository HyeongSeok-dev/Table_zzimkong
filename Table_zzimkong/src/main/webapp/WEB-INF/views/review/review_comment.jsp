<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review_comment.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_detail.js"></script>
</head>
<body>
	<div class="review-actions">
		<i class="far fa-comment" id="commentIcon" style="cursor: pointer;"></i>
		<!-- Popup for commenting -->
		<div id="commentPopup" class="comment-popup">
			<div class="comment-content">
				<textarea placeholder="Write your comment here..."></textarea>
				<button id="submitComment">Submit</button>
				<button id="closePopup">Close</button>
			</div>
		</div>
	</div>
</body>
</html>