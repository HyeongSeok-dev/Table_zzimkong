<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet"> <%-- 공통 CSS --%>
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> <%-- 항상 최신 jQuery 라이브러리를 불러오는 소스 --%>
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script> <%-- 관리자 페이지의 모든 자바스크립트 --%>
<%-- <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script> Chart.js CDN --%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin_chart.js"></script> <%-- Chart.js 커스텀 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <%-- AJAX --%>
</head>
<body>
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
					<th>신고 처리 대기</th>
				</tr>
				<tr>
					<td>${adminMain.countUnAnswerInquiry}건</td>
					<td>${adminMain.countUnApproveCompany}건</td>
					<td>${adminMain.countUnHandleReport}건</td>
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
					<td>${adminMain.join_date_counts[1] + 500}명</td>
					<td>${adminMain.countDayNewMember}명</td>
					<td>${adminMain.countDayRes}건</td>
				</tr>
				
			</table>
			<br>
		

	
			<%-- Chart.js --%>
			<h3>방문&가입자 현황</h3>

			<button type="button" id="chart_time" onclick="myChart1()">시간별</button>
			<button type="button" id="chart_date" onclick="myChart2()">날짜별</button>

			<table class="chart_table">
				<tr>
					<th>
						<br>
						
 						<div id="content1" style="display: none;">
							<div style="width: 100%; height: auto; text-align: center">
								<canvas id="myChart1"></canvas>
							</div>
						</div>
						
 						<div id="content2" style="display: none;">
							<div style="width: 100%; height: auto; text-align: center">
								<canvas id="myChart2"></canvas>
							</div>
						</div>
					</th>
				</tr>
			</table>
			
			
			<h3>예약자 현황</h3>
			
			<button type="button" id="chart_time" onclick="myChart3()">시간별</button>
			<button type="button" id="chart_date" onclick="myChart4()">날짜별</button>
			
			<table class="chart_table">
				<tr>
					<th>
						<br>
						
 						<div id="content3" style="display: none;">
							<div style="width: 100%; height: auto; text-align: center">
								<canvas id="myChart3"></canvas>
							</div>
						</div>
						
 						<div id="content4" style="display: none;">
							<div style="width: 100%; height: auto; text-align: center">
								<canvas id="myChart4"></canvas>
							</div>
						</div>
					</th>
				</tr>
			</table>
		</div>
	</section>
		
	<%-- 상단으로/bottom --%>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
		<jsp:include page="../inc/bottom_main.jsp"/>
	</footer>
</body>
</html>