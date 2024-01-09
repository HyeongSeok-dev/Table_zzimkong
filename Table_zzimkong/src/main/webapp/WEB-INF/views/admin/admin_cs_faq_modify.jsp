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
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cs.js"></script>
<script type="text/javascript">
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
		<h3>자주묻는질문</h3>
		<br><br>
		<form action="modifyPro" method="post" name="csFaqModifyForm" enctype="multipart/form-data">
			<table>
				<tr>
					<th>번호</th>
					<td>${board.cs_board_num}</td>
					<th>유형</th>
					<td>
						<select class="user_select" name="cs_board_category_user">
							<option value="1" <c:if test="${board.cs_board_category_user eq 1}">selected</c:if>>일반회원</option>
		            		<option value="2" <c:if test="${board.cs_board_category_user eq 2}">selected</c:if>>사업자회원</option>
		            	</select>
					</td>
					<th>
						질문유형
					</th>
					<td>
					<select class="member_category_select" name="cs_board_category_sub">
	            	<option value="" >유형선택</option>
	            		<option value="1" <c:if test="${board.cs_board_category_sub eq 1}">selected</c:if>>예약</option>
	            		<option value="2" <c:if test="${board.cs_board_category_sub eq 2}">selected</c:if>>주문/결제</option>
	            		<option value="3" <c:if test="${board.cs_board_category_sub eq 3}">selected</c:if>>리뷰</option>
	            		<option value="4" <c:if test="${board.cs_board_category_sub eq 4}">selected</c:if>>회원정보</option>
	            		<option value="5" <c:if test="${board.cs_board_category_sub eq 5}">selected</c:if>>이용문의</option>
	            		<option value="6" <c:if test="${board.cs_board_category_sub eq 6}">selected</c:if>>쿠폰/포인트</option>
	            	</select>
	            	<select class="ceo_category_select" name="cs_board_category_sub">
	            		<option value="" >유형선택</option>
	            		<option value="1" <c:if test="${board.cs_board_category_sub eq 1}">selected</c:if>>예약관리</option>
	            		<option value="2" <c:if test="${board.cs_board_category_sub eq 2}">selected</c:if>>메뉴관리</option>
	            		<option value="3" <c:if test="${board.cs_board_category_sub eq 3}">selected</c:if>>광고</option>
	            		<option value="4" <c:if test="${board.cs_board_category_sub eq 4}">selected</c:if>>블랙회원관리</option>
	            		<option value="5" <c:if test="${board.cs_board_category_sub eq 5}">selected</c:if>>업체관리</option>
	            	</select>
					</td>
				</tr>
				<tr>
					<th colspan="2">제목</th>
					<td colspan="4">
						<input type="text" placeholder="제목" name="cs_board_subject" value="${board.cs_board_subject}">
					</td>
				</tr>
				<tr>
					<th colspan="2">문의내용</th>
					<td colspan="4">
						<textarea rows="20" cols="80" name="cs_board_content" >${board.cs_board_content}</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">파일첨부</th>
					<td colspan="3" class="td_file">
						<div><c:if test="${not empty board.cs_board_img_1}"><img src="/upload${board.cs_board_img_1}"></c:if></div>
                           <input type="file" name="mFile1" class="file" accept="image/*">
                           <div><c:if test="${not empty board.cs_board_img_2}"><img src="/upload${board.cs_board_img_2}"></c:if></div>
                           <input type="file" name="mFile2" class="file" accept="image/*">
                           <div><c:if test="${not empty board.cs_board_img_3}"><img src="/upload${board.cs_board_img_3}"></c:if></div>
                           <input type="file" name="mFile3" class="file" accept="image/*">
                           <div><c:if test="${not empty board.cs_board_img_4}"><img src="/upload${board.cs_board_img_4}"></c:if></div>
                           <input type="file" name="mFile4" class="file" accept="image/*">
                           <div><c:if test="${not empty board.cs_board_img_5}"><img src="/upload${board.cs_board_img_5}"></c:if></div>
                           <input type="file" name="mFile5" class="file" accept="image/*">
                       </td>
				</tr>
			</table>
			<br><br>
			<button type="submit" class="button_olive">수정</button>
			<button type="button" id="cs_button_delete">삭제</button>
			<input type="hidden" name="cs_board_num" value="${board.cs_board_num}">
		</form>
	</section>
</body>
</html>