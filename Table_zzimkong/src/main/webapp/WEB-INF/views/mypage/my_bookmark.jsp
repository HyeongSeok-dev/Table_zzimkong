<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js">
</script>
</head>
<body>
<body>
	<header>
		<jsp:include page="../inc/top2_search_bar.jsp"/>
	</header>
	<main>
	<jsp:include page="../inc/my_sidebar.jsp" />
	<div class="wrapper">
		<div class ="title">
			<span class= "mypg">
				<h1>나의 북마크</h1>
			</span>			
			</div>
			<br><br>
			<div class="bookmark_image">
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image1.jpg" >
					</a>
				<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						83해치
				</div>
				</div>			
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image2.jpg" >
					</a>
				<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						이재모피자 부산역점
				</div>	
				</div>	
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image3.jpg" >
					</a>
				<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						아덴블랑제리 부전점
				</div>
				</div>
			</div>		
			<div class="bookmark_image">
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image4.jpg" >
					</a>
				<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						나랑히요
				</div>
				</div>	
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image5.jpg" >
					</a>
				<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						류센소
				</div>
				</div>	
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image6.jpg" >
					</a>
				<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						톤쇼우 광안점
				</div>
				</div>	
			</div>	
		</div>
	</main>		
</body>
</html>