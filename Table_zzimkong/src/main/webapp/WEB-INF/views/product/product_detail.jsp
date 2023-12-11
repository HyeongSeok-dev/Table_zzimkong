<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detail.css">
<link
	href="${pageContext.request.contextPath }/resources/css/global.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/detail.js"></script>
</head>
<body>
<%-- 		<jsp:include page="../inc/top_ns.jsp"></jsp:include> --%>
	<jsp:include page="../inc/search_bar_main.jsp"></jsp:include>
	<p class="gap20"></p>
	<div class="s-list pic-grade">
		<div class="com_pic_wrapper">
			<img
				src="${pageContext.request.contextPath}/resources/img/list_com.jpg"
				class="com_pic">
		</div>
		<div class="tit-point">
			<p class="tit">업체명</p>
		</div>
		<div class="btxt">
			<div>구군명 |</div>
			<div class="btxt">분류명(카페 등)</div>
		</div>
		<div class="sns-grade">
			<p class="grade">
				<span class="point"> (리뷰남긴 사람의 수 )명의 평가 <strong
					id="lbl_review_point"> (별점 평균) </strong>
				</span><span id="lbl_review_star" class="star"> </span>
			</p>
		</div>
		<div class="favor-pic-appra">
			<div class="favor">
				<span> 즐겨찾기 </span>
			</div>
			<div>
				<button class="appra Profile__Evaluation">
					<span> 평가하기 </span>
				</button>
			</div>
		</div>
	</div>
	<p class="gap20"></p>
	<div class="s-list basic-info">
		<ul class="list">
			<li class="locat">
				<div>현재 위치정보</div> <br> <span class="Profile__Detail__Distance">
					현재 위치에서 <strong> ~m </strong>
			</span>
				<button class="Move__Map__Button"
					onclick="$('#div_map_full').parent().fadeIn(300);">지도보기</button>
			</li>
			<li class="tel">전화번호</li>
			<li class="tag">분위기 태그</li>
			<li class="char">편의시설 태그</li>
			<li class="feedback button style-UoJ8Z" id="style-UoJ8Z">폐업신고 ·
				정보수정 제안</li>
		</ul>
	</div>
	<p class="gap20"></p>
	<form id="order-form" action="../reservation" method="post">
		<div id="div_detail" class="s-list detail-info">
			<div class="busi-hours-today">
				<p class="tit style-DPgUI" id="style-DPgUI">영업시간</p>
				<div id="style-2KZWl" class="style-2KZWl">
					<p id="style-gRfXa" class="style-gRfXa">◷</p>
					<p id="style-3S1oF" class="style-3S1oF">영업시간과 현재시간 비교 영업중 /
						영업종료 표시</p>
				</div>
				<ul class="list">
					<li>
						<p class="r-txt">영업시간: 11:30 - 22:00</p>
					</li>
					<li>
						<p class="r-txt">라스트오더: 21:00 - 영업종료 1시간전으로 일괄 설정</p>
					</li>
				</ul>
			</div>
			<p class="gap20"></p>
			<div></div>
			<div class="menu-info short">
				<p class="gap20"></p>
				<p class="tit">메뉴정보</p>
				<div class="menu_card">
					<div class="menu_info">
						<div class="menu_name">메뉴이름</div>
						<div class="menu_name_sub">파니니 뭐시기 저시기</div>
						<div class="menu_discribe">메뉴설명</div>
						<div class="menu_discribe_sub">메뉴설명 뭐시기 거시기 왈라왈라왈랑셩 왈라리 왈라</div>
						<div class="menu_price">메뉴가격</div>
						<div class="menu_button_wrapper">
							<div class="menu_price_sub">12,000원</div>
							<input type="checkbox" id="menu1" name="menu" class="menu_check">
							<label for="menu1" class="menu_button">선주문</label>
						</div>
					</div>

					<div class="menu_contents">
						<div class="menu_box">
							<img class="menu_img"
								src="${pageContext.request.contextPath}/resources/img/detail_com.jpg">
						</div>
						<div class=menu_section>
							<!-- menu_section 내부 내용은 동일 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<p class="gap20"></p>
		<section class="similar_section" id="similar-rest-section">
			<div class="similar_rest_head">
				<div class="title-container">
					<span class="similar_recom_title"><span class="rn">업체명
					</span><span> 과&nbsp;비슷한 맛집 </span> </span>
				</div>
				<div class="sort-option-set">
					<div class="sort-option-div sort-option-selected"
						data-sort-value="rest_near">현재 식당 근처</div>
					<div class="sort-option-div" data-sort-value="score">점수가 높은</div>
					<div class="sort-option-div" data-sort-value="sim">가장 유사한</div>
				</div>
			</div>
			<div class="similar_content style-oS3aX" id="similar-contents">
				<!-- 식당 목록이 동적으로 표시될 곳 -->
				<div class="similar_rest_card">
					<div class="similar_rest_box">
						<div class="similar_rest_distance">
							<img class="similar_rest_distance_img"
								src="${pageContext.request.contextPath}/resources/img/products_location_img.png"
								alt="추천 식당 거리 표시 아이콘"> <span
								class="similar_rest_distance_number"> 125m</span>
						</div>
						<img class="similar_rest_img"
							src="${pageContext.request.contextPath}/resources/img/list_com.jpg">
						<div class="similar_rest_average">
							<img class="similar_rest_average_img"
								src="${pageContext.request.contextPath}/resources/img/products_similar_star.png"
								alt=""> <span class="similar_rest_average_number">
								4.6</span>
							<!--  별점 가져오는곳 -->
						</div>
					</div>
					<span class="similar_rest_title">가나다라<br></span>
				</div>
			</div>
		</section>
		<p class="gap20"></p>
		<div class="s-list appraisal">
			<div class="grade-info style-51Qop" id="style-51Qop">
				<p class="title-and-score">
					<span class="tit">(리뷰수) 건의 리뷰</span> <span id="lbl_star_point"
						class="star-point"> <span class="point"> 총 별점 </span> <span
						class="star"> <i style="width: 80%"></i>
					</span>
					</span>
				</p>
				<div class="review-and-graph">
					<div class="review_wrapper">
						<jsp:include page="../inc/product_review.jsp"></jsp:include>
					</div>
					<ul class="app-graph">
						<li>
							<p class="btxt">매우만족(8)</p>
							<p class="graph">
								<span style="width: 42%"> <!-- 총 별점중 비율 표시 -->
								</span>
							</p>
						</li>
						<li>
							<p class="btxt">만족(7)</p>
							<p class="graph">
								<span style="width: 37%"></span>
							</p>
						</li>
						<li>
							<p class="btxt">보통(3)</p>
							<p class="graph">
								<span style="width: 16%"></span>
							</p>
						</li>
						<li>
							<p class="btxt">불만(1)</p>
							<p class="graph">
								<span style="width: 5%"></span>
							</p>
						</li>
						<li>
							<p class="btxt">매우불만(0)</p>
							<p class="graph">
								<span style="width: 0%"></span>
							</p>
						</li>
					</ul>
				</div>
			</div>
				<button>리뷰 더보기</button>
			<p class="gap20"></p>
		</div>

		<!-- 리뷰페이지 들어갈 공간 -->
		<p class="gap20"></p>
		<div class="button_wrapper">
			<button type="submit" id="reservation-confirm-button"
				class="confirm-button">선주문없이 바로 예약하기</button>
		</div>
	</form>
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</body>
</html>