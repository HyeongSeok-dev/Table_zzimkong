<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css//mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
</head>
<body>
	<div align="center">
		<h3>비밀번호를 한번 더 입력해주세요</h3>
	</div>
	<br><br>
	<div align="center">
		<input type="password" class="input_text" placeholder="비밀번호를 입력해주세요."><br><br>
		<button type="submit">확인</button>
		<button type="reset">취소</button>
	</div>
</body>
</html>