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
			<div class="check_payment">
				<section class="reservation">
					<div class="res_num">
						<span class="res_info_detail">
							<img src="${pageContext.request.contextPath }/resources/img/payment_화살표.png" width="20">
							<span>예약정보</span>
						</span>
						<span class="res_num1">${map.res.res_num}</span>
					</div>
					<hr>
					<div>
						<div class="reservation_div">
							<span class="res_info">업체명</span>
							<span class="res_address">
								<span class="res_name">${map.com.com_name}</span>&nbsp;
								${map.com.com_address}
							</span>
						</div>
						
						<div class="reservation_div">
							<span class="res_info">예약 날짜</span>
							<span class="res_date">${map.res.res_date}</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">시간</span>
							<span class="res_date">${map.res.res_time }</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">방문자 이름</span>
							<span class="other_name">${map.res.res_name}</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">휴대폰 번호</span>
							<span class="other_phone">${map.res.res_phone }</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">인원수</span>
							<span class="res_per">${map.res.res_person }명</span>
						</div>
						<div class="reservation_div">
							<span class="res_info">고객요청사항</span>
							<span class="request">${map.res.res_request }</span>
						</div>
					</div>
				</section>
				<section class="payment">
					<img src="${pageContext.request.contextPath }/resources/img/payment_화살표.png" width="20">
					<span class="pay_info_detail">결제정보</span>
					<hr>
					<div>
						<span class="pay_info">결제번호</span>
						<span class="res_num2">${map.payment.pay_num }</span>
					</div>
					<div>
						<span class="pay_info">이 름</span>
						<span class="other_name">${map.member.user_name }</span>
					</div>
					<div>
						<span class="pay_info">결제일시</span>
						<span class="pay_date">${map.paymentInfo.paymentDate}</span>
					</div>
					<div>
						<span class="pay_info">결제수단</span>
						<span class="pay_method">${map.paymentInfo.payMethod }</span>
					</div>
						<hr>
					<div>
						<span class="pay_info">할인전 금액</span>
						<span class="pay_money">${map.paymentInfo.totalPrice } 원</span>
					</div>
					<div id="payPriceInfo">
						<span class="pay_info"> </span>
						<span class="detail_price">
							<div class="info_price">
								<span class="menu_name">예약금</span>
								<span class="count">${map.res.res_person } 명</span>
								<span class="price">${map.paymentInfo.res_table_price } 원</span>
							</div>
							<!-- 선주문결제금 -->
							<c:choose>
								<c:when test="${map.paymentInfo.menuTotalPrice eq '0'}">
									<!-- 선주문없을 떄도 확인해보기 널스트링인지 0인지 -->
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
									<c:forEach var="preOrder" items="${map.poi }">
										<div class="info_price">
											<span class="menu_name">${preOrder.menu_name}</span>
											<span class="count">
												${preOrder.pre_num}	개
											</span>
											<span class="price">
												${preOrder.eachMenuTotalPrice} 원
											</span>
										</div>
								 	</c:forEach>
								</c:otherwise>
							</c:choose>
							
						</span>
					</div>
					<div id="payPointInfo">
						<span class="pay_info">사용 포인트</span>
						<span class="pay_point">${map.dPoint} 원</span>
					</div>
					<div id="pointsEarned">
						<span class="pay_info_point">적립 포인트</span>
						<span class="pay_point_earn">${map.ePoint} 원</span>
					</div>
					<div>
						<span class="pay_info">총 결제금액</span>
						<span class="total_money">${map.ftp} 원</span>
					</div>
				</section>
				<button type="button" class="checked" onclick="location.href='../'">확인</button>
			</div>
		</div>
	</div>
</body>
</html>