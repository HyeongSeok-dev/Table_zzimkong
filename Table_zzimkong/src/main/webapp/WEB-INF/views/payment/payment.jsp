<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table 찜콩 - 결제</title>
<link href="${pageContext.request.contextPath }/resources/css/payment.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/payment.js"></script>
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
								<select class="select_coupon" name="selectCoupon">
									<option value="" >쿠폰을 선택해주세요</option>
									<option value="신규회원쿠폰1" >[신규회원] 가입축하기념 5000원 할인</option>
									<option value="크리스마스쿠폰1" >[크리스마스] 크리스마스외식 테이블찜콩 10% 할인</option>
								</select>
								<button class="use_button"  type="button">사용하기</button>
							</div>
							<div class="point">
								<div class="point_result">
									<span class="font_stlye">포인트</span> 
									<span class="point_available">
										사용가능금액
										<span id="useablePoint">
											<%-- ${param.} --%>1000
										</span>
										원
									</span>
								</div>
								<input type="text" value="" placeholder="0원" class="point_to_use" name="pointToUse">
								<button id="useAllPoint" class="use_button"  type="button">전액사용</button>
							</div>
						</div>
					</section>
					<section id="leftSec02" class="section_box">
						<h2>결제수단</h2>
						<div class="choice_pay">
							<div>
								<input type="radio" name="onSitePayment" value="현장결제" id="onSitePayment"><span class="font_stlye">메뉴만 현장결제</span>
								<span class="on_site_payment">선택시 노쇼방지 예약금만 결제 됩니다.</span>
							</div>	
							<br>
							<div>
								<input type="radio" name="choicePayment" value="카드결제" id="creditCardPayment"><span class="font_stlye">카드결제</span>
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
								<input type="radio" name="choicePayment" value="무통장입금" id="accountPayment"><span class="font_stlye">무통장입금</span>
								<span class="pm_acc_comment">20분 이내 입금되지 않으면 예약은 자동 취소됩니다.</span>
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
								<input type="text" placeholder="계좌번호" value="" class="account" name="accNum">
							</div>
							<br>
							<div>	
								<input type="radio" name="choicePayment" value="휴대폰결제" id="mobilePhonePayment"><span class="font_stlye">휴대폰결제</span>
							</div>
						</div>
					</section>
					<section id="leftSec03" class="section_box">
						<h2>약관 동의</h2>
						<div class="agree_top">
							<div class="agree_main">
							<span>
								<input type="checkbox" name="checkAllAgree" value="전체동의" class="agree" id="checkAllAgree">
								<span>
									<span class="all_agree">[전체동의]</span>
									 서비스약관에 동의 합니다.
								</span>
							</span>
							<span><a href="#" class="info-content">보기</a></span>
							</div>
							<div class="agree_main">
								<span>
									<input type="checkbox" id="payAgree" name="agreement" value="결제대행동의" class="agree">
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
									<input type="checkbox" id="revocationAgree" name="agreement" value="취소환불동의" class="agree">
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
								<h2 id="res_h2">예약 상세</h2><h3 class="res_num">R231119_PR10<%--${param.res_num} --%></h3>
							</div>
							<div class="res_main">
								<ul>
									<li class="res_li">
										<span class="res_info">상호명</span>
										<h3 class="res_com_name">프맄<%--${} --%></h3>
									</li>
									<li class="res_li">
										<span class="res_info">주소</span>
										<span class="res_add">부산광역시 부산진구 서전로38번길<%--${} --%></span>
									</li>
									<li class="res_li">
										<span class="res_info">예약 날짜</span>
										<span class="date_detail">2023.12.31 (일)<%--${} --%></span>
									</li>
									<li class="res_li">
										<span class="res_info">시간</span>
										<span class="date_detail">18:00<%--${} --%></span>
									</li>
									<li class="res_li">
										<span class="res_info">방문자명</span>
										<span class="other_name">dd
											<%-- ${param.name} --%>
										</span>
									</li>
									<li class="res_li">
										<span class="res_info">휴대폰 번호</span>
										<span class="phone_num">dd
											<%-- ${param.number} --%>
										</span>
									</li>
									<li class="res_li">
										<span class="res_info">인원수</span>
										<span class="per_detail">2<%--${} --%>명</span>
									</li>
									<li class="res_li2">
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
										<span class="detail_price"><span id="reservationPrice">20,000<%--${} --%></span>원</span>
									</div>
									<div>
										<span class="detail">메뉴 선결제금액</span>
										<span class="detail_price">
									<%--  <c:choose>
												<c:when test="${param.resMenuPrice eq null }"> --%>
													<span id="preOrderTotalPrice" name="preOrderIsNone">선결제 없음</span>
										</span>
									</div>  
												<%-- </c:when>
												<c:otherwise> --%>
													<!-- <span id="preOrderTotalPrice" name="PreOrderIsExist">
													97,000 -->
												<%-- 	${param.resMenuPrice } --%>
											<!-- 		</span>원
 										</span>
 									</div>  -->
									<%-- 여기부터 선결제 있으면 표시함 --%>
									<%-- <div>
										<span class="detail"> </span>
										<span class="detail_price">
											<div class="info_price">
												<span class="menu_name">시저샐러드</span>
												<span class="count">
													<span>1</span>
													개
												</span>
												<span class="price">
													<span>18,000${}</span>
													원
												</span>
											</div>
											<div class="info_price">
												<span class="menu_name">뇨끼파스타</span>
												<span class="count">
													<span>1</span>
													개
												</span>
												<span class="price">
													<span>24,000${}</span>
													원
												</span>
											</div>
											<div class="info_price">
												<span class="menu_name">안심스테이크</span>
												<span class="count">
													<span>1</span>
													개
												</span>
												<span class="price">
													<span>55,000${}</span>
													원
												</span>
											</div>
										</span>
									</div>  --%>
										<%-- 		</c:otherwise>
											</c:choose> --%>
									<div>
										<span class="detail">쿠폰할인</span>
										 <span class="detail_price">
										 	- 
										 	<span>0<%--${} --%></span>
										 	원
										 </span>
									</div> 
									<div>
										<span class="detail">포인트할인</span>
										<span class="detail_price">
											- 
											<span id="discountPoint">0<%--${} --%></span>
											원
										</span>
									</div> 
								</div>
								<div class="point">
								<div class="points_earn">
									<span class="detail">적립예정 포인트</span>
									<span class="detail_price"><span id="receivePoint">1,270<%--${} --%></span>원</span>
								</div>
								<div>
										<span class="detail"> </span>
										<span class="detail_price">
											<div class="info_price">
												<span class="menu_name2">현제 포인트</span>
												<span class="price" >
													<span id="nowPoint">1,000<%--${} --%></span>
													원
												</span>
											</div>
											<div class="info_price">
												<span class="menu_name2">총 포인트</span>
												<span class="price">
													<span id="totalPoint">2,270<%--${} --%></span>
													원
												</span>
											</div>
										</span>
									</div> 
								</div>
								<div class="total_detail">
									<span class="total_info">총 결제 금액</span>
									<span class="total_price" >
										<span id="totalPayment">127,000<%--${} --%></span>
										원
									</span>
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