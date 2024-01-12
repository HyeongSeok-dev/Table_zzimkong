<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<%--탑css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_top.css" rel="stylesheet">
<%-- 팝업창 js --%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ceo_detail.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../inc/ceo_top.jsp"/>
	</header>
	<input type="hidden" name="com_id" value="${res.com_id}" />
	
	<section class="ceo_sec">
		<div class="text">
			<div class="text_inner">
				<div class="header_div01">
					<span><h1>모든 예약 보기</h1></span>
				</div>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>예약정보</h3></span>	
				</div>
				<table border="1">
					<tr>
						<th>예약번호</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>예약정보</th>
						<th>예약상태</th>	
					</tr>
					<c:forEach var="resAll" items="${map.reservations}">
						<tr>
							<td>${resAll.res_num}</td>
							<td>${resAll.res_date}</td>
							<td>${resAll.res_time}</td>
							<td>
								<button type="button" value="상세정보" class="popup" onclick="newDetail(${resAll.res_idx})">상세정보</button>
							</td>
							<td>
								<c:choose>
									<c:when test="${resAll.res_status == 1}">
										예약완료
									</c:when>
									<c:when test="${resAll.res_status == 2}">
										예약취소
									</c:when>
									<c:when test="${resAll.res_status == 3}">
										방문완료
									</c:when>
									<c:otherwise>
										미방문
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
	</footer>
</body>
</html>