<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_user.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body id="body">
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>
	
	<section class="article">
        <div class="text">
			<h3>회원 관리</h3>
			
			<table border="1">
				<tr>
					<th>회원번호</th>
					<th>회원구분</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>포인트</th>
					<th>가입일자</th>
					<th>회원상태</th>
					<th>탈퇴</th>	
				</tr>
				<tr>
					<td>1</td>
					<td>관리자</td>
					<td>admin</td>
					<td>admin</td>
					<td>99,999</td>
					<td>2023/12/03</td>
					<td>정상</td>
					<td>
						<button type="button" onclick="user_withdraw()" class="button_cancel">탈퇴</button>
					</td>	
				</tr>
				<tr>
					<td>2</td>
					<td>일반회원</td>
					<td>user</td>
					<td>Nick</td>
					<td>5,000</td>
					<td>2023/12/25</td>
					<td>휴먼/정지</td>
					<td>
						<button type="button" onclick="user_withdraw()" class="button_cancel">탈퇴</button>
					</td>	
				</tr>
				<tr>
					<td>3</td>
					<td>업주회원</td>
					<td>owner</td>
					<td>사장</td>
					<td>10,500</td>
					<td>2023/12/26</td>
					<td>탈퇴</td>
					<td>
						<button type="button" onclick="user_withdraw()" class="button_cancel">탈퇴</button>
					</td>	
				</tr>
			</table>
		</div>
	</section>

	<%-- 상단으로 --%>
	<footer>
		<jsp:include page="../inc/admin_topup.jsp"/>
	</footer>
</body>
</html>