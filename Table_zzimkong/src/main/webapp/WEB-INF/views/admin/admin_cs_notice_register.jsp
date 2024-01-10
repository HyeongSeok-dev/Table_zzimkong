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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cs.js"></script>
</head>
<body class="info_window">
	<section>
		<h3>공지사항 작성</h3>
		<br><br>
		<form action="/zzimkong/admin/cs/Register/pro" method="POST" name="adminNoticeRegisterForm" enctype="multipart/form-data" >
			<input type="hidden" name="cs_board_category_main" value="1"> <%-- 공지사항 --%>
			<table>
				<tr>
					<th>번호</th>
					<td></td>
					<th>유형</th>
					<td>
						<select name="cs_board_category_user" required>
		            		<option value="" disabled>회원유형</option>
							<option value="1">일반회원</option>
							<option value="2">사업자회원</option>
							<option value="3">전체회원</option>
		            	</select>
			            <select class="notice_category_select" name="cs_board_category_sub" required>
		            		<option value="" disabled>유형선택</option>
		            		<option value="1">알림</option>
		            		<option value="2">이벤트</option>
            			</select>
					</td>
				</tr>
				<tr>
					<th colspan="1">제목</th>
					<td colspan="3">
						<input type="text" name="cs_board_subject" placeholder="제목" required>
					</td>
				</tr>
				<tr>
					<th colspan="1">공지내용</th>
					<td colspan="3">
						<textarea rows="20" cols="100" name="cs_board_content" required></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="1">파일첨부</th>
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
			
			<button type="submit" class="button_olive">공지등록</button>
			<button type="reset" class="button_grey2">초기화</button>
		</form>
	</section>
</body>
</html>