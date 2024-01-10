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
	
	<section class="ceo_sec">
		<div class="text">
			<div class="text_inner">
				<div class="header_div01">
					<span><h1>사업장별 예약관리</h1></span>
					<span class="header_span">
<!-- 						<select id="storeList" onchange="showResInfo(this.value)"> -->
						<select id="storeList">
							<c:if test="${not empty storeList}">
								<c:forEach var="company" items="${storeList}">
									<!--선택된 com_id가 파라미터로 넘어온 com_id가 비어있지 않고 파라미터로 넘어온 com_id가 선택된 com_id가 같을때 선택유지  -->
<%-- 									<option value="${company.com_id}" <c:if test="${not empty param.com_id and param.com_id eq company.com_id}">selected</c:if>>${company.com_name}</option> --%>
									<option value="${company.com_id}">${company.com_name}</option>
								</c:forEach>
							</c:if>
						</select>
						<input type="hidden" name="com_id" value="${company.com_id}" />
					</span>	
				</div>
			</div>
			<div class="text_inner">
				<span>
					<button type= "button" onclick="location.href='reservation/all'">더보기</button>
				</span>
				<div class="header">
					<span><h3>예약정보</h3></span>	
				</div>
				<table id="reservationTable" border="1">
					<tr>
						<th>예약번호</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>예약정보</th>
						<th>예약상태</th>	
						<th>결제여부</th>	
						<th>방문확인</th>	
					</tr>
				</table>
			</div>
			
			<div class="text_inner">
				<div class="header">
					<span><h3>오늘의 예약 현황</h3></span>
				</div>
				<table id="reservationStatus" border="1">
					<tr>
						<th>오늘의 예약 수</th>
						<th>오늘의 예약방문자 수</th>
						<th>오늘의 예약취소 수</th>
						<th>오늘의 인원상세</th>
					</tr>
				</table>
			</div>
			
<!-- 			<div class="text_inner"> -->
<!-- 				<div class="header"> -->
<!-- 				<sapn><h3>월간 예약 현황</h3></sapn> -->
<!-- 				</div> -->
<!-- 				<table border="1"> -->
<!-- 					<tr> -->
<!-- 						<th>월간 예약 수</th> -->
<!-- 						<th>월간 예약방문자 수</th> -->
<!-- 						<th>월간 예약취소 수</th> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td>194건</td> -->
<!-- 						<td>582명</td> -->
<!-- 						<td>13건</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</div> -->
		</div>
	</section>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
	</footer>
</body>
</html>