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
	
</script>
</head>
<body class="info_window">
	<section>
		<h3>1 : 1 답글</h3>
		<br><br>
		<form action="registerPro" method="post" name="memberQnaForm" enctype="multipart/form-data">
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
					<th colspan="2">문의제목</th>
					<td colspan="4">
						${board.cs_board_subject}
					</td>
				</tr>
				<tr>
					<th colspan="2">문의내용</th>
					<td colspan="4">
						${board.cs_board_content}
					</td>
				</tr>
				<tr>
					<th colspan="2">파일</th>
					<td colspan="4" class="td_file">
						<div><c:if test="${not empty board.cs_board_img_1}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_1}"></c:if></div>
                           <div><c:if test="${not empty board.cs_board_img_2}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_2}"></c:if></div>
                           <div><c:if test="${not empty board.cs_board_img_3}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_3}"></c:if></div>
                           <div><c:if test="${not empty board.cs_board_img_4}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_4}"></c:if></div>
                           <div><c:if test="${not empty board.cs_board_img_5}"><img src="${pageContext.request.contextPath}/resources/upload/${board.cs_board_img_5}"></c:if></div>
                     </td>
				</tr>
				<tr>
					<th colspan="2">답변제목</th>
					<td colspan="4">
						<input type="text" placeholder="제목"  name="cs_board_subject" value="${board.cs_board_subject}에 대한 답변입니다.">
					</td>
				</tr>
				<tr>
					<th colspan="2">답변내용</th>
					<td colspan="4">
						<textarea rows="20" cols="80" name="cs_board_content" ></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="1">파일첨부</th>
					<td colspan="3" class="td_file">
                           <input type="file" name="mFile1" class="file" accept="image/*">
                           <input type="file" name="mFile2" class="file" accept="image/*">
                           <input type="file" name="mFile3" class="file" accept="image/*">
                           <input type="file" name="mFile4" class="file" accept="image/*">
                           <input type="file" name="mFile5" class="file" accept="image/*">
                       </td>
				</tr>
			</table>
			<br><br>
			<button type="button" class="button_olive" onclick="location.href='javascript:history.back()'">뒤로가기</button>
			<button type="submit" class="button_olive">답글남기기</button>
			<button type="reset" id="cs_button_delete">초기화</button>
			<input type="hidden" name="cs_board_re_ref" value="${board.cs_board_re_ref}">
			<input type="hidden" name="cs_board_category_user" value="${board.cs_board_category_user}">
			<input type="hidden" name="cs_board_category_main" value="3">
			<input type="hidden" name="cs_board_category_sub" value="${board.cs_board_category_sub}">
		</form>
	</section>
</body>
</html>