<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3>1 : 1 답글</h3>
		<br><br>
		<form action="" method="post" name="memberQnaForm">
			<table>
				<tr>
					<th>번호</th>
					<td>1</td>
					<th>아이디</th>
					<td>ZZimkong</td>
				</tr>
				<tr>
					<th>유형</th>
					<td>
					--유형
					</td>
					<th>
						질문유형
					</th>
					<td>
					--질문유형	
					</td>
				</tr>
				<tr>
					<th colspan="2">문의제목</th>
					<td colspan="4">
						--문의제목					
					</td>
				</tr>
				<tr>
					<th colspan="2">문의내용</th>
					<td colspan="4">
						--문의내용
					</td>
				</tr>
				<tr>
					<th colspan="2">파일</th>
					<td colspan="4" class="td_file">
					</td>
				</tr>
				<tr>
					<th colspan="2">답변제목</th>
					<td colspan="4">
						<input type="text" placeholder="제목" id="">
					</td>
				</tr>
				<tr>
					<th colspan="2">답변내용</th>
					<td colspan="4">
						<textarea rows="20" cols="80"></textarea>
					</td>
				</tr>
			</table>
			<br><br>
			<button type="button" class="button_olive" onclick="location.href='javascript:history.back()'">뒤로가기</button>
			<button type="submit" class="button_olive">수정</button>
			<button type="button" id="cs_button_delete">삭제</button>
		</form>
	</section>
</body>
</html>