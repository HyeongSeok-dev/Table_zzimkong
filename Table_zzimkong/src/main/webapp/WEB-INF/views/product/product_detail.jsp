<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/product_detail.css">
<link
	href="${pageContext.request.contextPath }/resources/css/global.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b71f7bc975653acc7be99d324066bee
&libraries=services"></script>
<script src="${pageContext.request.contextPath }/resources/js/product_detail.js"></script>

</head>
<body>
<%-- 		<jsp:include page="../inc/top_ns.jsp"></jsp:include> --%>
	<jsp:include page="../inc/top2_search_bar.jsp"></jsp:include>
	<p class="gap20"></p>
	<div class="s-list pic-grade">
		<div class="com_pic_wrapper">
			<img src="${pageContext.request.contextPath }/resources/upload/${company.com_img}" class="com_pic">
			<div class="menu_pic_wrapper">
				<c:forEach var="img" items="${menuList}">
				<img src="${pageContext.request.contextPath }/resources/upload/${img.menu_img}" class="menu_pic">
				</c:forEach>
			</div>
			
		</div>
		<div class="tit-point">
			<p class="tit"></p>
		</div>
		<div class="btxt">
			<input type="hidden" id ="com_id" name="com_id" value="${company.com_id}">
			<div>${company.com_gugun} | ${company.com_name}</div>
			<div class="btxt">${company.com_category}</div>
		</div>
		<div class="sns-grade">
			<p class="grade">
				<span class="point">${company_info.review_count}명의 평가 <strong
					id="lbl_review_point"> ${company_info.avg_score} </strong>
				</span>
				<span class="star"> <i style="width: ${company_info.avg_score *20}%"></i></span>
			</p>
		</div>
		<div class="favor-pic-appra">
			<div class="favor_container">
				<c:choose>
					<c:when test="${isLiked eq 'true'}">
						<div class="favor_on">
						<span class="favorite_button"> 즐겨찾기 </span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="favor_off">
						<span class="favorite_button"> 즐겨찾기 </span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<c:if test="${isvisited}">
					<a href="../review/write?com_id=${company.com_id}"><button class="appra Profile__Evaluation">
						<span> 평가하기 </span>
					</button></a>
				</c:if>
			</div>
		</div>
	</div>
	<p class="gap20"></p>
	<div class="s-list basic-info">
		<ul class="list">
			<li class="locat">
				<div>${company.com_address}</div> <br> 
				<span class="Profile__Detail__Distance">현재 위치에서 <strong class="restaurant-distance"> ${company_info.distance}m </strong>
					<input type="hidden" name="storeAddress" value="${company.com_address}">
			</span>
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
				<button onclick="mapPopup('${company.com_address}', '${company.com_name}')" class="Move__Map__Button">지도보기</button>
			</li>
			<li class="tel">${company.com_tel}</li>
			<li class="tag">${tag_mood}</li>
			<li class="char">${tag_facilities}</li>
			<li class="feedback button style-UoJ8Z" id="style-UoJ8Z"><a href="../member/cs/faq">폐업신고 ·
				정보수정 제안</a></li>
		</ul>
	</div>
	<p class="gap20"></p>
	<form id="order-form" action="${pageContext.request.contextPath}/reservation" method="post">
		<div id="div_detail" class="s-list detail-info">
			<div class="busi-hours-today">
				<p class="tit style-DPgUI" id="style-DPgUI">영업시간</p>
				<div id="style-2KZWl" class="style-2KZWl">
					<p id="style-gRfXa" class="style-gRfXa">◷</p>
					<p id="style-3S1oF" class="style-3S1oF"><c:choose><c:when test="${isOnBusiness}"><span class="onBusiness">영업중</span></c:when> 
					<c:otherwise><span class="offBusiness">영업종료</span></c:otherwise></c:choose> </p> 
				</div>
				<ul class="list">
					<li>
						<p class="r-txt">${company.com_open_time} ~ ${company.com_close_time} / 브레이크타임 : ${company.com_breakStart_time} ~ ${company.com_breakEnd_time}</p>
					</li>
				</ul>
			</div>
			<p class="gap20"></p>
			<div></div>
			<div class="menu-info short">
				<p class="gap20"></p>
				<p class="tit">메뉴정보</p>
				<c:forEach var="menu" items="${menuList}">
					<div class="menu_card" data-menu-id="${menu.menu_idx}" data-menu-name="${menu.menu_name}" 
        				 data-menu-price="${menu.menu_price}">
						<div class="menu_info">
							<div class="menu_name">메뉴이름</div>
							<div class="menu_name_sub">${menu.menu_name}</div>
							<div class="menu_discribe">메뉴설명</div>
							<div class="menu_discribe_sub">${menu.menu_describe}</div>
							<div class="menu_price">메뉴가격</div>
							<div class="menu_button_wrapper">
								<div class="menu_price_sub">${menu.menu_price}원</div>
								<input type="checkbox" id="menu_${menu.menu_idx}" name="menu_idx" class="menu_check" value="${menu.menu_idx}">
								<label for="menu_${menu.menu_idx}" class="menu_button">선택</label>
								<input type="number" min="1" max="10" name="order_amount" value="1" class="order_amount">
							</div>
						</div>
	
						<div class="menu_contents">
							<div class="menu_box">
								<img class="menu_img"
									src="${pageContext.request.contextPath }/resources/upload/${menu.menu_img}">
							</div>
							<div class=menu_section>
								<!-- menu_section 내부 내용은 동일 -->
							</div>
						</div>
					</div>
					<p class="gap20"></p>
					<hr>
				</c:forEach>
			</div>
		</div>
		<p class="gap20"></p>
		<div class="button_wrapper">
			<button id="reservation-confirm-button"
				class="confirm-button" type="button">선주문없이 바로 예약하기</button>
		</div>
		<p class="gap20"></p>
		<section class="similar_section" id="similar-rest-section">
			<div class="similar_rest_head">
				<div class="title-container">
					<span class="similar_recom_title"><span class="rn">${company.com_name}
					</span><span> 과 비슷한 맛집 </span> </span>
				</div>
				<div class="sort-option-set">
					<div class="sort-option-div sort-option-selected"
						data-sort-value="near">현재 식당 근처</div>
					<div class="sort-option-div" data-sort-value="score">점수가 높은</div>
					<div class="sort-option-div" data-sort-value="sim">가장 유사한</div>
				</div>
			</div>
			<div class="similar_content style-oS3aX" id="similar-contents">
				<!-- 식당 목록이 동적으로 표시될 곳 -->
			</div>
		</section>
		<p class="gap20"></p>
		<div class="s-list appraisal">
			<div class="grade-info style-51Qop" id="style-51Qop">
				<p class="title-and-score">
					<span class="tit">${review_score.reviewCount}건의 리뷰</span> <span id="lbl_star_point"
						class="star-point"> <span class="point"> 총 별점 </span> 
						<span class="star"> 
						    <i style="width: ${review_score.avg_score * 20}%"></i>
						</span>
					</span>
				</p>
				<div class="review-and-graph">
					<div class="review_wrapper">
					    <div class="review_container">
					        <c:set var="imageCount" value="0" />
							<c:forEach var="review" items="${reviews}">
							    <c:if test="${not empty review.review_img_1}">
							        <c:if test="${imageCount < 5}">
							            <div class="review_image">
							                <img src="${pageContext.request.contextPath }/resources/upload/${review.review_img_1}">
							            </div>
							            <c:set var="imageCount" value="${imageCount + 1}" />
							        </c:if>
							    </c:if>
							</c:forEach>
					    </div>
					</div>
					<ul class="app-graph">
						<li>
							<p class="btxt">매우만족(${review_score.fiveStarCount})</p>
							<p class="graph">
								<span style="width: ${review_score.fiveStarCount * 100 / review_score.reviewCount}%"></span> <!-- 총 별점중 비율 표시 -->
							</p>
						</li>
						<li>
							<p class="btxt">만족(${review_score.fourStarCount})</p>
							<p class="graph">
								<span style="width: ${review_score.fourStarCount * 100 / review_score.reviewCount}%"></span>
							</p>
						</li>
						<li>
							<p class="btxt">보통(${review_score.threeStarCount})</p>
							<p class="graph">
								<span style="width: ${review_score.threeStarCount * 100 / review_score.reviewCount}%"></span>
							</p>
						</li>
						<li>
							<p class="btxt">불만(${review_score.twoStarCount})</p>
							<p class="graph">
								<span style="width: ${review_score.twoStarCount * 100 / review_score.reviewCount}%"></span>
							</p>
						</li>
						<li>
							<p class="btxt">매우불만(${review_score.oneStarCount})</p>
							<p class="graph">
								<span style="width: ${review_score.oneStarCount * 100 / review_score.reviewCount}%"></span>
							</p>
						</li>
					</ul>
				</div>
				<a class="more_reivew" href="../review/redetail?com_id=${company.com_id}">리뷰 더보기</a>
			</div>
			<p class="gap20"></p>
		</div>

		<p class="gap20"></p>
	</form>
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</body>
</html>