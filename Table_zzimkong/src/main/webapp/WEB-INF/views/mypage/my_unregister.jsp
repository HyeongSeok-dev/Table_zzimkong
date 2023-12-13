<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script>
	function unRegister() {
		var popupW = 400;
		var popupH = 200;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('check/passwd','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	};
</script>
</head>
<body>
	<div align="center">
	<h1>회원 탈퇴</h1>
	<br><br>
		<table>
			<tr>
			<td>
			회원 탈퇴 전 유의사항을 반드시 확인해주세요!<br><br>
			1. 30일 내 동일한 휴대폰 번호로 재가입 불가<br>
			가나다라마바사<br>
		
			2. 회원 정보 및 게시물 삭제<br>
			아자차카타파하<br>
			</td>
			</tr>
		</table>
	<h5>그래도 탈퇴하시겠습니까?</h5>
	<button type="submit" onclick="unRegister()">탈퇴</button>
	<button type="button" id="my_delete" >취소</button>
	</div>
</body>
</html>