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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/payment.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/payment_API.js"></script>
<script type="text/javascript"> 
	function paymentAgreeView() {
			/* 팝업창 중앙 정렬 */
			var popupW = 950;
			var popupH = 700;
			var left = Math.ceil((window.screen.width - popupW)/2);
			var top = Math.ceil((window.screen.height - popupH)/2);
			window.open('${pageContext.request.contextPath }/payment/agree','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
		}
</script>
</head>
<body>
 	<header>
		<jsp:include page="../inc/top2.jsp"></jsp:include>
	</header>
	<form action="paymentPro" name="payForm" method="POST">
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
			<div class="div_inner">
				<div class="div_left_box">
					<section id="leftSec01" class="section_box">
						<h2>쿠폰/포인트</h2>
						<div class="coupon_and_point">
							<div class="coupon">
								<div class="font_stlye">쿠폰선택</div>
								<select class="select_coupon" name="selectCoupon">
									<option value="" >쿠폰을 선택해주세요</option>
									<option value="5000" >[신규회원] 가입축하기념 5,000원 할인</option>
									<option value="0.1" >[크리스마스] 크리스마스외식 테이블찜콩 10% 할인</option>
								</select>
								<button id="useCoupone" class="use_button"  type="button">사용하기</button>
							</div>
							<div class="point">
								<div class="point_result">
									<span class="font_stlye">포인트</span> 
									<span class="point_available">
										사용가능금액&nbsp;
										<span id="useablePoint">
 											${map.paymentInfo.totalPoint}
										</span>
										원
										 &nbsp; <span><a id="useAllPoint">전액사용</a></span>
									</span>
								</div>
								<input type="text" value="" placeholder="0" class="point_to_use" name="pointToUse"/><span class="won">원</span>
								<button id="usePoint" class="use_button"  type="button">사용하기</button>
							</div>
						</div>
					</section>
					<section id="leftSec02" class="section_box">
						<h2>결제수단</h2>
						<div class="choice_pay">
							<div>
								<input type="radio" name="pay_on_sit" value="2" id="onSitePayment"><span class="font_stlye"> 메뉴만 현장결제</span>
								<span class="pay_on_sit">* 선택시 노쇼방지 예약금만 결제 됩니다.</span>
							</div>	
							<br>
							<div>
								<input type="radio" name="pay_method" value="1" id="kakaoPay">&nbsp;
								<img src="${pageContext.request.contextPath }/resources/img/kakaoPay_png.png" width="65" id="kakao">
								<span class="font_stlye"> </span>
							</div>
							<br>
							<div>
								<input type="radio" name="pay_method" value="2" id="naverPay">&nbsp;
								<img src="${pageContext.request.contextPath }/resources/img/naverPay_png.png" width="65" id = "naver">
								<span class="font_stlye"> </span>
							</div>
							<br>
							<div>
								<input type="radio" name="pay_method" value="3" id="creditCardPayment"><span class="font_stlye"> 카드결제</span>
<!-- 								<select class="select" id="cardSelect" name="pay_card_co"> -->
<!-- 									<option value="">카드사를 선택해 주세요</option> -->
<!-- 									<option value="삼성">삼성</option> -->
<!-- 									<option value="신한">신한</option> -->
<!-- 									<option value="현대">현대</option> -->
<!-- 									<option value="국민">국민</option> -->
<!-- 									<option value="비씨">비씨</option> -->
<!-- 									<option value="롯데">롯데</option> -->
<!-- 									<option value="우리">우리</option> -->
<!-- 									<option value="하나">하나</option> -->
<!-- 									<option value="농협">농협</option> -->
<!-- 									<option value="씨티">씨티</option> -->
<!-- 								</select> -->
							</div>
							<br>
							<div>
								<input type="radio" name="pay_method" value="4" id="accountPayment"><span class="font_stlye"> 무통장입금</span>
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
								<input type="text" placeholder="계좌번호" value="" class="account" name="accNum" readonly>
							</div>
							<br>
							<div>	
								<input type="radio" name="pay_method" value="5" id="mobilePhonePayment"><span class="font_stlye"> 휴대폰결제</span>
							</div>
						</div>
					</section>
					<section id="leftSec03" class="section_box">
						<h2>약관 동의</h2>
						<div class="agree_top">
							<div class="agree_main">
							<span>
								<input type="checkbox" name="checkAllAgree" value="전체동의" class="agree" id="checkAllAgree">
								<span class="each_agree">
									<span class="all_agree">[전체동의]</span>
									 서비스약관에 동의 합니다.
								</span>
							</span>
							<span></span>
							</div>
							<div class="agree_main">
								<span>
									<input type="checkbox" id="payAgree" name="agreement" class="agree">
									<span class="each_agree">
										<span class="agree_font">[필수]</span> 
										결제 대행 서비스 이용 약관 동의 합니다.
									</span>
								</span>
								<span>
									<a onclick="paymentAgreeView()" class="info-content agree">보기</a>
								</span>
							</div>	
							<!-- 예약에 있어서 주석 -->
<!-- 							<div class="agree_main"> -->
<!-- 								<span> -->
<!-- 									<input type="checkbox" id="revocationAgree" name="agreement" class="agree"> -->
<!-- 									<span class="each_agree"> -->
<!-- 										<span class="agree_font">[필수]</span>  -->
<!-- 										취소 및 환불규정 동의 합니다. -->
<!-- 									</span> -->
<!-- 								</span> -->
<!-- 								<span> -->
<!-- 									<a href="#" class="info-content">보기</a> -->
<!-- 								</span> -->
<!-- 							</div> -->
							<div class="agree_main">
								<span>
									<input type="checkbox" name="per_info_consent" class="agree">
									<span class="each_agree">
										<span class="agree_font">[선택]</span> 
										개인정보 제3자 제공 동의 합니다.
									</span>
								</span>
								<span>
									<a onclick="paymentAgreeView()" class="info-content agree">보기</a>
								</span>
							</div>
						</div>
					</section>
					<div class="div_submit">
						<button type="submit" class="pay_button">결제</button> 
						<button type="button" class="pay_button" id="api">API 결제</button> 
					</div>
				</div>
				<div class="div_right_box">
					<div class="right_box_stiky">
						<section id="rightSec01" class="section_box">
							<div class="res_header">
								<h2 id="res_h2">예약 상세</h2><h3 class="res_num">${map.res.res_num}</h3>
				  <%-- param--%><input type="hidden" value="${map.res.res_num}" id="res_num" name="res_num">
							</div>
							<div class="res_main">
								<ul>
									<li class="res_li">
										<span class="res_info">상호명</span>
										<h3 class="res_com_name">${map.com.com_name}</h3>
					  	  <%-- param--%><input type="hidden" id="com_name" value="${map.com.com_name}" name="com_name">
									</li>
									<li class="res_li">
										<span class="res_info">주소</span>
										<span class="res_add">${map.com.com_address}</span>
						  <%-- param--%><input type="hidden" value="${map.com.com_address}" name="com_address">
									</li>
									<li class="res_li">
										<span class="res_info">예약 날짜</span>
										<span class="date_detail">${map.res.res_date}</span>
						  <%-- param--%><input type="hidden" value="${map.res.res_date}" name="res_date">
									</li>
									<li class="res_li">
										<span class="res_info">시간</span>
										<span class="date_detail">${map.res.res_time}</span>
						  <%-- param--%><input type="hidden" value="${map.res.res_time}" name="res_time">
									</li>
									<li class="res_li">
										<span class="res_info">방문자명</span>
										<span class="other_name">
											${map.res.res_name}
										</span>
						  <%-- param--%><input type="hidden" value="${map.res.res_name}" name="res_name">
									</li>
									<li class="res_li">
										<span class="res_info">휴대폰 번호</span>
										<span class="phone_num">
											${map.res.res_phone}
										</span>
						  <%-- param--%><input type="hidden" value="${map.res.res_phone}" name="res_phone">
									</li>
									<li class="res_li">
										<span class="res_info">인원수</span>
										<span class="per_detail">${map.res.res_person} 명</span>
						  <%-- param--%><input type="hidden" value="${map.res.res_person}" name="res_person" id="res_person">
									</li>
									<li class="res_li2">
										<div class="res_info">고객 요청사항</div>
										<div class="request_detail">${map.res.res_request}</div>
						  <%-- param--%><input type="hidden" value="${map.res.res_request}" name="res_request">
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
										<span class="detail_price"><span id="reservationPrice">${map.paymentInfo.res_table_price}</span> 원</span>
										<%--paymentVO --%>
						 <%-- param--%> <input type="hidden" value="${map.res.res_table_price}" name="pay_per_price"/>
									</div>
									<c:choose>
										<c:when test="${empty map.poi[0].pre_idx}">
											<div>
												<span class="detail">메뉴 선결제금액</span>
												<span class="detail_price">
													<span id="preOrderTotalPrice">선주문 없음</span>
												</span>
											</div>  
										</c:when>
										<c:otherwise> 
											<div>
												<span class="detail">메뉴 선결제금액</span>
												<span class="detail_price">
													<span id="preOrderTotalPrice" >
														${map.paymentInfo.menuTotalPrice }
													</span> 원
		 										</span>
											</div>  
										<%-- 여기부터 선결제 있으면 표시함 --%>
											 <div>
												<span class="detail"> </span>
												<span class="detail_price">
											 	<c:forEach var="preOrder" items="${map.poi }">
													<div class="info_price">
														<span class="menu_name">${preOrder.menu_name}</span>
									   	  <%-- param--%><input type="hidden" value="${preOrder.menu_name}" name="PreOrderStatus"/>
														<span class="count">
															<span>${preOrder.pre_num}</span>
											  <%-- param--%><input type="hidden" value="${preOrder.pre_num}" name="PreOrderStatus"/>
															개
														</span>
														<span class="price">
															<span>${preOrder.eachMenuTotalPrice}</span>
															 원
														</span>
													</div>
											 	</c:forEach>
											 		</span>
												</div>	
								 		</c:otherwise>
									</c:choose>
									<div>
										<span class="detail">쿠폰할인</span>
										 <span class="detail_price">
										 	- 
										 	<span id="discountCoupon">0</span>
										 	원
										 </span>
									</div> 
									<div>
										<span class="detail">포인트할인</span>
										<span class="detail_price">
											- 
											<span id="discountPoint">0</span>
											원
										</span>
									</div> 
								</div>
								<div class="point">
									<div class="points_earn">
										<span class="detail">적립예정 포인트</span>
										<span class="detail_price">
											<span id="earnedPoints">0</span> 원
										</span>
									</div>
									<div>
										<span class="detail"> </span>
										<span class="detail_price">
											<div class="info_price">
												<span class="menu_name2">현재 포인트</span>
												<span class="price" >
													<span id="nowPoint">${map.paymentInfo.totalPoint}</span>
													원
												</span>
											</div>
											<div class="info_price">
												<span class="menu_name2">총 포인트</span>
												<span class="price">
													<span id="totalPoint">0</span>
													원
												</span>
											</div>
										</span>
									</div> 
								</div>
								<div class="total_detail">
									<span class="total_info">총 결제 금액</span>
									<span class="total_price" >
										<span id="totalPayment">${map.paymentInfo.totalPrice}</span>
										원
									</span>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<%--info페이지에 필요한 할인전 예약금액 --%>
		<input type="hidden" value="${map.paymentInfo.totalPrice}" name="beforeDiscountTotalPrice"/>
		<input type="hidden" value="${map.res.res_idx}" name="res_idx"/>
		<input type="hidden" value="${map.pay}" name="pay_num" id="pay_num"/>
		<input type="hidden" value="${map.member.user_email}" name="user_email" id="user_email"/>
		<input type="hidden" value="${map.member.user_name}" name="user_name" id="user_name"/>
		<input type="hidden" value="${map.member.user_name}" name="user_name" id="user_name"/>
	</form>
	
	<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer> 
</body>
</html>