<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/search_bar.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/resources/js/search_bar.js"></script>
<form method="get"
	action="${pageContext.request.contextPath }/product/list"
	class="search_bar">
	<div class="search_bar">
		<div class="search_wrapper">
			<div class="search_content">
				<div class="search_input_wrapper">
					<div class="search_input">
						<input class="search_input_text" type="text" id="mainSearchBar"
							placeholder="지역 또는 레스토랑" name="context" value="${search.context}">
						<i class="material-icons search_icon">&#xe8b6;</i>
					</div>
				</div>
				<div class="search_info">
					<p class="info_text modal-opener">
						테이블 인원수 : ${search.persons}명, ${search.displayDate}
						${search.displayTime}
					</p>
					<div id="table_modal" class="modal">
						<span class="close">&times;</span>
						<h2>언제 방문하시나요?</h2>
						<div class="input-group">
							<div class="date-group">
								<div class="date-label">예약 날짜</div>
								<input type="date" id="reservation-date" name="date"
									value="${search.date}">
							</div>
							<div class="persons-group">
							    <p>예약 인원</p>
							    <input type="number" id="persons" name="persons" value="${search.persons}" min="1" max="20">
							</div>
							<div class="time-group">
								<p>예약 시간</p>
							     <select name="time" id="time-select">
							        <!-- 오전 시간대 -->
							        <option value="11:00" ${search.time eq "11:00" ? 'selected' : ''}>오전 11시</option>
							        <option value="11:30" ${search.time eq "11:30" ? 'selected' : ''}>오전 11시 30분</option>
							        <option value="12:00" ${search.time eq "12:00" ? 'selected' : ''}>오전 12시</option>
							        <option value="12:30" ${search.time eq "12:30" ? 'selected' : ''}>오전 12시 30분</option>
							        <option value="13:00" ${search.time eq "13:00" ? 'selected' : ''}>오후 1시</option>
							        <option value="13:30" ${search.time eq "13:30" ? 'selected' : ''}>오후 1시 30분</option>
							        <option value="14:00" ${search.time eq "14:00" ? 'selected' : ''}>오후 2시</option>
							        <option value="14:30" ${search.time eq "14:30" ? 'selected' : ''}>오후 2시 30분</option>
							        <option value="15:00" ${search.time eq "15:00" ? 'selected' : ''}>오후 3시</option>
							        <option value="15:30" ${search.time eq "15:30" ? 'selected' : ''}>오후 3시 30분</option>
							        <option value="16:00" ${search.time eq "16:00" ? 'selected' : ''}>오후 4시</option>
							        <option value="16:30" ${search.time eq "16:30" ? 'selected' : ''}>오후 4시 30분</option>
							        <option value="17:00" ${search.time eq "17:00" ? 'selected' : ''}>오후 5시</option>
							        <option value="17:30" ${search.time eq "17:30" ? 'selected' : ''}>오후 5시 30분</option>
							        <option value="18:00" ${search.time eq "18:00" ? 'selected' : ''}>오후 6시</option>
							        <option value="18:30" ${search.time eq "18:30" ? 'selected' : ''}>오후 6시 30분</option>
							        <option value="19:00" ${search.time eq "19:00" ? 'selected' : ''}>오후 7시</option>
							        <option value="19:30" ${search.time eq "19:30" ? 'selected' : ''}>오후 7시 30분</option>
							        <option value="20:00" ${search.time eq "20:00" ? 'selected' : ''}>오후 8시</option>
							        <option value="20:30" ${search.time eq "20:30" ? 'selected' : ''}>오후 8시 30분</option>
							        <option value="21:00" ${search.time eq "21:00" ? 'selected' : ''}>오후 9시</option>
							        <option value="21:30" ${search.time eq "21:30" ? 'selected' : ''}>오후 9시 30분</option>
							        <option value="22:00" ${search.time eq "22:00" ? 'selected' : ''}>오후 10시</option>
							        <option value="22:30" ${search.time eq "22:30" ? 'selected' : ''}>오후 10시 30분</option>
							    </select>
							</div>
							<button id="confirm" type="button">적용</button>
						</div>
					</div>
				</div>
				<div class="filter_wrapper">
					<c:if test="${not empty search.location}">
						<div class="modal-opener seleted_location">${search.location} </div>
					</c:if>
					<c:if test="${empty search.location}">
						<div class="modal-opener seleted_location">전국 </div>
					</c:if>
					<img class="filter_icon modal-opener"
						src="${pageContext.request.contextPath}/resources/img/search_filter.png"/>
					<div id="filterModal" class="modal">
						<div class="filter-modal-content">
							<h2>조건 상세설정</h2>
							<span class="close">&times;</span>
							<div class="filter-content">
								<ul class="filter-list">
									<li class="filter-item" id="location"><span>지역</span>
										<ul class="sub-list location">
											<li>서울
									            <ul class="detail-list">
									                <li><label for="서울_전체"><input type="radio" id="서울_전체" name="location" value="서울_전체"> 서울 전체</label></li>
									                <li><label for="서울_강남"><input type="radio" id="서울_강남" name="location" value="서울_강남"> 강남</label></li>
									                <li><label for="서울_서초"><input type="radio" id="서울_서초" name="location" value="서울_서초"> 서초</label></li>
									                <li><label for="서울_잠실송파강동"><input type="radio" id="서울_잠실송파강동" name="location" value="서울_잠실송파강동"> 잠실/송파/강동</label></li>
									                <li><label for="서울_영등포여의도강서"><input type="radio" id="서울_영등포여의도강서" name="location" value="서울_영등포여의도강서"> 영등포/여의도/강서</label></li>
									                <li><label for="서울_건대성수왕십리"><input type="radio" id="서울_건대성수왕십리" name="location" value="서울_건대성수왕십리"> 건대/성수/왕십리</label></li>
									                <li><label for="서울_종로중구"><input type="radio" id="서울_종로중구" name="location" value="서울_종로중구"> 종로/중구</label></li>
									                <li><label for="서울_홍대합정마포"><input type="radio" id="서울_홍대합정마포" name="location" value="서울_홍대합정마포"> 홍대/합정/마포</label></li>
									                <li><label for="서울_성북노원중랑"><input type="radio" id="서울_성북노원중랑" name="location" value="서울_성북노원중랑"> 성북/노원/중랑</label></li>
									                <li><label for="서울_구로관악동작"><input type="radio" id="서울_구로관악동작" name="location" value="서울_구로관악동작"> 구로/관악/동작</label></li>
									            </ul>
									        </li>
											<li>경기
												<ul class="detail-list location_gyeonggi">
											        <li><label for="경기_전체"><input type="radio" id="경기_전체" name="location" value="경기_전체"> 경기 전체</label></li>
											        <li><label for="경기_성남시"><input type="radio" id="경기_성남시" name="location" value="경기_성남시"> 성남시(분당/판교/성남)</label></li>
											        <li><label for="경기_수원"><input type="radio" id="경기_수원" name="location" value="경기_수원"> 수원</label></li>
											        <li><label for="경기_용인화성"><input type="radio" id="경기_용인화성" name="location" value="경기_용인화성"> 용인/화성(동탄)</label></li>
											        <li><label for="경기_안양과천"><input type="radio" id="경기_안양과천" name="location" value="경기_안양과천"> 안양/과천</label></li>
											        <li><label for="경기_군포의왕"><input type="radio" id="경기_군포의왕" name="location" value="경기_군포의왕"> 군포/의왕</label></li>
											        <li><label for="경기_부천안산"><input type="radio" id="경기_부천안산" name="location" value="경기_부천안산"> 부천/안산/시흥/광명</label></li>
											        <li><label for="경기_평택오산"><input type="radio" id="경기_평택오산" name="location" value="경기_평택오산"> 평택/오산/안성</label></li>
											        <li><label for="경기_고양파주"><input type="radio" id="경기_고양파주" name="location" value="경기_고양파주"> 고양/파주</label></li>
											        <li><label for="경기_김포"><input type="radio" id="경기_김포" name="location" value="경기_김포"> 김포</label></li>
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
												<ul class="detail-list location_busan">
													<li><label for="부산_전체"><input type="radio"
															id="부산_전체" name="location" value="부산_전체" ${search.location eq "부산_전체" ? 'selected' : ''}> 부산 전체</label></li>
													<li><label for="부산_강서구"><input type="radio"
															id="부산_강서구" name="location" value="부산_강서구" ${search.location eq "부산_강서구" ? 'selected' : ''}> 강서구</label></li>
													<li><label for="부산_금정구"><input type="radio"
															id="부산_금정구" name="location" value="부산_금정구" ${search.location eq "부산_금정구" ? 'selected' : ''}> 금정구</label></li>
													<li><label for="부산_남구"><input type="radio"
															id="부산_남구" name="location" value="부산_남구" ${search.location eq "부산_남구" ? 'selected' : ''}> 남구</label></li>
													<li><label for="부산_동구"><input type="radio"
															id="부산_동구" name="location" value="부산_동구" ${search.location eq "부산_동구" ? 'selected' : ''}> 동구</label></li>
													<li><label for="부산_동래구"><input type="radio"
															id="부산_동래구" name="location" value="부산_동래구" ${search.location eq "부산_동래구" ? 'selected' : ''}> 동래구</label></li>
													<li><label for="부산_부산진구"><input type="radio"
															id="부산_부산진구" name="location" value="부산_부산진구" ${search.location eq "부산_부산진구" ? 'selected' : ''}> 부산진구</label></li>
													<li><label for="부산_북구"><input type="radio"
															id="부산_북구" name="location" value="부산_북구" ${search.location eq "부산_북구" ? 'selected' : ''}> 북구</label></li>
													<li><label for="부산_사상구"><input type="radio"
															id="부산_사상구" name="location" value="부산_사상구" ${search.location eq "부산_사상구" ? 'selected' : ''}> 사상구</label></li>
													<li><label for="부산_사하구"><input type="radio"
															id="부산_사하구" name="location" value="부산_사하구" ${search.location eq "부산_사하구" ? 'selected' : ''}> 사하구</label></li>
													<li><label for="부산_서구"><input type="radio"
															id="부산_서구" name="location" value="부산_서구" ${search.location eq "부산_서구" ? 'selected' : ''}> 서구</label></li>
													<li><label for="부산_수영구"><input type="radio"
															id="부산_수영구" name="location" value="부산_수영구" ${search.location eq "부산_수영구" ? 'selected' : ''}> 수영구</label></li>
													<li><label for="부산_연제구"><input type="radio"
															id="부산_연제구" name="location" value="부산_연제구" ${search.location eq "부산_연제구" ? 'selected' : ''}> 연제구</label></li>
													<li><label for="부산_영도구"><input type="radio"
															id="부산_영도구" name="location" value="부산_영도구" ${search.location eq "부산_영도구" ? 'selected' : ''}> 영도구</label></li>
													<li><label for="부산_중구"><input type="radio"
															id="부산_중구" name="location" value="부산_중구" ${search.location eq "부산_중구" ? 'selected' : ''}> 중구</label></li>
													<li><label for="부산_해운대구"><input type="radio"
															id="부산_해운대구" name="location" value="부산_해운대구" ${search.location eq "부산_해운대구" ? 'selected' : ''}> 해운대구</label></li>
													<li><label for="부산_기장군"><input type="radio"
															id="부산_기장군" name="location" value="부산_기장군" ${search.location eq "부산_기장군" ? 'selected' : ''}> 기장군</label></li>
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
													name="category" id="한식" value="한식" ${search.category eq "한식" ? 'selected' : ''}>한식</label></li>
											<li><label for="중식"><input type="radio"
													name="category" id="중식" value="중식" ${search.category eq "중식" ? 'selected' : ''}>중식</label></li>
											<li><label for="일식"><input type="radio"
													name="category" id="일식" value="일식" ${search.category eq "일식" ? 'selected' : ''}>일식</label></li>
											<li><label for="육류"><input type="radio"
													name="category" id="육류" value="육류" ${search.category eq "육류" ? 'selected' : ''}>육류</label></li>
											<li><label for="패밀리레스토랑"><input type="radio"
													name="category" id="패밀리레스토랑" value="패밀리레스토랑" ${search.category eq "패밀리레스토랑" ? 'selected' : ''}>패밀리레스토랑</label></li>
											<li><label for="카페"><input type="radio"
													name="category" id="카페" value="카페" ${search.category eq "카페" ? 'selected' : ''}>카페</label></li>
										</ul></li>
									<li class="filter-item" id="menu_price"><span>가격대</span>
										<ul class="sub-list">
											 <div class="price-range-selector">
										        <span class="price-select-label">최소 가격:</span>
										        <select class="price-select" name="minPrice" id="minPrice">
										            <option value="all">무제한</option>
										            <option value="10000">10,000원</option>
										            <option value="20000">20,000원</option>
										            <option value="30000">30,000원</option>
										            <option value="40000">40,000원</option>
										            <option value="50000">50,000원</option>
										            <option value="60000">60,000원</option>
										            <option value="70000">70,000원</option>
										            <option value="80000">80,000원</option>
										            <option value="90000">90,000원</option>
										            <option value="100000">100,000원</option>
										        </select>
										        <span class="price-select-label">최대 가격:</span>
										        <select class="price-select" name="maxPrice" id="maxPrice">
										            <option value="all">무제한</option>
										            <option value="10000">10,000원</option>
										            <option value="20000">20,000원</option>
										            <option value="30000">30,000원</option>
										            <option value="40000">40,000원</option>
										            <option value="50000">50,000원</option>
										            <option value="60000">60,000원</option>
										            <option value="70000">70,000원</option>
										            <option value="80000">80,000원</option>
										            <option value="90000">90,000원</option>
										            <option value="100000">100,000원</option>
									            </select>
										    </div>
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
													name="facilities" id="장애인_편의시설" value="장애인_편의시설">장애인
													편의시설</label></li>
											<li><label for="반려동물_동반"><input type="radio"
													name="facilities" id="반려동물_동반" value="반려동물_동반">반려동물
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
		</div>
	</div>
</form>
