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
		<h3>공지사항</h3>
		<br><br>
			<table>
				<tr>
					<th>번호</th>
					<td>1</td>
				</tr>
				<tr>
					<th colspan="1">제목</th>
					<td colspan="3">
						--제목
					</td>
				</tr>
				<tr>
					<th colspan="1">공지내용</th>
					<td colspan="3">
						-- 공지내용
					</td>
				</tr>
			</table>
			<%--공지사항의 수정과 삭제 권한은 오직 관리자에게만 있음 수정과 삭제는 관리자 페이지에서 진행!! --%>
	</section>
</body>
</html>