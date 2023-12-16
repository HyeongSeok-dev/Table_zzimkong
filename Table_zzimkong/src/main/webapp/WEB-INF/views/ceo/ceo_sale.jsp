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
<%-- 상단 이동 버튼 css --%>
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body id="body">
	<header>
		<jsp:include page="../inc/ceo_top.jsp"/>
	</header>
	
	<section class="ceo_sec">
		<div class="text">
			<div class="text_inner">
				<div class="header_div01">
					<span><h1>사업장별 판매관리</h1></span>
					<span class="header_span">
						<select id="storeList">
							<option value="">상호명</option>
							<option value="칸다소바">칸다소바</option>
							<option value="아오모리">아오모리</option>
						</select>
						<input type="date" id="date">
					</span>	
				</div>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>일별판매금액</h3></span>
					<span class="header_span">
					</span>	
				</div>
				
				<table border="1">
					<tr>
						<th>총 판매금액</th>
						<th>선주문판매금액</th>
						<th>런치 판매금액</th>
						<th>디너 판매금액</th>
					</tr>
					<tr>
						<td>1,735,000</td>
						<td>935,000</td>
						<td>735,000</td>
						<td>1,000,000</td>
					</tr>
				</table>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>일별 예약건수 & 예약 인원</h3></span>
				</div>
				<table border="1">
					<tr>
						<th>총 예약수</th>
						<th>런치 예약수</th>
						<th>디너 예약수</th>
					</tr>
					<tr>
						<td>19건</td>
						<td>6건</td>
						<td>13건</td>
					</tr>
				</table>
				<br>
				<table border="1">
					<tr>
						<th>총 예약인원</th>
						<th>런치 예약인원</th>
						<th>디너 예약인원</th>
					</tr>
					<tr>
						<td>67명</td>
						<td>25명</td>
						<td>42명</td>
					</tr>
				</table>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>메뉴별 판매현황</h3></span>
				</div>
				<table border="1">
					<tr>
						<th>메뉴 이름</th>
						<th>메뉴 가격</th>
						<th>판매량</th>
						<th>총 판매 금액</th>
					</tr>
					<tr>
						<td>메뉴1</td>
						<td>32,000원</td>
						<td>12</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴2</td>
						<td>36,000원</td>
						<td>5</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴3</td>
						<td>29,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴4</td>
						<td>17,000원</td>
						<td>10</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴5</td>
						<td>21,000원</td>
						<td>4</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴6</td>
						<td>19,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴7</td>
						<td>17,000원</td>
						<td>4</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴8</td>
						<td>19,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드1</td>
						<td>9,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드2</td>
						<td>7,000원</td>
						<td>3</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드3</td>
						<td>5,000원</td>
						<td>12</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드4</td>
						<td>6,000원</td>
						<td>3</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드5</td>
						<td>6,000원</td>
						<td>9</td>
						<td>가격*판매량</td>
					</tr>
				
				</table>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>메뉴별 판매현황</h3></span>
				</div>
				<table border="1">
					<tr>
						<th>메뉴 이름</th>
						<th>메뉴 가격</th>
						<th>판매량</th>
						<th>총 판매 금액</th>
					</tr>
					<tr>
						<td>메뉴1</td>
						<td>32,000원</td>
						<td>12</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴2</td>
						<td>36,000원</td>
						<td>5</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴3</td>
						<td>29,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴4</td>
						<td>17,000원</td>
						<td>10</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴5</td>
						<td>21,000원</td>
						<td>4</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴6</td>
						<td>19,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴7</td>
						<td>17,000원</td>
						<td>4</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴8</td>
						<td>19,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드1</td>
						<td>9,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드2</td>
						<td>7,000원</td>
						<td>3</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드3</td>
						<td>5,000원</td>
						<td>12</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드4</td>
						<td>6,000원</td>
						<td>3</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드5</td>
						<td>6,000원</td>
						<td>9</td>
						<td>가격*판매량</td>
					</tr>
				</table>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>메뉴별 판매현황</h3></span>
				</div>
				<table border="1">
					<tr>
						<th>메뉴 이름</th>
						<th>메뉴 가격</th>
						<th>판매량</th>
						<th>총 판매 금액</th>
					</tr>
					<tr>
						<td>메뉴1</td>
						<td>32,000원</td>
						<td>12</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴2</td>
						<td>36,000원</td>
						<td>5</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴3</td>
						<td>29,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴4</td>
						<td>17,000원</td>
						<td>10</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴5</td>
						<td>21,000원</td>
						<td>4</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴6</td>
						<td>19,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴7</td>
						<td>17,000원</td>
						<td>4</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>메뉴8</td>
						<td>19,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드1</td>
						<td>9,000원</td>
						<td>7</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드2</td>
						<td>7,000원</td>
						<td>3</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드3</td>
						<td>5,000원</td>
						<td>12</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드4</td>
						<td>6,000원</td>
						<td>3</td>
						<td>가격*판매량</td>
					</tr>
					<tr>
						<td>사이드5</td>
						<td>6,000원</td>
						<td>9</td>
						<td>가격*판매량</td>
					</tr>
				</table>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>매출 통계</h3></span>
				</div>
				<table border="1">
					<tr>
						<th>예약건수</th>
					</tr>
					<tr>
						<td>월별 예약 건수 현황 (선 차트)</td>
					</tr>
					<tr>
						<th>매출액</th>
					</tr>
					<tr>
						<td>월별 매출액 현황 (선 차트)</td>
					</tr>
				</table>
			</div>		
		</div>
	</section>
	
	<br><br><br>
	<footer>
		<%-- 상단으로 --%>
		<jsp:include page="../inc/admin_topup.jsp"/>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>