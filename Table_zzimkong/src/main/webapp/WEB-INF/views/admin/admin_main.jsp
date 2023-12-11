<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/resources/css/admin_sidebar.css" rel="stylesheet"> --%>
</head>
<body>
	<%-- 사이드바 삽입 --%>
	<%-- <jsp:include page="/inc/admin_sidebar.jsp"/> --%>
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>
    
	<section class="article">
		<div class="text">
			<h3>오늘 할 일</h3>
			<table border="1">
				<tr>
					<th>문의 답변 대기</th>
					<th>입점 승인 대기</th>
					<th>리뷰 처리 대기</th>
				</tr>
				<tr>
					<td>22건</td>
					<td>24건</td>
					<td>50건</td>
				</tr>
			</table>
			
			<h3>사이트 현황</h3>
			<table border="1">
				<tr>
					<th>오늘 방문자 수</th>
					<th>오늘 가입자 수</th>
					<th>오늘 예약 수</th>
				</tr>
				<tr>
					<td>22명</td>
					<td>24명</td>
					<td>50건</td>
				</tr>
			</table>
			
			<br>
			
			<table border="1">
				<tr>
					<th>방문자 현황</th>
					<%-- 시간별 통계 (선 차트) --%>
					<th>가입자 현황</th>
					<%-- 일, 주, 월 별 통계 (막대 차트) --%>
				</tr>
				<tr>
					<td>시간별 현황 (선 차트)</td>
					<td>일, 주, 월 별 (막대 차트)</td>
				</tr>
				<tr>
					<th>예약 현황</th>
					<%-- 일, 주, 월 별 통계 (막대 차트) --%>
					<th>지역별 업체 현황</th>
					<%-- 일단 부산 지도 중심으로 (버블 차트) --%>
				</tr>
				<tr>
					<td>일, 주, 월 별 (막대 차트)</td>
					<td>일단 부산 지도 중심으로 (버블 차트)</td>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>