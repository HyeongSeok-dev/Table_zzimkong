<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 글로벌 css --%>
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<%-- 팝업창 js --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ceo_detail.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
						<select id="storeList">
							<option value="">상호명</option>
							<option value="칸다소바">칸다소바</option>
							<option value="아오모리">아오모리</option>
						</select>
					</span>	
				</div>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>예약자</h3></span>	
				</div>
				<table border="1">
					<tr>
						<th>예약번호</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>예약정보</th>
						<th>취소여부</th>
					</tr>
					<tr>
						<td>f1e9fvl</td>
						<td>12월 25일</td>
						<td>17시</td>
						<td>
						<button type="button" value="예약 상세 정보" onclick="newInfo()">예약 상세정보</button>
						</td>
						<td></td>
					</tr>
				</table>
			</div>
			
			<div class="text_inner">
				<div class="header">
					<span><h3>오늘의 예약 현황</h3></span>
					<span>
						<button type="button" value="상세정보" class="popup" onclick="newDetails()">상세정보</button>
					</span>
				</div>
				<table border="1">
					<tr>
						<th>오늘의 예약 수</th>
						<th>오늘의 예약방문자 수</th>
						<th>오늘의 예약취소 수</th>
					</tr>
					<tr>
						<td>8건</td>
						<td>22명</td>
						<td>1건</td>
					</tr>
				</table>
			</div>
			
			<div class="text_inner">
				<div class="header">
				<sapn><h3>월간 예약 현황</h3></sapn>
				</div>
				<table border="1">
					<tr>
						<th>월간 예약 수</th>
						<th>월간 예약방문자 수</th>
						<th>월간 예약취소 수</th>
					</tr>
					<tr>
						<td>194건</td>
						<td>582명</td>
						<td>13건</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
	</footer>
	<%-- <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer> --%>
</body>
</html>