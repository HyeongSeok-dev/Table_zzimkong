<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/search_bar.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/global.css"> --%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script
	src="${pageContext.request.contextPath }/resources/js/search_bar.js"></script>
<form method="get" action="${pageContext.request.contextPath }/product/list" class="search_bar">
	<div class="search_bar">
		<div class="search_wrapper">
			<div class="search_content">
				<div class="search_input_wrapper">
				
					<div class="search_input">
						<input class="search_input_text" type="text" placeholder="지역 또는 레스토랑" name="context" value="${context}"> <i
							class="material-icons search_icon">&#xe8b6;</i>
					</div>
				</div>
				<div class="search_info">
					<p class="info_text">테이블 인원수 : ${persons}명, ${display_date}
						${time}</p>
					<div id="myModal" class="modal">
						<div class="modal-content">
							<span class="close">&times;</span>
							<h2>예약 정보</h2>
							<div class="input-group">
								<div class="date-group">
									<div class="date-label">예약 날짜 :</div>
									<input type="date" id="reservation-date" name="date"
										value="${date}">
								</div>
								<div class="persons-group">
									<p>예약 인원:</p>
									<input type="radio" id="one" name="persons" value="1"
										${persons == 1 ? 'checked' : ''}> <label for="one">1명</label>
									<input type="radio" id="two" name="persons" value="2"
										${persons == 2 ? 'checked' : ''}> <label for="two">2명</label>
									<input type="radio" id="three" name="persons" value="3"
										${persons == 3 ? 'checked' : ''}><label for="three">3명</label>
									<input type="radio" id="four" name="persons" value="4"
										${persons == 4 ? 'checked' : ''}> <label for="four">4명</label>
								</div>
							</div>
							<div class="input-group time-group">
								<span class="arrow left">&lt;</span> <input type="radio"
									id="time11" name="time" value="오전11시"
									${time eq "오전11시" ? 'checked' : ''}> <label
									for="time11">오전 11시</label> <input type="radio" id="time12"
									name="time" value="오전12시" ${time eq "오전12시" ? 'checked' : ''}>
								<label for="time12">오전 12시</label> <input type="radio"
									id="time13" name="time" value="오후1시"
									${time eq "오후 1시" ? 'checked' : ''}> <label for="time13">오후
									1시</label> <input type="radio" id="time14" name="time" value="오후2시"
									${time eq "오후 2시" ? 'checked' : ''}> <label for="time14">오후
									2시</label> <input type="radio" id="time15" name="time" value="오후3시"
									${time eq "오후 3시" ? 'checked' : ''}> <label for="time15">오후
									3시</label> <input type="radio" id="time16" name="time" value="오후4시"
									${time eq "오후 4시" ? 'checked' : ''}> <label for="time16">오후
									4시</label> <input type="radio" id="time17" name="time" value="오후5시"
									${time eq "오후 5시" ? 'checked' : ''}> <label for="time17">오후
									5시</label> <input type="radio" id="time18" name="time" value="오후6시"
									${time eq "오후 6시" ? 'checked' : ''}> <label for="time18">오후
									6시</label> <input type="radio" id="time19" name="time" value="오후7시"
									${time eq "오후 7시" ? 'checked' : ''}> <label for="time19">오후
									7시</label> <input type="radio" id="time20" name="time" value="오후8시"
									${time eq "오후 8시" ? 'checked' : ''}> <label for="time20">오후
									8시</label> <input type="radio" id="time21" name="time" value="오후9시"
									${time eq "오후 9시" ? 'checked' : ''}> <label for="time21">오후
									9시</label> <input type="radio" id="time22" name="time" value="오후10시"
									${time eq "오후 10시" ? 'checked' : ''}> <label
									for="time22">오후 10시</label> <span class="arrow right">&gt;</span>
								<button id="confirm" type="button">확인</button>
							</div>
						</div>
					</div>
				</div>
				<div class="filter_wrapper">
					<img class="filter_icon"
						src="${pageContext.request.contextPath}/resources/img/search_filter.svg" />
					<div id="filterModal" class="modal">
						<div class="filter-modal-content">
							<span class="close">&times;</span>
							<h2>어떤곳을 원하시나요?</h2>
							<div class="filter-content">
								<ul class="filter-list">
									<li class="filter-item" id="location"><span>지역</span>
										<ul class="sub-list">
											<li>서울
												<ul class="detail-list">
													<li>서울 전체</li>
													<li>강남</li>
													<li>서초</li>
													<li>잠실/송파/강동</li>
													<li>영등포/여의도/강서</li>
													<li>건대/성수/왕십리</li>
													<li>종로/중구</li>
													<li>홍대/합정/마포</li>
													<li>성북/노원/중랑</li>
													<li>구로/관악/동작</li>
												</ul>
											</li>
											<li>경기
												<ul class="detail-list">
													<li>경기 전체</li>
													<li>성남시(분당/판고/성남)</li>
													<li>수원</li>
													<li>용인/화성(동탄)</li>
													<li>안양/과천</li>
													<li>군포/의왕</li>
													<li>부천/안산/시흥/광명</li>
													<li>평택/오산/안성</li>
													<li>고양/파주</li>
													<li>김포</li>
													<li>가평/양평</li>
													<li>광주/이천/여주</li>
													<li>남양주/의정부</li>
													<li>하남/구리</li>
													<li>포천/양주/동두천/연천</li>
												</ul>
											</li>
											<li>인천
												<ul class="detail-list">
													<li>인천 전체</li>
													<li>연수구(송도)/남동구</li>
													<li>부평구/계양구</li>
													<li>중구/서구(청라)</li>
													<li>미추홀구/동구</li>
													<li>강화/옹진</li>
												</ul>
											</li>
											<li>부산
												<ul class="detail-list">
													<li><label for="all"><input type="radio"
															id="all" name="location" value="all"> 전체</label></li>
													<li><label for="강서구"><input type="radio"
															id="강서구" name="location" value="강서구"> 강서구</label></li>
													<li><label for="금정구"><input type="radio"
															id="금정구" name="location" value="금정구"> 금정구</label></li>
													<li><label for="남구"><input type="radio"
															id="남구" name="location" value="남구"> 남구</label></li>
													<li><label for="동구"><input type="radio"
															id="동구" name="location" value="동구"> 동구</label></li>
													<li><label for="동래구"><input type="radio"
															id="동래구" name="location" value="동래구"> 동래구</label></li>
													<li><label for="부산진구"><input type="radio"
															id="부산진구" name="location" value="부산진구"> 부산진구</label></li>
													<li><label for="북구"><input type="radio"
															id="북구" name="location" value="북구"> 북구</label></li>
													<li><label for="사상구"><input type="radio"
															id="사상구" name="location" value="사상구"> 사상구</label></li>
													<li><label for="사하구"><input type="radio"
															id="사하구" name="location" value="사하구"> 사하구</label></li>
													<li><label for="서구"><input type="radio"
															id="서구" name="location" value="서구"> 서구</label></li>
													<li><label for="수영구"><input type="radio"
															id="수영구" name="location" value="수영구"> 수영구</label></li>
													<li><label for="연제구"><input type="radio"
															id="연제구" name="location" value="연제구"> 연제구</label></li>
													<li><label for="영도구"><input type="radio"
															id="영도구" name="location" value="영도구"> 영도구</label></li>
													<li><label for="중구"><input type="radio"
															id="중구" name="location" value="중구"> 중구</label></li>
													<li><label for="해운대구"><input type="radio"
															id="해운대구" name="location" value="해운대구"> 해운대구</label></li>
													<li><label for="기장군"><input type="radio"
															id="기장군" name="location" value="기장군"> 기장군</label></li>
												</ul>
											</li>
											<li>제주도
												<ul class="detail-list">
													<li>제주도 전체</li>
													<li>제주시</li>
													<li>서귀포시</li>
												</ul>
											</li>
											<li>울산
												<ul class="detail-list">
													<li>울산 전체</li>
													<li>남구/중구</li>
													<li>동구/북구/울주군</li>
												</ul>
											</li>
											<li>경남
												<ul class="detail-list">
													<li>경남 전체</li>
													<li>창원</li>
													<li>김해/양산/밀양</li>
													<li>거제/통영/고성</li>
													<li>진주/사천/남해/하동</li>
													<li>거창/함안/창녕/합천/의령</li>
													<li>하동/산청/함양</li>
												</ul>
											</li>
											<li>대구
												<ul class="detail-list">
													<li>대구 전체</li>
													<li>중구/동구</li>
													<li>수성구/남구</li>
													<li>북구/서구</li>
													<li>달서구/달성군</li>
												</ul>
											</li>
											<li>경북
												<ul class="detail-list">
													<li>경북 전체</li>
													<li>포항/경주</li>
													<li>김천/구미/성주/칠곡/고령</li>
													<li>안동/문경/상주/영주/예천/의성/봉화</li>
													<li>경산</li>
													<li>군위/영천/청도</li>
													<li>울진/영양/영덕/청송</li>
													<li>울릉도</li>
												</ul>
											</li>
											<li>강원
												<ul class="detail-list">
													<li>강원 전체</li>
													<li>강릉/동해/삼척</li>
													<li>속초/양양/고성/인제</li>
													<li>원주/횡성</li>
													<li>춘천/철원/화천/양구/홍천</li>
													<li>태백/영월/평창/정선</li>
												</ul>
											</li>
											<li>대전
												<ul class="detail-list">
													<li>대전 전체</li>
													<li>유성구/대덕구</li>
													<li>서구/중구</li>
													<li>동구</li>
												</ul>
											</li>
											<li>충남
												<ul class="detail-list">
													<li>충남 전체</li>
													<li>천안/아산</li>
													<li>보령/부여/서천</li>
													<li>공주/계룡/금산/논산/청양</li>
													<li>당진</li>
													<li>태안/안면도/서산</li>
													<li>예산/홍성</li>
												</ul>
											</li>
											<li>충북
												<ul class="detail-list">
													<li>충북 전체</li>
													<li>청주</li>
													<li>충주</li>
													<li>제천/진천/음성/단양</li>
													<li>보은/옥천/괴산/증평/영동</li>
												</ul>
											</li>
											<li>세종
												<ul class="detail-list">
													<li>세종 전체</li>
													<li>세종</li>
												</ul>
											</li>
											<li>전남
												<ul class="detail-list">
													<li>전남 전체</li>
													<li>여수/순천/광양</li>
													<li>목포/영암/무안/신안</li>
													<li>담양/곡성/구례/화순</li>
													<li>해남/완도/진도/강진/장흥/보성/고흥</li>
													<li>나주/함평/영광/장성</li>
												</ul>
											</li>

											<li>광주
												<ul class="detail-list">
													<li>광주 전체</li>
													<li>서구</li>
													<li>광산구</li>
													<li>동구/남구</li>
													<li>북구</li>
												</ul>
											</li>

											<li>전북
												<ul class="detail-list">
													<li>전북 전체</li>
													<li>전주/완주</li>
													<li>군산/익산</li>
													<li>정읍/부안/김제/고창</li>
													<li>남원/임실/순창/무주/진안/장수</li>
												</ul>
											</li>
										</ul></li>
									<li class="filter-item" id="food"><span>음식종류</span>
										<ul class="sub-list">
											<li><label for="한식"><input type="radio"
													name="category" id="한식" value="한식">한식</label></li>
											<li><label for="중식"><input type="radio"
													name="category" id="중식" value="중식">중식</label></li>
											<li><label for="일식"><input type="radio"
													name="category" id="일식" value="일식">일식</label></li>
											<li><label for="육류"><input type="radio"
													name="category" id="육류" value="육류">육류</label></li>
											<li><label for="패밀리레스토랑"><input type="radio"
													name="category" id="패밀리레스토랑" value="패밀리레스토랑">패밀리레스토랑</label></li>
											<li><label for="카페"><input type="radio"
													name="category" id="카페" value="카페">카페</label></li>
										</ul></li>
									<li class="filter-item" id="menu_price"><span>메뉴 가격</span>
										<ul class="sub-list">
											<li><label for="price">가격: <span id="priceValue">50000</span>원
											</label><br> <input type="range" id="price" name="price" min="0"
												max="100000" value="50000" step="1000"></li>
										</ul></li>
									<li class="filter-item" id="mood"><span>분위기</span>
										<ul class="sub-list">
											<li><label for="데이트"><input type="radio"
													name="mood" id="데이트" value="데이트">데이트</label></li>
											<li><label for="가족모임"><input type="radio"
													name="mood" id="가족모임" value="가족모임">가족모임</label></li>
											<li><label for="단체회식"><input type="radio"
													name="mood" id="단체회식" value="단체회식">단체회식</label></li>
											<li><label for="조용한"><input type="radio"
													name="mood" id="조용한" value="조용한">조용한</label></li>
										</ul></li>

									<li class="filter-item" id="facilities"><span>편의시설</span>
										<ul class="sub-list">
											<li><label for="주차가능"><input type="radio"
													name="facilities" id="주차가능" value="주차가능">주차가능</label></li>
											<li><label for="노키즈존"><input type="radio"
													name="facilities" id="노키즈존" value="노키즈존">노키즈존</label></li>
											<li><label for="장애인 편의시설"><input type="radio"
													name="facilities" id="장애인 편의시설" value="장애인 편의시설">장애인
													편의시설</label></li>
											<li><label for="반려동물 동반"><input type="radio"
													name="facilities" id="반려동물 동반" value="반려동물 동반">반려동물
													동반</label></li>
										</ul></li>
									<li class="filter-item" id="table_type"><span>테이블
											타입</span>
										<ul class="sub-list">
											<li><label for="홀"><input type="radio"
													name="table_type" id="홀" value="홀">홀</label></li>
											<li><label for="룸"><input type="radio"
													name="table_type" id="룸" value="룸">룸</label></li>
											<li><label for="테라스"><input type="radio"
													name="table_type" id="테라스" value="테라스">테라스</label></li>
											<li><label for="창가자리"><input type="radio"
													name="table_type" id="창가자리" value="창가자리">창가자리</label></li>
										</ul></li>

									<li class="filter-item" id="hygiene"><span>위생등급</span>
										<ul class="sub-list">
											<li><label for="매우우수"><input type="radio"
													name="hygiene" id="매우우수" value="매우우수">매우우수</label></li>
											<li><label for="우수"><input type="radio"
													name="hygiene" id="우수" value="우수">우수</label></li>
											<li><label for="좋음"><input type="radio"
													name="hygiene" id="좋음" value="좋음">좋음</label></li>
										</ul></li>
								</ul>
								<div class="sub-list-wrap"></div>
								<div class="detail-list-wrap"></div>
							</div>
							<div class="modal-footer">
								<button id="resetBtn" type="reset">초기화</button>
								<button id="applyBtn" type="button">적용</button>
							</div>
						</div>
					</div>
				</div>
			</div>

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
</form>
