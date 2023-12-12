<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href="${pageContext.request.contextPath }/resources/css/payment_info.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%-- <header>
		<jsp:include page="../top.jsp"></jsp:include>
	</header> --%>
	<div>
		<h1>결제 완료</h1>
			<div class="coment">
			결제가 완료 되었습니다!<br>
			결제정보를 확인해주세요.
			</div>
		
		<div class="center">
			<form action="${pageContext.request.contextPath }main" class="check_payment" name="checkInfo">
				<section class="reservation">
					<div class="res_num">
						<span class="res_info_detail">
							<img src="${pageContext.request.contextPath }/resources/img/payment_화살표.png" width="20">
							<span>예약정보</span>
						</span>
						<span class="res_num1">R231119_PR10<%--${} --%></span>
					</div>
					<hr>
					<div>
						<div class="reservation_div">
							<span class="res_info">업체명</span>
							<span class="res_address">
								<span class="res_name">프맄<%--${} --%></span>&nbsp;
								부산광역시 부산진구 서전로38번길<%--${} --%>
							</span>
						</div>
						
						<div class="reservation_div">
							<span class="res_info">예약 날짜</span>
							<span class="res_date">2023.12.31(일)<%--${} --%></span>
						</div>
						<div class="reservation_div">
							<span class="res_info">시간</span>
							<span class="res_date">18:00<%--${} --%></span>
						</div>
						<div class="reservation_div">
							<span class="res_info">예약자 이름</span>
							<span class="other_name">홍길동<%--${} --%></span>
						</div>
						<div class="reservation_div">
							<span class="res_info">휴대폰 번호</span>
							<span class="other_phone">010-1234-5678<%--${} --%></span>
						</div>
						<div class="reservation_div">
							<span class="res_info">인원수</span>
							<span class="res_per">2명<%--${} --%></span>
						</div>
						<div class="reservation_div">
							<span class="res_info">고객요청사항</span>
							<span class="request">기념일인데 좋은 자리로 부탁드려요<%--${} --%></span>
						</div>
					</div>
				</section>
				<section class="payment">
					<img src="${pageContext.request.contextPath }/resources/img/payment_화살표.png" width="20">
					<span class="pay_info_detail">결제정보</span>
					<hr>
					<div>
						<span class="pay_info">결제번호</span>
						<span class="res_num2">P1239df231127<%--${} --%></span>
					</div>
					<div>
						<span class="pay_info">이 름</span>
						<span class="other_name">홍길동<%--${} --%></span>
					</div>
					<div>
						<span class="pay_info">결제일시</span>
						<span class="pay_date">2023-11-27 17:29:39<%--${} --%></span>
					</div>
					<div>
						<span class="pay_info">결제수단</span>
						<span class="pay_method">신한카드<%--${} --%></span>
					</div>
						<hr>
					<div>
						<span class="pay_info">할인전 금액<%--${} --%></span>
						<span class="pay_money">127,000<%--${} --%>원</span>
					</div>
					<div id="payPriceInfo">
						<span class="pay_info"> </span>
						<span class="detail_price">
							<div class="info_price">
								<span class="menu_name">예약금</span>
								<span class="count">2인</span>
								<span class="price">20,000원</span>
							</div>
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
					<div id="payPointInfo">
						<span class="pay_info">포인트 사용<%--${} --%></span>
						<span class="pay_point">5,000<%--${} --%>원</span>
					</div>
					<div id="pointsEarned">
						<span class="pay_info_point">적립 포인트<%--${} --%></span>
						<span class="pay_point_earn">1,220<%--${} --%>원</span>
					</div>
					<div>
						<span class="pay_info">총 결제금액</span>
						<span class="total_money">122,000<%--${} --%>원</span>
					</div>
				</section>
				<button type="submit" class="checked" onclick="location.href=''">확인</button>
			</form>
		</div>
	</div>
</body>
</html>