<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<h3>회원 상세 정보</h3>
		<br><br>
		
		<table>
			<tr>
				<th>회원번호</th>
				<td colspan="5">${member.user_idx}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="2"><input type="text" value="${member.user_name}" disabled></td>
				<th>회원구분</th>
				<%-- 회원 구분 --%>
				<c:choose>
					<c:when test="${member.user_category eq 1}">
						<td colspan="2">일반회원
					</c:when>
					<c:when test="${member.user_category eq 2}">
						<td colspan="2">업주회원
					</c:when>
					<c:when test="${member.user_category eq 3}">
						<td colspan="2" style="color:blue;">관리자
					</c:when>
					<c:otherwise>
						<td colspan="2" style="color:red;">알수없음
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${member.user_status eq 1}">
						(정상)
					</c:when>
					<c:when test="${member.user_status eq 2}">
						(휴면/정지)
					</c:when>
					<c:when test="${member.user_status eq 3}">
						(탈퇴)
					</c:when>
					<c:otherwise>
						(알수없음)
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td colspan="2"><input type="text" value="${member.user_id}" disabled></td>
				<th>닉네임</th>
				<td colspan="2"><input type="text" value="${member.user_nick}" disabled></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="2">
					<c:set var="phone" value="${member.user_phone}"/>
					<input type="text" value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, 11)}" disabled>
				</td>
				<th>이메일</th>
				<td colspan="2"><input type="text" value="${member.user_email}" disabled></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td colspan="2"><input type="text" value="${member.user_birth}" disabled></td>
				<th>회원레벨</th>
				<td colspan="2"><input type="text" value="${member.user_level}" disabled></td>
			</tr>	
			<tr>
				<th>포인트</th>
				<td colspan="2">
					<c:set var="formattedTotalPoint" value="${member.total_point}"/>
					<fmt:formatNumber var="formattedTotalPoint" value="${formattedTotalPoint}" groupingUsed="true"/>

				    <input type="text" value="${formattedTotalPoint}콩" disabled>
				</td>
				<th>
					<c:choose>
						<c:when test="${member.user_status eq 3}">
							탈퇴일자
						</c:when>
						<c:otherwise>
							가입일자
						</c:otherwise>
					</c:choose>
				</th>
				<td colspan="2">${member.user_reg_date}</td>
			</tr>
		</table>
	</section>
</body>
</html>