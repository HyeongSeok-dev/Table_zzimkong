<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>회원탈퇴</title>
<link href="${pageContext.request.contextPath }/resources/css//mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">



</head>
<body>
	<div align="center">
		<h3>비밀번호를 한번 더 입력해주세요</h3>
	</div>
	<br><br>
			<div align="center">
	<form action="MemberWithdrawPro" method="POST">
				<input type="password" class="input_text" placeholder="비밀번호를 입력해주세요." name="user_passwd" ><br><br>
				<button type="submit"  >탈퇴</button>
	</form>
				<button type="button" id="my_delete">취소</button>
			</div>
</body>
</html>