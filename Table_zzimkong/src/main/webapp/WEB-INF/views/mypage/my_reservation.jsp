<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<!-- jQuery, javascript -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage2.js"></script>
<script type="text/javascript">
	function writeReview(com_id) {
		location.href = "${pageContext.request.contextPath}/review/write?com_id=" + com_id;
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/top2.jsp"/>
	</header>
	<main>
	<jsp:include page="../inc/my_sidebar.jsp" />
	<div class="wrapper">
		<div>
			<div class ="title">
			<span class= "mypg">
				<h1>나의 예약 내역</h1>
			</span>
			<span>
				<button type="button">6개월</button>
				<button type="button">3개월</button>
				<button type="button">1개월</button>
				<input type="date" id="date1">
				-
				<input type="date" id="date2">
				<button type="button" onclick="showDate()">조회</button>
				<p id="selectedDate"></p>
			</span>
			</div>
			<br>
			<table style="width: 1000px; height: 100px; table-layout: fixed;">
				<tr class ="subject">
					<th>가게명</th>
					<th style="width: 50px">방문자명</th>					
					<th style="width: 25px">인원</th>
					<th>선주문메뉴</th>
					<th>방문예정일</th>
					<th style="width: 50px">예약상태</th>
					<th style="width: 50px">결제상태</th>
					<th style="width: 100px"></th>
				</tr>
				<%-- 예약 목록 출력 --%>
				<c:forEach var="res2" items="${resList2}">
				  <tr>
						<td style="height: 45px;"><b><a href="${pageContext.request.contextPath}/product/detail?com_id=${res2.com_id}">${res2.com_name }</a></b></td>
						<td>${res2.res_name }</td>
						<td>${res2.res_person }</td>
						<td>${res2.ordered_menus }</td>
						<td>${res2.res_date } ${res2.res_time}</td>
					<c:choose>
						<c:when test="${res2.res_status eq 1}">
							<td style="color: #3FAFFC;">예약완료</td>
						</c:when>
						<c:when test="${res2.res_status eq 2}">
							<td style="color: red;">예약취소</td>
						</c:when>
						<c:when test="${res2.res_status eq 3}">
							<td>방문완료</td>
						</c:when>
						<c:otherwise>
							<td>알수없음</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${res2.res_pay_status eq 1}">
							<td>결제</td>
						</c:when>
						<c:when test="${res2.res_pay_status eq 2}">
							<td>미결제</td>
						</c:when>
						<c:otherwise>
							<td>알수없음</td>
						</c:otherwise>
					</c:choose>
	                <td>
					<c:choose>
					    <c:when test="${res2.res_status eq 1}">
					        <button type="submit" id="my_delete" onclick="cancelReservation(${res2.res_idx})">예약취소</button>
					    </c:when>
					    <c:when test="${res2.res_status eq 3}">
					        <button type="submit" id="write_review" onclick="writeReview(${res2.com_id})">리뷰쓰기</button>
					    </c:when>
					    <c:otherwise>
					        -
					    </c:otherwise>
					</c:choose>
	                 </td>
				  </tr>
				</c:forEach>
			</table>
		</div>
	</div>
	</main>
			

</body>
</html>