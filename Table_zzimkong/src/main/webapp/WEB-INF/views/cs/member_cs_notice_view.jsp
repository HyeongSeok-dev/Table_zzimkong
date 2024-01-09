<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h3>공지사항</h3>
		<br><br>
			<table>
				<tr>
					<th>번호</th>
					<td>${board.cs_board_num}</td>
				</tr>
				<tr>
					<th colspan="1">제목</th>
					<td colspan="3">
						${board.cs_board_subject}
					</td>
				</tr>
				<tr>
					<th colspan="1">공지내용</th>
					<td colspan="3">
						${board.cs_board_content}
					</td>
				</tr>
				<tr>
					<th colspan="1">사진</th>
					<td colspan="3" class="td_file">
						<div><c:if test="${not empty board.cs_board_img_1}"><img src="${pageContext.request.contextPath }/resources/upload/${board.cs_board_img_1}"></c:if></div>
						<div><c:if test="${not empty board.cs_board_img_2}"><img src="${pageContext.request.contextPath }/resources/upload/${board.cs_board_img_2}"></c:if></div>
						<div><c:if test="${not empty board.cs_board_img_3}"><img src="${pageContext.request.contextPath }/resources/upload/${board.cs_board_img_3}"></c:if></div>
						<div><c:if test="${not empty board.cs_board_img_4}"><img src="${pageContext.request.contextPath }/resources/upload/${board.cs_board_img_4}"></c:if></div>
						<div><c:if test="${not empty board.cs_board_img_5}"><img src="${pageContext.request.contextPath }/resources/upload/${board.cs_board_img_5}"></c:if></div>
					</td>
				</tr>
			</table>
			<br><br>
			<button type="button" class="button_olive" onclick="javascript:window.close()">닫기</button>
			<c:if test="${sessionScope.sId eq 'admin'}">
				<button type="button" class="button_olive" onclick="location.href='${pageContext.request.contextPath }/admin/cs/notice/modify?cs_board_num='+ ${board.cs_board_num}">수정하기</button>
			</c:if>
	</section>
</body>
</html>