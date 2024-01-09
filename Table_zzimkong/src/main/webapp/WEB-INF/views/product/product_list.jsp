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
	<script src="https://momentjs.com/downloads/moment.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b71f7bc975653acc7be99d324066bee&libraries=services"></script>
	<script src="${pageContext.request.contextPath }/resources/js/product_list.js"></script>
</head>
<body>
	<div class="top">
	
	<jsp:include page="../inc/top2_search_bar.jsp"></jsp:include>
	</div>

	<p class="gap10"></p>
	<div class="project">
		<div class="list_main">
			<div class="restaurant_list_wrapper">
				<div class="filer_line">
					<!-- 갯수/ 필터공간 -->
					<div class="result_sum">${listCount}개의 식당을 찾음</div>
					<div class="filter">
						
						<select name="sort" class="sort">
							<option value="recommend" <c:if test="${search.sort eq 'recommand' or search.sort eq ''}">selected</c:if> >추천순</option>
							<option value="star" <c:if test="${search.sort eq 'star'}">selected</c:if>>별점순</option>
							<option value="review" <c:if test="${search.sort eq 'review'}">selected</c:if>>리뷰많은순</option>
							<option value="distance" <c:if test="${search.sort eq 'distance'}">selected</c:if>>거리순</option>
						</select>
					</div>
				</div>
				<div class="rowgroup">
					
					<c:forEach var="company" items="${companyList}" >
						<form action="../product/detail" method="post" class="company_form">
							<div class="restaurant-list" onclick="submitForm(this);">
								<div class="restaurant-card">
									<div class="restaurant-img">
										<img src="${pageContext.request.contextPath }/resources/upload/${company.com_img}" class="com_pic">
									</div>
									<div class="restaurant-details">
										<div class="restaurant-info">
											<div class="name-distance">
												<div class="restaurant-name">${company.com_name}</div>
												<div class="restaurant-distance">${company.distance}m</div>
											</div>
											<div class="restaurant-category">${company.com_category}</div>
											<div class="restaurant-price-range">${company.min_price}원 ~ ${company.max_price}원</div>
											<div class="restaurant-tag">${company.com_search_tag}</div>
										</div>
										
										<div class="hyg_container">
											<c:choose>
												<c:when test="${company.com_hyg_rank eq '매우우수'}">
													<img alt="" src="${pageContext.request.contextPath}/resources/img/hyg_excellent.png" class="hyg_img">
												</c:when>
												<c:when test="${company.com_hyg_rank eq '우수'}">
													<img alt="" src="${pageContext.request.contextPath}/resources/img/hyg_very_good.png" class="hyg_img">
												</c:when>
												<c:when test="${company.com_hyg_rank eq '보통'}">
													<img alt="" src="${pageContext.request.contextPath}/resources/img/hyg_good.png" class="hyg_img">
												</c:when>
											</c:choose>
										</div>
										<div class="reservation-time" data-start-time="${search.time}" data-persons="${search.persons}" data-remaining1="${company.remaining_people}"
								             data-remaining2="${company.remaining_people2}" data-remaining3="${company.remaining_people3}" data-remaining4="${company.remaining_people4}" >
										</div>
										<input type="hidden" name="com_id" value="${company.com_id}">
										<input type="hidden" name="distance" value="${company.distance}">
										<input type="hidden" name="remaining_people" value="${company.remaining_people}">
										<input type="hidden" name="avg_score" value="${company.avg_score}">
										<input type="hidden" name="review_count" value="${company.review_count}">
										<input type="hidden" id="selectedTime" name="selectedTime" value="">
										<input type="hidden" id="storeAddress" name="storeAddress" value="${company.com_address}">
										
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
