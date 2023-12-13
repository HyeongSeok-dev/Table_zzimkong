<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/cs_register.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body class="info_window">
	<section>
		<h3>공지사항 작성</h3>
		<br><br>
		<form action="" method="post" name="adminNotifyRegisterForm">
			<table>
				<tr>
					<th>번호</th>
					<td>1</td>
					<th>유형</th>
					<td>
						<select class="user_select">
		            		<option>유형</option>
							<option>일반</option>
							<option>업주</option>
		            	</select>
					</td>
				</tr>
				<tr>
					<th colspan="1">제목</th>
					<td colspan="3">
						<input type="text" placeholder="제목" id="">
					</td>
				</tr>
				<tr>
					<th colspan="1">공지내용</th>
					<td colspan="3">
						<textarea rows="20" cols="80"></textarea>
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