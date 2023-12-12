<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>예약</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/global.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
<script src="${pageContext.request.contextPath }/resources/js/reservation.js"></script>

</head>
<body>
<!--  <header> -->
<%--  	<jsp:include page="../inc/top_ns.jsp"></jsp:include> --%>
<!--  </header> -->
 <form action="${pageContext.request.contextPath }/payment" name="reservation" onsubmit="return btnPay();">
<!-- 	<action="" name="reservation" onsubmit="return validateForm()"> -->
	<div class="out_block">
		<!-- 찜버튼 박스 -->
		<h1>예약</h1>
		<div class="block">
			<span>
				<button type="submit">10:00 분</button>
				10분간 예약 찜! 시간내 예약을 완료해 주세요.
			</span>
			<span>
				<ol class="status--2Vl8oROKh3">
					<li class="now--3JOiYDgRis">
						예약
						<span class="blind">현재 단계</span>
					</li>
					<li>
						<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_status--2cyINN3I2q">
							<path d="M5.834 14.572a.5.5 0 1 0 .707.707l-.707-.707zM11.813 9.3l.353.354a.5.5 0 0 0 0-.708l-.354.354zM6.54 3.321a.5.5 0 1 0-.707.708l.707-.708zm0 11.958l5.625-5.625-.707-.708-5.625 5.626.707.707zm5.625-6.333L6.541 3.321l-.707.708 5.625 5.625.707-.708z" fill="#000" fill-opacity="0.1"></path>
						</svg>
						주문/결제
					</li>
					<li>
						<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_status--2cyINN3I2q">
							<path d="M5.834 14.572a.5.5 0 1 0 .707.707l-.707-.707zM11.813 9.3l.353.354a.5.5 0 0 0 0-.708l-.354.354zM6.54 3.321a.5.5 0 1 0-.707.708l.707-.708zm0 11.958l5.625-5.625-.707-.708-5.625 5.626.707.707zm5.625-6.333L6.541 3.321l-.707.708 5.625 5.625.707-.708z" fill="#000" fill-opacity="0.1"></path>
						</svg>
						완료
					</li>
				<ol>
			</span>
		</div>
		<div class="inner_block">
			<!-- 예약정보 박스 -->
			<div class="section_box">
				<section class="sec01">
					<h2>예약 정보</h2>
					<div class="info_tag">
						<div class="info">
							<span class="info_title">식당이름</span>
							<span class="info_content">프륔</span>
						</div>
						<div class="info">
							<span class="info_title">예약 날짜</span>
							<span class="info_content">2023.12.31(일)</span>
						</div>
						<div class="info">
							<span class="info_title">예약 시간</span>
							<span class="info_content">18:00</span>
						</div>
						<div class="info">
							<span class="info_title">인원</span>
							<span class="info_content">2명</span>
						</div>
						<div class="info">
							<span class="info_title">예약 금액</span>
							<span class="info_content"><b>20,000</b>원</span>
						</div>
						<div class="info" id="menu_price">
							<span class="info_title">주문한 메뉴</span>
							<span class="info_content"><b>107,000</b>원</span>
						</div>
						<div class="info">
							<span class="info_title"> </span>
							<span class="info_content" id="menu_content">
								<div class="info_price">
									<span class="menu_name">시저샐러드</span>
									<span class="count">1개</span>
									<span class="price">18,000원</span>
								</div>
								<div class="info_price">
									<span class="menu_name">뇨끼파스타</span>
									<span class="count">1개</span>
									<span class="price">24,000원</span>
								</div>
								<div class="info_price">
									<span class="menu_name">안심스테이크</span>
									<span class="count">1개</span>
									<span class="price">55,000원</span>
								</div>
							</span>
						</div>
						<hr>
						<div class="info">
							<span class="info_title">총 결제금액</span>
							<span class="info_content"><b>127,000</b>원</span>
						</div>
					</div>
				</section>
			</div>
			<!-- 예약자 정보 박스 -->
			<div class="section_box">
				<section class="sec02">
					<h2>예약자 정보</h2>
					<div class="name_number">
						<div class="input_box">
							<h3>성명</h3>
		             		<input type="text" placeholder="성명을 입력해주세요." name="resName" class="name">
		            	</div>
			            <div class="input_box">
							<h3>연락처</h3>
			            	<input type="text" placeholder="휴대폰 번호를 입력해주세요." name="resNumber" class="number">
			            </div>
					</div>
				</section>
			</div>
			<!-- 방문자 정보 박스 -->
			<div class="section_box">
				<section class="sec03">
					<h2>방문자 정보</h2>
					<div class="sec03_info">
						<span>
							<input type="checkbox" id="checkbox_same_info"><span class="sec03_info_1">예약자 정보와 동일합니다.</span>
						</span>						
						<span class="sec03_info_2">
							* 예약자와 방문자가 다를 시 방문자 정보 입력
						</span>
					</div>
					<div class="name_number">
						<div class="input_box">
							<h3>성명</h3>
		             		<input type="text" placeholder="성명을 입력해주세요." name="name" class="name">
		            	</div>
			            <div class="input_box">
							<h3>연락처</h3>
			            	<input type="text" placeholder="휴대폰 번호를 입력해주세요." name="number" class="number">
			            </div>
					</div>
				</section>
			</div>
			<!-- 고객요청사항 -->
			<div class="section_box">
				<section class="sec04">
					<h2>고객 요청사항</h2>
					<textarea placeholder="요청하실 내용을 입력해주세요."></textarea>
					
				</section>
			</div>
			<!-- 예약금 및 환불 정책안내 박스 -->
			<div class="section_box">
				<section class="sec05">
					<h2>예약금 및 환불 정책안내</h2>
					<textarea readonly="readonly"></textarea><br>
					<input type="checkbox" name="agree" id="checkbox_agree"><span>예약약관에 동의합니다.</span>
				</section>
			</div>
			<!-- 가게유의사항 -->
			<div class="section_box">
				<section class="sec06">
					<h2>가게유의사항</h2>
					<div class="agree_top">
						<span>
							<input type="checkbox" name="check" id="checkAll" onclick="checkbox_allCheck()">
							<span class="agree_content">
								<span class="all_agree">[전체동의]</span>
								 유의사항에 전체 동의 합니다.
							</span>
						</span>
						<span>
							<a href="#" class="info-content">보기</a>
						</span>
					</div>
					<div class="agree_main">
						<span>
							<input type="checkbox" name="check">
							<span class="agree_content">
								<span class="agree_font">[필수]</span> 
								식사 이용시간은 최대 2시간입니다.
							</span>
						</span>
						<span>
							<a href="#" class="info-content">보기</a>
						</span>
					</div>	
					<div class="agree_main">
						<span>
							<input type="checkbox" name="check">
							<span class="agree_content">
								<span class="agree_font">[필수]</span> 
								<span>
									예약시 결제하신 금액은 예약금으로 현장 방문시 환불 후<br> 식사금 전액 현장 결제 될 예정입니다.
								</span>
							</span>
						</span>
						<span>
							<a href="#" class="info-content">보기</a>
						</span>
					</div>
					<div class="agree_main">
						<span>
							<input type="checkbox" name="check">
							<span class="agree_content">
								<span class="agree_font">[선택]</span> 
								애견동반은 불가능 합니다.
							</span>
						</span>
						<span>
							<a href="#" class="info-content">보기</a>
						</span>
					</div>
					<div class="agree_main">
						<span>
							<input type="checkbox" name="check">
							<span class="agree_content">
								<span class="agree_font">[선택]</span> 
								예약시간에서 20분이상 늦어 지실 경우 노쇼로 처리 됩니다.
							</span>
						</span>
						<span>
							<a href="#" class="info-content">보기</a>
						</span>
					</div>
				</section>
			</div>
			<button type="button" class="payment" onclick="btnPay();">결제하기</button>
		</div>
		<!-- 	</action> -->
	</div>
 </form>
<!--  <footer> -->
<%--  	<jsp:include page="../inc/bottom.jsp"></jsp:include> --%>
<!--  </footer> -->
</body>
</html>