<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
</head>
<body>
	<div class="text_inner">
		<div class="header_div01">
			<span><h3>예약 변경</h3></span>
		</div>
	</div>
	<div class="text_inner">
		<form action="" method="post" name="blackRegister">
			<table>
				<tr>
					<th style="width:15%;" name="memberNum">회원 번호</th>
					<td colspan="2">
						<div>
							<input type="text"  class="input_text" id="memberNumText" readonly>
							<button type="button">회원조회</button>
						</div>	
					</td>
					<th style="width:15%;">아이디</th>
					<td colspan="2"><input type="text" class="input_text" value="" name="id"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" class="input_text" value="" name="name"></td>
					<th>연락처</th>
					<td colspan="2"><input type="text" class="input_text" value="" name="phoneNum"></td>
				</tr>
				<tr>
					<th>사유</th>
					<td colspan="5"><textarea rows="10" cols="100" name="motivation"></textarea></td>
				</tr>
			</table>
			<br>
			<div class = "click_button">
			<button type="button">등록</button>
			<button type="button" id="my_delete" onclick="javascript:window.close()">취소</button>
			</div>
		</form>
	</div>
</body>
</html>