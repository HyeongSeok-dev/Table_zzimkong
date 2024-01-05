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
								예약
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 2}">
								주문/결제
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 3}">
								리뷰
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 4}">
								회원정보
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 5}">
								이용문의
							</c:when>
							<c:when test="${board.cs_board_category_sub eq 6}">
								쿠폰/포인트
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
			</table>
			<br><br>
			<button type="button" class="button_olive" onclick="javascript:window.close()">닫기</button>
			<%--자주묻는 질문의 수정과 삭제 권한은 오직 관리자에게만 있음 수정과 삭제는 관리자 페이지에서 진행!! --%>
	</section>
</body>
</html>