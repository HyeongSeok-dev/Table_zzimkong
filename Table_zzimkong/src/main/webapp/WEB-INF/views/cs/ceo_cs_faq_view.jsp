<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/admin_popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/cs_register.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body class="info_window">
	<section>
		<h3>자주묻는질문</h3>
		<br><br>
			<table>
				<tr>
					<th>번호</th>
					<td>${board.cs_board_num}</td>
					<th>
						질문유형
					</th>
					<td>
						<c:choose>
							<c:when test="${board.cs_board_category_sub eq 1}">
								예약관리
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 2}">
								메뉴관리
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 3}">
								광고
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 4}">
								블랙회원관리
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 5}">
								업체관리
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th colspan="2">제목</th>
					<td colspan="4">
					${board.cs_board_subject}
					</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
					<td colspan="4">
						${board.cs_board_content}
					</td>
				</tr>
				<tr>
					<th colspan="1">사진</th>
					<td colspan="3" class="td_file">
						<div><c:if test="${not empty board.cs_board_img_1}"><img src="/upload/${board.cs_board_img_1}"></c:if></div>
						<div><c:if test="${not empty board.cs_board_img_2}"><img src="/upload/${board.cs_board_img_2}"></c:if></div>
						<div><c:if test="${not empty board.cs_board_img_3}"><img src="/upload/${board.cs_board_img_3}"></c:if></div>
						<div><c:if test="${not empty board.cs_board_img_4}"><img src="/upload/${board.cs_board_img_4}"></c:if></div>
						<div><c:if test="${not empty board.cs_board_img_5}"><img src="/upload/${board.cs_board_img_5}"></c:if></div>
					</td>
				</tr>
			</table>
			<br><br>
			<button type="button" class="button_olive" onclick="javascript:window.close()">닫기</button>
			<c:if test="${sessionScope.sId eq 'admin'}">
				<button type="button" class="button_olive" onclick="location.href='${pageContext.request.contextPath }/admin/cs/faq/modify?cs_board_num='+ ${board.cs_board_num}">수정하기</button>
			</c:if>
	</section>
</body>
</html>