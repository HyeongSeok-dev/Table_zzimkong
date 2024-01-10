<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body class="info_window">
	<section>
		<h3>신고 상세 정보</h3>
		<br><br>
		
		<form action="/zzimkong/admin/report/detail/register/pro" method="POST" class="reportRegister" id="reportRegister">
			<table border="1">
				<tr>
					<th>신고번호</th>
					<td>${report.report_num}</td>
					<th>카테고리</th>
					<%-- 신고 구분 --%>
					<c:choose>
						<c:when test="${report.report_category eq 1}">
							<td><b>업체신고</b></td>
						</c:when>
						<c:when test="${report.report_category eq 0}">
							<td><b>리뷰신고</b></td>
						</c:when>
						<c:otherwise>
							<td style="color:red;">알수없음</td>
						</c:otherwise>
					</c:choose>
					
				</tr>
				<tr>
					<th>신고자</th>
					<td>
						${report.user_id}
						<c:if test="${report.report_person eq 1}">(일반사용자)</c:if>
						<c:if test="${report.report_person eq 2}">(레스토랑 관계자)</c:if>
					</td>
					<th>신고대상</th>
					<%-- 신고대상에 따른 데이터 출력 구분 --%>
					<c:choose>
						<c:when test="${report.report_category eq 1}"> <%-- 업체신고일 경우 --%>
							<td>${report.com_id}</td>
						</c:when>
						<c:when test="${report.report_category eq 0}"> <%-- 리뷰신고일 경우 --%>
							<td>${report.reported_userId}</td>
						</c:when>
					</c:choose>
				</tr>
				<tr>
					<th>해당 리뷰 내용</th>
					<td colspan="3">
						${report.reported_reviewContent}
					</td>
				</tr>
				<tr>
					<th>신고내용</th>
					<td colspan="4">${report.report_content}</td>
				</tr>
				<tr>
					<th rowspan="2">답변 받을 경로</th>
						<td><b>메일주소 : </b>${report.user_email}<c:if test="${report.user_email eq null}">없음</c:if></td>
					<th rowspan="2">처리상태</th>
					<%-- 처리 상태 --%>
					<c:choose>
						<c:when test="${report.report_status eq 1}">
							<td rowspan="2">접수</td>
						</c:when>
						<c:when test="${report.report_status eq 2}">
							<td rowspan="2">승인</td>
						</c:when>
						<c:when test="${report.report_status eq 3}">
							<td rowspan="2">반려</td>
						</c:when>
						<c:otherwise>
							<td rowspan="2" style="color:red;">알수없음</td>						
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>
						<b>전화번호 : </b>
						<c:set var="phone" value="${report.user_phone}"/>
						${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, 11)}
						<c:if test="${report.user_phone eq null}">없음</c:if>
					</td>
				</tr>
			</table>
			<br>
			
			<input type="hidden" id="report_num" name="report_num">
			<input type="hidden" id="report_approve_register" name="report_approve_register">
			
			<c:choose>
				<c:when test="${report.report_status eq 2}">
					<button type="button" class="button_grey2">승인</button>
				</c:when>
				<c:otherwise>
					<button type="submit" class="button_olive" name="report_approve_ok"
						onclick="report_approve('${report.report_num}', this.name)">승인</button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${report.report_status eq 3}">
					<button type="button" class="button_grey2">반려</button>
				</c:when>
				<c:otherwise>
					<button type="submit" class="button_cancel" name="report_approve_no"
						onclick="report_disapprove('${report.report_num}', this.name)">반려</button>
				</c:otherwise>
			</c:choose>
							
		</form>
	</section>
</body>
</html>