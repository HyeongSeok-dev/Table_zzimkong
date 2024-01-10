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
		<jsp:include page="../inc/top2.jsp"/>
	</header>
	<main>
		<jsp:include page="../inc/my_sidebar.jsp"  />
	<div class="wrapper">
		<div class ="title">
			<span class= "mypg">
				<h1>포인트 적립 및 사용내역</h1>
			</span>
			</div>
	<br>
		<table style="table-layout: fixed;">
			<tr>
				<th style="width: 100px;">발생일</th>
				<th style="width: 50px;">구분</th>
				<th style="width: 80px;">적립 포인트</th>
				<th style="width: 80px;">사용 포인트</th>
			</tr>
			<c:forEach var="point" items="${showPoint}">
				<tr>
					<td>${point.point_date}</td>
<%-- 					<td><fmt:formatDate value="${point.point_date}" pattern="yyyy-MM-dd HH:mm"/></td> --%>
				<c:choose>
					<c:when test="${point.point_category eq 1}">
					<td>결제 적립</td>
					</c:when>
					<c:when test="${point.point_category eq 2}">
					<td>리뷰 적립</td>
					</c:when>
					<c:when test="${point.point_category eq 3}">
					<td>이벤트 적립</td>
					</c:when>
					<c:when test="${point.point_category eq 4}">
					<td>포인트 사용</td>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${point.point_value gt 0}">
						<td>${point.point_value}</td>
						<td></td>
						
					</c:when>
					<c:otherwise>
						<td></td>
						<td>${point.point_value}</td>
					</c:otherwise>
				</c:choose>
				</tr>
			</c:forEach>
				<td colspan="4" style="height: 10%; text-align: right;">
				    <span style="font-size:20px; padding-right:30px;">
				        <b>잔여 포인트 : ${totalPoint}<span class="small-text"> 콩</span></b>
				    </span>
				</td>

		</table>
						

		
	</div>
	</main>
	

</body>
</html>