<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css" />
	<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="top">
<%-- 		<jsp:include page="../inc/top_ns.jsp"></jsp:include> --%>
	</div>
	<jsp:include page="../inc/search_bar.jsp"></jsp:include>
	<p class="gap10"></p>
	<div class="project">
		<div class="list_main">
			<div class="restaurant_list_wrapper">
				<div class="filer_line">
					<!-- 갯수/ 필터공간 -->
					<div class="result_sum">1개의 식당을 찾음</div>
					<div class="filter">
						<select name="sort">
							<option value="recommand">추천순</option>
							<option value="star">별점순</option>
							<option value="review">리뷰많은순</option>
							<option value="distance">거리순</option>
						</select>
					</div>
				</div>
				<div class="rowgroup">
					<div class="restaurant-list">
						<div class="restaurant-card" onclick="location.href='detail'"><!-- 임시 링크 -->
							<div class="restaurant-img">
								<img src="${pageContext.request.contextPath}/resources/img/list_com.jpg" class="com_pic">
							</div>
							<div class="restaurant-details">
								<div class="restaurant-info">
									<div class="name-distance">
										<div class="restaurant-name">음식점 이름</div>
										<div class="restaurant-distance">나와의 거리 ~m</div>
									</div>
									<div class="restaurant-category">음식점 분류</div>
									<div class="restaurant-description">음식점 상세</div>
									<div class="restaurant-price-range">최저금액 ~ 최고금액</div>
								</div>
								<div class="reservation-time">
									<span class="time-slot">22:00</span> <span class="time-slot">23:00</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
