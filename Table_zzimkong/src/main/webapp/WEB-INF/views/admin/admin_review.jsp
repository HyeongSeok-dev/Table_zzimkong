 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>
	
	<section class="article">
        <div class="text">
			<h3>리뷰 관리</h3>
				
			<table border="1">
				<tr>
					<th>신고번호</th>
					<th>
						<select id="review_category">
						    <option value="report_all">모든 카테고리</option>
						    <option value="report_review">리뷰신고</option>
						    <option value="report_company">업체신고</option>
						</select>
					</th>
					<th>신고사유</th>
					<th>신고자</th>
					<th>처리상태</th>
				</tr>
				
				<tr>
					<td onclick="review_declaration()">1</td>
					<td class="report_review">리뷰신고</td>
					<td>신뢰하기 어려운 홍보</td>
					<td>user1</td>
					<td>접수</td>
				</tr>
				<tr>
					<td onclick="review_declaration()">2</td>
					<td class="report_company">업체신고</td>
					<td>청결하지 못함</td>
					<td>user2</td>
					<td>접수</td>
				</tr>
				<tr>
					<td onclick="review_declaration()">3</td>
					<td class="report_review">리뷰신고</td>
					<td>음란성,부적절</td>
					<td>user3</td>
					<td>반려</td>
				</tr>
				<tr>
					<td onclick="review_declaration()">4</td>
					<td class="report_review">리뷰신고</td>
					<td>명예훼손 및 저작권침해</td>
					<td>user4</td>
					<td>승인</td>
				</tr>
				<tr>
					<td onclick="review_declaration()">5</td>
					<td class="report_company">업체신고</td>
					<td>직원이 불친절함</td>
					<td>user5</td>
					<td>승인</td>
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