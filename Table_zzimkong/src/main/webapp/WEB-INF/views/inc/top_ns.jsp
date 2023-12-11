<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>

<link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>

	<div class="header-container">
		<div class="header-content">
			<!-- 메인로고 -->
			<div class="logo-container">
				<a href="./"> <img class="logo-img" src="${pageContext.request.contextPath}/resources/img/logo_top.png"
					alt="메인로고">
				</a>
			</div>

			<div class="search-bar-wrapper">
			</div>
			
			<div class="auth-icons">
				<!-- 알림아이콘 -->
				<a class="icon-notification" href=""> <i style='font-size: 24px' class='far'>&#xf0f3;</i>
				</a>
				<!-- 로그인아이콘 -->
				<a class="icon-login" href="${pageContext.request.contextPath}/login/login.jsp"> <i style='font-size: 24px'
					class='far'>&#xf007;</i>
				</a>
				<!-- 드롭다운 메뉴 -->
				<div class="dropdown_menu">
					<button class="dropdown-button">
						<i style='font-size: 24px' class='fas'>&#xf0c9;</i>
					</button>
					<div id="dropdown-content" class="dropdown-content">
						<a href="#">고객센터</a> <a href="#">게시판3</a> <a href="#">게시판2</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>