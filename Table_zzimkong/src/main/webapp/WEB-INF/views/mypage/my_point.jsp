<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/mypage2.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../inc/top2_search_bar.jsp"/>
	</header>
	<main>
		<jsp:include page="../inc/my_sidebar.jsp"  />
	<div class="wrapper">
		<div class ="title">
			<span class= "mypg">
				<h1>포인트 적립 및 사용내역</h1>
			</span>
			<span>
				<input type="date" id="date1">
				-
				<input type="date" id="date2">
				<button type="button" onclick="showDate()">조회</button>
				<p id="selectedDate"></p>
			</span>
			</div>
	<br>
		<table style="table-layout: fixed;">
<!-- 			<tr> -->
<!-- 				<th style="width: 100px;">발생일</th> -->
<!-- 				<th style="width: 50px;">구분</th> -->
<!-- 				<th style="width: 500px;">내역</th> -->
<!-- 				<th style="width: 80px;">적립포인트</th> -->
<!-- 				<th style="width: 80px;">사용포인트</th> -->
<!-- 				<th style="width: 80px;">잔여포인트</th> -->
<!-- 			</tr> -->
			<tr>
				<th style="width: 100px;">발생일</th>
				<th style="width: 50px;">구분</th>
				<th style="width: 80px;">사용포인트</th>
			</tr>
			<c:forEach var="point" items="${showPoint}">
				<tr>
					<td>${point.point_date}</td>
<%-- 					<td><fmt:formatDate value="${point.point_date}" pattern="yyyy-MM-dd HH:mm"/></td> --%>
					<td>${point.point_category}</td>
					<td>${point.point_value}</td>
				</tr>
			</c:forEach>
<!-- 			<tr> -->
<!-- 				<td>2023/05/17</td> -->
<!-- 				<td>적립</td> -->
<!-- 				<td>기장손칼국수 리뷰 포인트 적립</td> -->
<!-- 				<td>500p</td> -->
<!-- 				<td></td> -->
<!-- 				<td>5000p</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>2023/07/16</td> -->
<!-- 				<td>적립</td> -->
<!-- 				<td>화남정돼지국밥 리뷰 포인트 적립</td> -->
<!-- 				<td>500p</td> -->
<!-- 				<td></td> -->
<!-- 				<td>5500p</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>2023/10/22</td> -->
<!-- 				<td>사용</td> -->
<!-- 				<td>송원감자탕 예약 사용</td> -->
<!-- 				<td></td> -->
<!-- 				<td>2500p</td> -->
<!-- 				<td>3000p</td> -->
<!-- 			</tr> -->
		</table>
	</div>
	</main>
	

</body>
</html>