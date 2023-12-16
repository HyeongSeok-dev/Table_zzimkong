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
			<table>
				<tr>
					<th>번호</th>
					<td>1</td>
					<th>유형</th>
					<td>
						--회원유형
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
					--파일 보여주기 <%--<a rsc=""></a> 이태그필요?? --%>
					</td>
				</tr>
				<tr>
					<th colspan="2">답변제목</th>
					<td colspan="4">
					--답변제목
					</td>
				</tr>
				<tr>
					<th colspan="2">답변내용</th>
					<td colspan="4">
					--답변내용
					</td>
				</tr>
			</table>
			<br><br>
			<button type="submit" class="button_olive" onclick="location.href='${pageContext.request.contextPath }/admin/cs/qna/answer/modify'">수정</button>
	</section>
</body>
</html>