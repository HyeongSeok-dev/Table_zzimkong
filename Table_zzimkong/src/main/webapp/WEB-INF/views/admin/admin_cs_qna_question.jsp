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
		<h3>1 : 1 문의사항</h3>
		<br><br>
		<form action="" method="post" name="memberQnaForm">
			<table>
				<tr>
					<th>번호</th>
					<td>1</td>
					<th>유형</th>
					<td>
						업주
					</td>
					<th>
						질문유형
					</th>
					<td>
						예약관리
					</td>
				</tr>
				<tr>
					<th colspan="2">제목</th>
					<td colspan="4">
					제목제목
					</td>
				</tr>
				<tr>
					<th colspan="2">문의내용</th>
					<td colspan="4">
					내용내용
					</td>
				</tr>
				<tr>
					<th colspan="2">파일첨부</th>
					<td colspan="4" class="td_file">
					사진파일 올라오는 곳<!-- <img rsc=""> -->
					</td>
				</tr>
			</table>
			<br><br>
			<button type="button" class="button_olive">답글</button>
			<button type="button" id="cs_button_delete">삭제</button>
		</form>
	</section>
</body>
</html>