<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_black.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<%-- 사이드바 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_sidebar.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body class="info_window">
	<section>
		<h3>블랙회원 등록</h3>
		<br><br>
		<form action="" method="post" name="blackRegister">
			<table>
				<tr>
					<th style="width:15%;" name="memberNum">회원 번호</th>
					<td colspan="2">
						<div>
							<input type="text" id="comNumText" readonly>
							<button type="button">회원조회</button>
						</div>	
					</td>
					<th style="width:15%;">아이디</th>
					<td colspan="2"><input type="text" value="" name="id"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" value="" name="name"></td>
					<th>연락처</th>
					<td colspan="2"><input type="text" value="" name="phoneNum"></td>
				</tr>
				<tr>
					<th>사유</th>
					<td colspan="5"><textarea rows="10" cols="100" name="motivation"></textarea></td>
				</tr>
			</table>
			<br>
			<button type="button">등록</button>
			<button type="reset" id="my_delete">취소</button>
		</form>
	</section>
</body>
</html>