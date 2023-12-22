<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/product_list.css" />
	<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="top">
<%-- 		<jsp:include page="../inc/top_ns.jsp"></jsp:include> --%>
	</div>
	<jsp:include page="../inc/top2_search_bar.jsp"></jsp:include>
	<p class="gap10"></p>
	<div class="project">
		<div class="list_main">
			<div class="restaurant_list_wrapper">
				<div class="filer_line">
					<!-- 갯수/ 필터공간 -->
					<div class="result_sum">${listCount}개의 식당을 찾음</div>
					<div class="filter">
						
						<select name="sort" class="sort">
							<option value="recommand" <c:if test="${search.sort eq 'recommand' or search.sort eq ''}">selected</c:if> >추천순</option>
							<option value="star" <c:if test="${search.sort eq 'star'}">selected</c:if>>별점순</option>
							<option value="review" <c:if test="${search.sort eq 'review'}">selected</c:if>>리뷰많은순</option>
							<option value="distance" <c:if test="${search.sort eq 'distance'}">selected</c:if>>거리순</option>
						</select>
					</div>
				</div>
				<div class="rowgroup">
					
					<c:forEach var="company" items="${companyList}">
					
					<div class="restaurant-list">
						<div class="restaurant-card">
							<div class="restaurant-img">
								<img src="${pageContext.request.contextPath}/resources/upload/${company.com_img}" class="com_pic">
							</div>
							<div class="restaurant-details">
								<div class="restaurant-info">
									<div class="name-distance">
										<div class="restaurant-name">${company.com_name}</div>
										<div class="restaurant-distance">${company.distance}m</div>
									</div>
									<div class="restaurant-category">${company.com_category}</div>
									<div class="restaurant-price-range">${company.min_price} ~ ${company.max_price}</div>
								</div>
								<div class="reservation-time">
<%-- 									<c:forEach var="time" items="reservationable_times"> --%>
<%-- 										<span class="time-slot">${time[0]}</span> <span class="time-slot">${time[1]}</span> --%>
<%-- 									</c:forEach> --%>
								</div>
							</div>
						</div>
					</div>
					
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
