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
</head>
<body class="info_window">
	<section>
		<h3>공지사항 작성</h3>
		<br><br>
		<form action="/zzimkong/admin/cs/Register/pro" method="POST" name="adminNoticeRegisterForm">
			<input type="hidden" name="cs_board_category_main" value="1"> <%-- 공지사항 --%>
			<table>
				<tr>
					<th>번호</th>
					<td></td>
					<th>유형</th>
					<td>
						<select name="cs_board_category_user" required>
		            		<option>회원유형</option>
							<option value="1">일반회원</option>
							<option value="2">사업자회원</option>
		            	</select>
					</td>
				</tr>
				<tr>
					<th colspan="1">제목</th>
					<td colspan="3">
						<input type="text" name="cs_board_subject" placeholder="제목">
					</td>
				</tr>
				<tr>
					<th colspan="1">공지내용</th>
					<td colspan="3">
						<textarea rows="20" cols="80" name="cs_board_content"></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="1">파일첨부</th>
					<td colspan="3" class="td_file">
						<input type="file" multiple="multiple">
						<div class="file_5">* 파일 5개까지 첨부 가능</div>
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