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
		
<!-- 		<form action="/zzimkong/admin/user/info/pro" method="POST"> -->
		<input type="hidden" name="user_idx" value="${member.user_idx}">
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
							<td colspan="2">일반회원</td>
						</c:when>
						<c:when test="${member.user_category eq 2}">
							<td colspan="2">업주회원</td>
						</c:when>
						<c:when test="${member.user_category eq 3}">
							<td colspan="2" style="color:blue;">관리자</td>
						</c:when>
						<c:otherwise>
							<td colspan="2" style="color:red;">알수없음</td>
						</c:otherwise>
					</c:choose>
				</tr>
<!-- 				<tr> -->
<!-- 					<th rowspan="2">대표자명</th> -->
<%-- 					<td colspan="2" rowspan="2"><input type="text" value="${member.com_ceo}" disabled></td> --%>
<!-- 					<th>사업자등록번호</th> -->
<%-- 					<c:set var="num" value="${company.com_num}"/> --%>
<%-- 					<td colspan="2">${fn:substring(num, 0, 3)}-${fn:substring(num, 3, 5)}-${fn:substring(num, 5, 10)}</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>전화번호</th> -->
<%-- 					<td colspan="2">${company.com_tel}</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>주소</th> -->
<!-- 	<!-- 				<td colspan="5"><input type="text" maxlength="5" size="50" value="(68902) 부산광역시 해운대구 센텀3로 20 (우동, 센텀호텔316,317호)" disabled></td> -->
<%-- 					나중에 우편번호 넣기 --%>
<%-- 					<td colspan="5"><input type="text" maxlength="5" size="50" value="${company.com_address}" disabled></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>영업시간</th> -->
<%-- 					<td colspan="2"><input type="text" value="${company.com_open_time} ~ ${company.com_close_time}" disabled></td> --%>
<!-- 					<th>업체상태</th> -->
<!-- 					<td colspan="2"> -->
<!-- 						<select id="company_state" name="com_status" onchange="company_shut_down()"> -->
<%-- 							<option value="1" <c:if test="${company.com_status eq 1}">selected</c:if>>정상</option> --%>
<%-- 							<option value="3" <c:if test="${company.com_status eq 3}">selected</c:if>>영업중지</option> --%>
<%-- 							<option value="4"  <c:if test="${company.com_status eq 4}">selected</c:if> disabled>폐점</option> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr>	 -->
<!-- 				<tr> -->
<!-- 					<th>건당 최대인원</th> -->
<%-- 					<td colspan="2"><input type="text" value="${company.com_max_people}명" disabled></td> --%>
<!-- 					<th>광고등급</th> -->
<!-- 					<td colspan="2"> -->
<!-- 						<select name="com_ad_grade"> -->
<%-- 							<option value="0" <c:if test="${company.com_ad_grade eq 0}">selected</c:if>>0단계</option> --%>
<%-- 							<option value="1" <c:if test="${company.com_ad_grade eq 1}">selected</c:if>>1단계</option> --%>
<%-- 							<option value="2" <c:if test="${company.com_ad_grade eq 2}">selected</c:if>>2단계</option> --%>
<%-- 							<option value="3" <c:if test="${company.com_ad_grade eq 3}">selected</c:if>>3단계</option> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>위생등급</th> -->
<%-- 					<td colspan="2"><input type="text" value="${company.com_hyg_rank} (<fmt:formatDate value="${company.com_hyg_start_date}" pattern="yy/MM/dd HH:mm"/>)" disabled></td> --%>
<!-- 					<th>등록일자</th> -->
<%-- 					<td colspan="2"><fmt:formatDate value="${company.com_reg_date}" pattern="yyyy-MM-dd HH:mm"/></td> --%>
<!-- 				</tr> -->
			</table>
			<br>
<!-- 			<button type="submit" class="button_olive">수정</button> -->
<!-- 			<button type="reset" class="button_grey2">초기화</button> -->
<!-- 		</form> -->
	</section>
</body>
</html>