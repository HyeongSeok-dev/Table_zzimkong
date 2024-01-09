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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cs.js"></script>
<script type="text/javascript">
function qnaAnswerRegisterForm() {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open('${pageContext.request.contextPath }/admin/cs/qna/answer/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

$(document).ready(function() {
	$('#cs_button_delete').click(function() {
	    if (confirm("삭제하시겠습니까?")) {
	        location.href='${pageContext.request.contextPath }/admin/cs/delete?cs_board_num=${board.cs_board_num}';
	    }
	});
});
</script>
</head>
<body class="info_window">
	<section>
		<h3>1 : 1 문의사항</h3>
		<br><br>
		<form action="answer/register" method="post" name="memberQnaForm">
			<table>
				<tr>
					<th>번호</th>
					<td>${board.cs_board_num}</td>
					<th>아이디</th>
					<td>
						${board.user_id}
					</td>
				</tr>
				<tr>
					<th>유형</th>
					<td>
						<c:if test="${board.cs_board_category_user eq 1}">일반회원</c:if>
						<c:if test="${board.cs_board_category_user eq 2}">사업자회원</c:if>
					</td>
					<th>
						질문유형
					</th>
					<td>
						<c:choose>
							<c:when test="${board.cs_board_category_user eq 1}">
								<c:if test="${board.cs_board_category_sub eq 1}">예약</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 2}">주문/결제</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 3}">리뷰</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 4}">회원정보</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 5}">이용문의</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 6}">쿠폰/포인트</c:if>
							</c:when>
							<c:when test="${board.cs_board_category_user eq 2}">
								<c:if test="${board.cs_board_category_sub eq 1}">예약관리</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 2}">메뉴관리</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 3}">광고</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 4}">블랙회원관리</c:if>
			            		<c:if test="${board.cs_board_category_sub eq 5}">업체관리</c:if>
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
					<th colspan="2">파일첨부</th>
					<td colspan="4" class="td_file">
						<div><c:if test="${not empty board.cs_board_img_1}"><img src="/upload/${board.cs_board_img_1}"></c:if></div>
                           <div><c:if test="${not empty board.cs_board_img_2}"><img src="/upload/${board.cs_board_img_2}"></c:if></div>
                           <div><c:if test="${not empty board.cs_board_img_3}"><img src="/upload/${board.cs_board_img_3}"></c:if></div>
                           <div><c:if test="${not empty board.cs_board_img_4}"><img src="/upload/${board.cs_board_img_4}"></c:if></div>
                           <div><c:if test="${not empty board.cs_board_img_5}"><img src="/upload/${board.cs_board_img_5}"></c:if></div>
                     </td>
				</tr>
			</table>
			<br><br>
			<button type="submit" class="button_olive">답글</button>
			<button type="button" id="cs_button_delete">삭제</button>
			<input type="hidden" name="cs_board_num" value="${board.cs_board_num}">
		</form>
	</section>
</body>
</html>