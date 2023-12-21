<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join_choice.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/global.css">
	<link href="${pageContext.request.contextPath }/resources/css/all_css.css" rel="stylesheet" type="text/css">

	<script src="${pageContext.request.contextPath }/resources/js/join_choice.js"></script>
	
</head>
	<body>

		
	<!-- 	<header> -->
	<%--   	<jsp:include page="top.jsp"></jsp:include> --%>
	<!-- 	</header> -->
						<!-- 제일 바깥테두리를 위한 div -->
			<div class="choiceBox">
		
			
				<div class="outBox">
					<!-- 일반회원 테두리를 위한 div -->
					<div class="box">
						<h2>일반 회원</h2>
						<!-- 일반 회원가입 버튼 -->
						<div class="innerBox1">
							<div>
								<button type="button" class="joinFormBtn" onclick="join_u()">
									일반 회원가입
								</button>
								<br>
								<!-- 아이디 연동 가입 -->
								<button type="button" class="joinFormBtn" id="kakao">
									<!-- 카카오 -->
									<img src="${pageContext.request.contextPath }/resources/img/kakao_logo.png" alt="카카오 로고">
									카카오
								</button>
								<br>
								<!-- 네이버 -->
								<button type="button" class="joinFormBtn" id="naver">
									<img src="${pageContext.request.contextPath }/resources/img/naver_logo.png" alt="네이버 로고">
									네이버
								</button>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="outBox">
				<!--업체회원 테두리를 위한 div -->
					<div class = "box" id="box2">
						<h2>업체 회원</h2>
						<div class="innerBox2">
							<!-- 업체 회원가입 버튼 -->
							<button type="button" class="joinFormBtn" onclick="join_c()">
								<span>업체 회원가입</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		<%--    <footer>
		<jsp:include page="bottom.jsp"></jsp:include>
		</footer> --%>
	</body>
</html>


