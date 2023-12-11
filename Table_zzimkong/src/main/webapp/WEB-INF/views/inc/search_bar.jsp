<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/search_bar.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/global.css"> --%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="${pageContext.request.contextPath }/resources/js/search_bar.js"></script>
<div class="search_bar">
	<div class="search_wrapper">
		<div class="search_content">
			<div class="search_input_wrapper">
				<div class="search_input">
					<img class="search_icon" src="${pageContext.request.contextPath}/resources/img/search_icon.svg" /> <input class="search_input_text" type="text"
						placeholder="지역 또는 레스토랑 입력">
				</div>
			</div>
			<div class="search_info">
				<p class="info_text">테이블 인원수 2, 오늘 21:00</p>
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span class="close">&times;</span>
						<h2>예약 정보</h2>
						<div class="input-group">
							<div class="date-group">
								<div class="date-label">예약 날짜 : </div> <input type="date" id="reservation-date" name="reservation-date">
							</div>
							<div class="persons-group">
								<p>예약 인원:</p>
								<input type="radio" id="one" name="persons" value="1"> <label for="one">1명</label> <input type="radio" id="two" name="persons"
									value="2"> <label for="two">2명</label> <input type="radio" id="three" name="persons" value="3"> <label for="three">3명</label>
								<input type="radio" id="four" name="persons" value="4"> <label for="four">4명</label>
							</div>
						</div>
						<div class="input-group time-group">
						<span class="arrow left">&lt;</span>
							<input type="radio" id="time11" name="time" value="11"> <label for="time11">오전 11시</label> <input type="radio" id="time12" name="time"
								value="12"> <label for="time12">오전 12시</label> <input type="radio" id="time13" name="time" value="13"> <label for="time13">오후
								1시</label> <input type="radio" id="time14" name="time" value="14"> <label for="time14">오후 2시</label> <input type="radio" id="time15"
								name="time" value="15"> <label for="time15">오후 3시</label> <input type="radio" id="time16" name="time" value="16"> <label
								for="time16">오후 4시</label> <input type="radio" id="time17" name="time" value="17"> <label for="time17">오후 5시</label> <input
								type="radio" id="time18" name="time" value="18"> <label for="time18">오후 6시</label> <input type="radio" id="time19" name="time"
								value="19"> <label for="time19">오후 7시</label> <input type="radio" id="time20" name="time" value="20"> <label for="time20">오후
								8시</label> <input type="radio" id="time21" name="time" value="21"> <label for="time21">오후 9시</label> <input type="radio" id="time22"
								name="time" value="22"> <label for="time22">오후 10시</label>
						<span class="arrow right">&gt;</span>
						</div>
					</div>
				</div>
			</div>
			<div class="filter_wrapper">
				<img class="filter_icon" src="${pageContext.request.contextPath}/resources/img/search_filter.svg" />
				<div class="filter_text">필터</div>
			</div>
		</div>
		<div class="search_filter">
			<button class="filter_option location_button">
				<img class="option_icon" src="${pageContext.request.contextPath}/resources/img/search_location.svg" />
				<div class="option_text">지역</div>
			</button>
			<button class="filter_option distance_button">
				<img class="option_icon" src="${pageContext.request.contextPath}/resources/img/search_distance.svg" />
				<div class="option_text">1km</div>
			</button>
			<button class="filter_option cuisine_button">
				<img class="option_icon" src="${pageContext.request.contextPath}/resources/img/search_shop.svg" />
				<div class="option_text">일식</div>
			</button>
			
			
<!-- 			<button class="menu_option login_button"> -->
<%-- 				<a href="${pageContext.request.contextPath}/views/bottom_main.jsp"> --%>
<!-- 					<i class='bx bx-log-in-circle icon'></i> -->
<!-- 				</a> -->
<!-- 			</button> -->
<!-- 			<button class="menu_option bell_button"> -->
<%-- 				<a href="${pageContext.request.contextPath}/views/bottom_main.jsp"> --%>
<!-- 					<i class='bx bx-bell icon'></i> -->
<!-- 				</a> -->
<!-- 			</button> -->
<!-- 			<button class="menu_option user_button"> -->
<%-- 				<a href="${pageContext.request.contextPath}/views/bottom_main.jsp"> --%>
<!-- 					<i class='bx bx-user icon'></i> -->
<!-- 				</a> -->
<!-- 			</button> -->
<!-- 			<button class="menu_option support_button"> -->
<%-- 				<a href="${pageContext.request.contextPath}/views/bottom_main.jsp"> --%>
<!-- 					<i class='bx bx-support icon'></i> -->
<!-- 				</a> -->
<!-- 			</button> -->

		</div>
	</div>
</div>
