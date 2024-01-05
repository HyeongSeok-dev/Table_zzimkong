<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#cs_button_delete').click(function() {
	        if (confirm("삭제하시겠습니까?")) {
	            location.href='${pageContext.request.contextPath }/member/cs/qna/delete?cs_board_num=${board.cs_board_num}';
	        }
	    });
	});
</script>
</head>
<body class="info_window">
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>1 :1 문의</h3></span>
			</div>
		</div>
		<div class="text_inner">
			<div class="text_inner_view">
				<table>
					<tr>
						<th width="80">회원정보</th>
						<td width="100">${member.user_name}</td>
						<th width="80">유형</th>
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
						<th colspan="1">제목</th>
						<td colspan="3">
						${board.cs_board_subject}
						</td>
					</tr>
					<tr>
						<th colspan="1">문의내용</th>
						<td colspan="3">
						${board.cs_board_content}
						</td>
					</tr>
					<tr>
						<th colspan="1">사진</th>
						<td colspan="3" class="td_file">
							<div><c:if test="${not empty board.cs_board_img_1}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_1}"></c:if></div>
							<div><c:if test="${not empty board.cs_board_img_2}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_2}"></c:if></div>
							<div><c:if test="${not empty board.cs_board_img_3}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_3}"></c:if></div>
							<div><c:if test="${not empty board.cs_board_img_4}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_4}"></c:if></div>
							<div><c:if test="${not empty board.cs_board_img_5}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_5}"></c:if></div>
						</td>
					</tr>
				</table>
				<br>
				<br><br>
				<button type="button" class="button_olive" onclick="location.href='${pageContext.request.contextPath }/member/cs/qna/modify'">수정하기</button>
				<button type="button" id="cs_button_delete">삭제</button>
			</div>
		</div>
	</section>
</body>
</html>