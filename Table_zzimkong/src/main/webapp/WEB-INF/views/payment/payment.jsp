<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table 찜콩 - 결제</title>
<link href="${pageContext.request.contextPath }/resources/css/payment.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	window.onload = function() {
		
	// 	만약 포인트사용 가능한 금액이 결제금액 보다 적으면 포인트가 적습니다 표시 아니
	// 	라면 텍스트박스의 value값이 변하고 사용가능한 금액이 0원으로 변함
	// 	document.querySelector("#useAllPoint").onclick = function() {
	// 		if(document.payForm.)
	// 	};
		
		//전체동의 체크박스 선택시 동의란 모두 체크됨
		document.querySelector("#checkAllAgree").onclick = function() {
			for(let i = 0; i < document.payForm.agreement.length; i++) {
				document.payForm.agreement[i].checked = document.querySelector("#checkAllAgree").checked;
			}
		};
		
		//무통장 입금시 각은행별 계좌번호
		document.payForm.bankSelect.onchange = function() {
			switch (document.payForm.bankSelect.value) {
			case "신한": document.payForm.accNum.value = "111-1234-12345"; 
						break;
			case "국민": document.payForm.accNum.value = "222-1234-12345";
						break;
			case "우리": document.payForm.accNum.value = "333-1234-12345";
						break;
			case "하나": document.payForm.accNum.value = "444-1234-12345";
						break;
			case "농협": document.payForm.accNum.value = "555-1234-12345";
						break;
			case "기업": document.payForm.accNum.value = "666-1234-12345";
						break;
			case "시티": document.payForm.accNum.value = "777-1234-12345";
						break;
			case "SC": document.payForm.accNum.value = "888-1234-12345";
						break;
			case "우체국": document.payForm.accNum.value = "999-1234-12345";
						break;
			case "부산": document.payForm.accNum.value = "1010-1234-12345";
						break;
			case "대구": document.payForm.accNum.value = "1111-1234-12345";
						break;
			case "외환": document.payForm.accNum.value = "1212-1234-12345";
						break;
			case "카카오뱅크": document.payForm.accNum.value = "1313-1234-12345";
						break;
			case "케이뱅크": document.payForm.accNum.value = "1414-1234-12345";
						break;
			}
		};
		
		
	};
</script>
</head>
<body>
<!-- 	<header> -->
<%-- 		<jsp:include page="../top.jsp"></jsp:include> --%>
<!-- 	</header> -->
	<div class="div_outter">
		<div class="div_form_header">
			<span><h1>결제</h1></span>
			<span>
				<ul class="Breadcrumbs_article__24BXb">
					<li class="Breadcrumbs_item__3_-g5">
						예약
						<span class="Breadcrumbs_icon-arrow__2PDd_">
							<svg xmlns="http://www.w3.org/2000/svg" width="7" height="12" viewBox="0 0 6 10">
								<path fill="none" fill-rule="evenodd" stroke="#bbbbbd" d="M1 1l4 4-4 4"></path>
							</svg>
						</span>
					</li>
					<li class="Breadcrumbs_item__3_-g5 Breadcrumbs_show-highlight__14PcM">
						결제
						<span class="blind">현재 페이지</span>
					</li>
				</ul>
			</span>
		</div>
		<form action="payment/info" name="payForm">
			<div class="div_inner">
				<div class="div_left_box">
					<section id="leftSec01" class="section_box">
						<h2>쿠폰/포인트</h2>
						<div class="coupon_and_point">
							<div class="coupon">
								<div class="font_stlye">쿠폰선택</div>
								<select class="select_coupon">
									<option value="" >쿠폰을 선택해주세요</option>
								</select>
								<button class="use_button"  type="button">사용하기</button>
							</div>
							<div class="point">
								<div class="point_result">
									<span class="font_stlye">포인트</span> 
									<span class="point_available">사용가능금액 <span id="useable">1000<%--${} --%></span>원</span>
								</div>
								<input type="text" value="0원" class="point_to_use">
								<button id="useAllPoint" class="use_button"  type="button">전액사용</button>
							</div>
						</div>
					</section>
					<section id="leftSec02" class="section_box">
						<h2>결제수단</h2>
						<div class="choice_pay">
							<div>
								<input type="radio" name="onSitePayment" value="현장결제"><span class="font_stlye">메뉴만 현장결제</span>
								<span class="on_site_payment">선택시 노쇼방지 예약금만 결제 됩니다.</span>
							</div>	
							<br>
							<div>
								<input type="radio" name="payment" value="카드결제"><span class="font_stlye">카드결제</span>
								<select class="select" id="cardSelect" name="cardSelect">
									<option value="">카드사를 선택해 주세요</option>
									<option value="삼성">삼성</option>
									<option value="신한">신한</option>
									<option value="현대">현대</option>
									<option value="국민">국민</option>
									<option value="비씨">비씨</option>
									<option value="롯데">롯데</option>
									<option value="우리">우리</option>
									<option value="하나">하나</option>
									<option value="농협">농협</option>
									<option value="씨티">씨티</option>
								</select>
							</div>
							<br>
							<div>
								<input type="radio" name="payment" value="무통장입금"><span class="font_stlye">무통장입금</span>
								<span class="pm_acc_comment">20분 이내 입금되지 않으면 자동 취소됩니다.</span>
								<br>
								<select class="select_b" id="bankSelect" name="bankSelect">
									<option value="">입금은행</option>
									<option value="신한">신한</option>
									<option value="국민">국민</option>
									<option value="우리">우리</option>
									<option value="하나">하나</option>
									<option value="농협">농협</option>
									<option value="씨티">씨티</option>
									<option value="기업">기업</option>
									<option value="SC">SC</option>
									<option value="우체국">우체국</option>
									<option value="부산">부산</option>
									<option value="대구">대구</option>
									<option value="외환">외환</option>
									<option value="카카오뱅크">카카오뱅크</option>
									<option value="케이뱅크">케이뱅크</option>
								</select>
								<input type="text" placeholder="계좌번호" class="account" name="accNum">
							</div>
							<br>
							<div>	
								<input type="radio" name="payment" value="휴대폰결제"><span class="font_stlye">휴대폰결제</span>
								<br>
								<div class="tele_com">
									<input type="radio" name="telecom" value="SK">SK
									<input type="radio" name="telecom" value="KT">KT
									<input type="radio" name="telecom" value="U+">U+
								</div>
							</div>
							<div class="tele_detail">
								<input type="text" placeholder="핸드폰 번호를 입력해주세요." class="phone_num_text">
								<button class="phone_button1"  type="button">인증번호 발송</button>
								<br>
								<input type="text" placeholder="인증번호를 입력해 주세요." class="check_num">
								<button class="phone_button2"  type="button">인증하기</button>
							</div>
						</div>
					</section>
					<section id="leftSec03" class="section_box">
						<h2>약관 동의</h2>
						<div class="agree_top">
							<div class="agree_main">
							<span>
								<input type="checkbox" value="전체동의" class="agree" id="checkAllAgree">
								<span>
									<span class="all_agree">[전체동의]</span>
									 서비스약관에 동의 합니다.
								</span>
							</span>
							<span><a href="#" class="info-content">보기</a></span>
							</div>
							<div class="agree_main">
								<span>
									<input type="checkbox" name="agreement" value="결제대행동의" class="agree">
									<span>
										<span class="agree_font">[필수]</span> 
										결제 대행 서비스 이용 약관 동의 합니다.
									</span>
								</span>
								<span>
									<a href="#" class="info-content">보기</a>
								</span>
							</div>	
							<div class="agree_main">
								<span>
									<input type="checkbox" name="agreement" value="취소환불동의" class="agree">
									<span>
										<span class="agree_font">[필수]</span> 
										취소 및 환불규정 동의 합니다.
									</span>
								</span>
								<span>
									<a href="#" class="info-content">보기</a>
								</span>
							</div>
							<div class="agree_main">
								<span>
									<input type="checkbox" name="agreement" value="개인정보동의" class="agree">
									<span>
										<span class="agree_font">[선택]</span> 
										개인정보 제3자 제공 동의 합니다.
									</span>
								</span>
								<span>
									<a href="#" class="info-content">보기</a>
								</span>
							</div>
						</div>
					</section>
					<div class="div_submit">
						<button type="submit" class="pay_button">결제</button> 
					</div>
				</div>
				<div class="div_right_box">
					<div class="right_box_stiky">
						<section id="rightSec01" class="section_box">
							<div class="res_header">
								<h2 id="res_h2">예약 상세</h2><h3 class="res_num">R231119_PR10<%--${} --%></h3>
							</div>
							<div class="res_main">
								<ul>
									<li class="res_li">
										<h3 class="res_com_name">프맄<%--${} --%></h3>
										<span class="res_add">부산광역시 부산진구 서전로38번길<%--${} --%></span>
									</li>
									<li class="res_li">
										<span class="res_info">예약 날짜</span>
										<span class="date_detail">2023.12.31(일)<%--${} --%></span>
									</li>
									<li class="res_li">
										<span class="res_info">시간</span>
										<span class="date_detail">18:00<%--${} --%></span>
									</li>
									<li class="res_li">
										<span class="res_info">예약자명</span>
										<span class="other_name">홍길동<%--${} --%></span>
									</li>
									<li class="res_li">
										<span class="res_info">휴대폰 번호</span>
										<span class="phone_num">010-1234-5678<%--${} --%></span>
									</li>
									<li class="res_li">
										<span class="res_info">인원수</span>
										<span class="per_detail">2<%--${} --%>명</span>
									</li>
									<li>
										<div class="res_info">고객 요청사항</div>
										<div class="request_detail">기념일인데 좋은 자리로 부탁드려요<%--${} --%></div>
									</li>
								</ul>
							</div>
						</section>
						<section id="rightSec02" class="section_box">
							<h2>결제 상세</h2>
							<div class="total">
								<div class="price_detail">
									<div>
										<span class="detail">예약금액</span>
										<span class="detail_price">20,000<%--${} --%>원</span>
									</div>
									<div>
										<span class="detail">메뉴 선결제금액</span>
										<span class="detail_price">0<%--${} --%>원</span>
									</div> 
									<div>
										<span class="detail"> </span>
										<span class="detail_price">
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
									<div>
										<span class="detail">쿠폰할인</span>
										<span class="detail_price">0<%--${} --%>원</span>
									</div> 
									<div>
										<span class="detail">포인트할인</span>
										<span class="detail_price">0<%--${} --%>원</span>
									</div> 
								</div>
								<div class="point">
								<div class="points_earn">
									<span class="detail">적립예정 포인트</span>
									<span class="detail_price">0<%--${} --%>원</span>
								</div>
								<div>
										<span class="detail"> </span>
										<span class="detail_price">
											<div class="info_price">
												<span class="menu_name">현제 포인트</span>
												<span class="price">1,000원</span>
											</div>
											<div class="info_price">
												<span class="menu_name">총 포인트</span>
												<span class="price">1,270원</span>
											</div>
										</span>
									</div> 
								</div>
								<div class="total_detail">
									<span class="total_info">총 결제 금액</span>
									<span class="total_price">127,000<%--${} --%>원</span>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</form>
	</div>
	
<%--	<footer>
	
	</footer> --%>
</body>
</html>