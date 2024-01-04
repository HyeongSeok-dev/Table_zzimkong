<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h3>신고 관리</h3>
				
			<table border="1">
				<tr>
					<th>신고번호</th>
					<%-- 카테고리 필터 : 신고 구분 --%>
					<th>
						<select id="reportCategory">
						    <option value="report_all" selected>신고구분</option>
						    <option value="report_company">업체신고</option>
						    <option value="report_review">리뷰신고</option>
						</select>
					</th>
					<th>신고사유</th>
					<th>신고자</th>
					<%-- 카테고리 필터 : 처리 상태 --%>
					<th>
						<select id="reportStatusCategory">
						    <option value="report_status_all" selected>처리상태</option>
						    <option value="report_status_1">접수</option>
						    <option value="report_status_2">승인</option>
						    <option value="report_status_3">반려</option>
						</select>
					</th>
				</tr>
				<%-- 아래로 리뷰 신고 목록 출력 --%>
				<c:forEach var="report" items="#{reportList}">
					<tr onclick="report_declaration('${report.report_num}')" class="tr_hover">
						<td>${report.report_num}</td>
						<%-- 신고 구분 --%>
						<c:choose>
							<c:when test="${report.report_category eq 1}">
								<td class="report_item" data-category="report_company">업체신고</td>
							</c:when>
							<c:when test="${report.report_category eq 2}">
								<td class="report_item" data-category="report_review">리뷰신고</td>
							</c:when>
							<c:otherwise>
								<td class="report_item" data-category="report_unknown" style="color:red;">알수없음</td>
							</c:otherwise>
						</c:choose>
						<%-- 신고 사유 --%>
						<c:choose>
							<c:when test="${report.report_reason eq 1}">
								<td>청결하지 못함</td>
							</c:when>
							<c:when test="${report.report_reason eq 2}">
								<td>직원이 불친절함</td>
							</c:when>
							<c:when test="${report.report_reason eq 3}">
								<td>기타</td>
							</c:when>
							<c:when test="${report.report_reason eq 4}">
								<td>신뢰하기 어려운 홍보</td>
							</c:when>
							<c:when test="${report.report_reason eq 5}">
								<td>음란성, 부적절</td>
							</c:when>
							<c:when test="${report.report_reason eq 6}">
								<td>명예훼손 및 저작권 침해</td>
							</c:when>
							<c:otherwise>
								<td style="color:red;">알수없음</td>
							</c:otherwise>
						</c:choose>
						<td>${report.user_id}</td>
<!-- 						<td> -->
<%-- 							${report.user_id} --%>
<%-- 							<c:if test="${report.report_person eq 1}">(일반사용자)</c:if> --%>
<%-- 							<c:if test="${report.report_person eq 2}">(레스토랑 관계자)</c:if> --%>
<!-- 						</td> -->
						<%-- 신고 상태 --%>
						<c:choose>
							<c:when test="${report.report_status eq 1}">
								<td class="report_status_item" data-category="report_status_1">접수</td>
							</c:when>
							<c:when test="${report.report_status eq 2}">
								<td class="report_status_item" data-category="report_status_2">승인</td>
							</c:when>
							<c:when test="${report.report_status eq 3}">
								<td class="report_status_item" data-category="report_status_3">반려</td>
							</c:when>
							<c:otherwise>
								<td class="report_status_item" data-category="report_status_unknown" style="color:red;">알수없음</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	
	<%-- 페이지네이션 --%>
	<c:set var="pageNum" value="1"/>
	<c:if test="${not empty param.pageNum}">
		<c:set var="pageNum" value="${param.pageNum}"/>
	</c:if>
	
	<section id="pageList">
		<input type="button" value="이전" onclick="location.href='?pageNum=${pageNum - 1}'"<c:if test="${pageNum <= 1}">disabled</c:if>>	
	
		<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			<c:choose>
				<c:when test="${pageNum eq i}">
					<b>${i}</b>
				</c:when>
				<c:otherwise>
					<a href="?pageNum=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<input type="button" value="다음" onclick="location.href='?pageNum=${pageNum + 1}'" <c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>>	
	</section>
	
	<%-- 상단으로/bottom --%>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
		<jsp:include page="../inc/bottom_main.jsp"/>
	</footer>
</body>
</html>