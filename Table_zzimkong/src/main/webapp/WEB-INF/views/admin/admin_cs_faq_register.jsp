<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/admin_popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/cs_register.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cs.js"></script>
</head>
<body class="info_window">
	<section>
		<h3>자주묻는질문 작성</h3>
		<br><br>
		<form action="/zzimkong/admin/cs/Register/pro" method="POST" name="adminFaqRegisterForm" enctype="multipart/form-data" >
			<input type="hidden" name="cs_board_category_main" value="2"> <%-- 자주묻는질문 --%>
			<table>
				<tr>
					<th>번호</th>
					<td></td>
					<th>회원유형</th>
					<td>
						<select class="user_select" name="cs_board_category_user" required>
		            		<option selected disabled>회원유형</option>
							<option value="1">일반회원</option>
							<option value="2">사업자회원</option>
		            	</select>
					</td>
					<th>질문유형</th>
					<td>
					<select class="member_category_select" name="cs_board_category_sub">
	            		<option selected disabled>질문유형</option>
						<option value="1">예약</option>
						<option value="2">주문/결제</option>
						<option value="3">리뷰</option>
						<option value="4">회원정보</option>
						<option value="5">이용문의</option>
						<option value="6">쿠폰/포인트</option>
	            	</select>
	            	<select class="ceo_category_select" name="cs_board_category_sub">
	            		<option selected disabled>질문유형</option>
	            		<option value="1">예약관리</option>
	            		<option value="2">메뉴관리</option>
	            		<option value="3">광고</option>
	            		<option value="4">블랙회원관리</option>
	            		<option value="5">업체관리</option>
	            	</select>
					</td>
				</tr>
				<tr>
					<th colspan="2">제목</th>
					<td colspan="4">
						<input type="text" name="cs_board_subject" placeholder="제목을 입력해주세요.">
					</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
					<td colspan="4">
						<textarea rows="20" cols="100" name="cs_board_content" placeholder="내용을 입력해주세요."></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">파일첨부</th>
					<td colspan="4" class="td_file">
                          <input type="file" name="mFile1" class="file" accept="image/*">
                          <input type="file" name="mFile2" class="file" accept="image/*">
                          <input type="file" name="mFile3" class="file" accept="image/*">
                          <input type="file" name="mFile4" class="file" accept="image/*">
                          <input type="file" name="mFile5" class="file" accept="image/*">
                     </td>
				</tr>
			</table>
			<br><br>
			
			<button type="submit" class="button_olive">등록</button>
			<button type="reset" class="button_grey2">초기화</button>
		</form>
	</section>
</body>
</html>