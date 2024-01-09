<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage2.js"></script>
</head>
<body>
<body>
	<header>
		<jsp:include page="../inc/top2.jsp"/>
	</header>
	<main>
	<jsp:include page="../inc/my_sidebar.jsp" />
	<div class="wrapper">
		<form action="my/bookmark/del" method="post">
			<div class ="title">
				<span class= "mypg">
					<h1>나의 북마크 <span class="small-text">(이름순)</span></h1>
				</span>			
			</div>
				<br><br>
				<div class="bookmark_image">
				<c:forEach var="bookmark2" items="${bookmarkList2}">
			        <div id="${bookmark2.com_id}">
			        	<a href="${pageContext.request.contextPath}/product/detail?com_id=${bookmark2.com_id}">
				           	 <img class="image_size" src="/upload/${bookmark2.com_img}">
			       		</a>
					<div id="likeButton" class="like_button" style="display: flex; align-items: center;">
					    <svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" onclick="removeBookmark2(${bookmark2.com_id})" style="margin-right: 10px;">
					        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
					    </svg>
					    ${bookmark2.com_name}
					</div>
					</div>
				</c:forEach>
				</div>
			</form>	
		</div>
	</main>		
</body>
</html>