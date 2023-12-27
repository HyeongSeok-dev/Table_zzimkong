<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href="${pageContext.request.contextPath }/resources/css/payment_info.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>

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
		<!-- dd -->
		<div class="center">
			<form action="../" class="check_payment" name="checkInfo">
				<section class="reservation">
					<div class="res_num">
						<span class="res_info_detail">
							<img src="${pageContext.request.contextPath }/resources/img/payment_화살표.png" width="20">
							<span>예약정보</span>
						</span>
						<span class="res_num1">${res.res_num}</span>
					</div>
					<hr>
					<div>
						<div class="reservation_div">
							<span class="res_info">업체명</span>
							<span class="res_address">
								<span class="res_name">${com.com_name}</span>&nbsp;
								${com.com_address}
							</span>
						</div>
						
						<div class="reservation_div">
							<span class="res_info">예약 날짜</span>
							<span class="res_date">${res.res_now}</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">시간</span>
							<span class="res_date">${res.res_date }</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">방문자 이름</span>
							<span class="other_name">${res.res_name }</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">휴대폰 번호</span>
							<span class="other_phone">${res.res_phone }</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">인원수</span>
							<span class="res_per">${res.res_person }명</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">고객요청사항</span>
							<span class="request">${res.res_request }</span>
						</div>
					</div>
				</section>
				<section class="payment">
					<img src="${pageContext.request.contextPath }/resources/img/payment_화살표.png" width="20">
					<span class="pay_info_detail">결제정보</span>
					<hr>
					<div>
						<span class="pay_info">결제번호</span>
						<span class="res_num2">${payment.pay_num }</span>
					</div>
					<div>
						<span class="pay_info">이 름</span>
						<span class="other_name">${member.user_name }</span>
					</div>
					<div>
						<span class="pay_info">결제일시</span>
						<span class="pay_date">${payment.pay_date }</span>
					</div>
					<div>
						<span class="pay_info">결제수단</span>
						<span class="pay_method">${payment.pay_method }</span>
					</div>
						<hr>
					<div>
						<span class="pay_info">할인전 금액</span>
						<span class="pay_money">${beforDiscountPrice }</span>
					</div>
					<div id="payPriceInfo">
						<span class="pay_info"> </span>
						<span class="detail_price">
							<div class="info_price">
								<span class="menu_name">예약금</span>
								<span class="count">${res_person }명</span>
								<span class="price">${res_table_price }원</span>
							</div>
							<c:choose>
								<c:when test="${payment.pay_po_price} == 0">
								
								</c:when>
								<c:otherwise>
<!-- 									<div class="info_price"> -->
<!-- 										<span class="menu_name">시저샐러드</span> -->
<!-- 										<span class="count">1개</span> -->
<!-- 										<span class="price">18,000원</span> -->
<!-- 									</div> -->
<!-- 									<div class="info_price"> -->
<!-- 										<span class="menu_name">뇨끼파스타</span> -->
<!-- 										<span class="count">1개</span> -->
<!-- 										<span class="price">24,000원</span> -->
<!-- 									</div> -->
<!-- 									<div class="info_price"> -->
<!-- 										<span class="menu_name">안심스테이크</span> -->
<!-- 										<span class="count">1개</span> -->
<!-- 										<span class="price">55,000원</span> -->
<!-- 									</div> -->
									<c:forEach var="po" items="${preOrder }">
										<div class="info_price">
											<span class="menu_name">${po.menu_name}</span>
											<span class="count">
												<span>${po.pre_num}</span>
												개
											</span>
											<span class="price">
												<span>${po.eachMenuTotalPrice}</span>
												 원
											</span>
										</div>
								 	</c:forEach>
								</c:otherwise>
							</c:choose>
							
						</span>
					</div>
					<div id="payPointInfo">
						<span class="pay_info">사용 포인트</span>
						<span class="pay_point">${discountPoint}원</span>
					</div>
					<div id="pointsEarned">
						<span class="pay_info_point">적립 포인트</span>
						<span class="pay_point_earn">${earnedPoint}원</span>
					</div>
					<div>
						<span class="pay_info">총 결제금액</span>
						<span class="total_money">${totalPayment }원</span>
					</div>
				</section>
				<button type="submit" class="checked" onclick="location.href='/'">확인</button>
			</form>
		</div>
	</div>
</body>
</html>