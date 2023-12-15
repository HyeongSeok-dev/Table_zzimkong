<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_user.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body id="body">
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>
	
	<section class="article">
        <div class="text">
        
        	<%-- 검색창 --%>
	        <div id="board-search">
	        	<div class="container">
		            <div class="search-window">
		                <form action="">
		                    <div class="search-wrap">
		                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
								<button type="submit" class="btn btn-dark">
									<i class="material-icons search_icon">&#xe8b6;</i>
								</button>
		                    </div>
		                </form>
		            </div>
		        </div>
	        </div>
	        <div class="float_after"></div>
	        
			<h3>회원 관리</h3>
			
			<table border="1">
				<tr>
					<th>회원번호</th>
					<th>
						<select id="member_category">
						    <option value="member_all" selected>회원구분</option>
						    <option value="member_admin">관리자</option>
						    <option value="member_user">일반회원</option>
						    <option value="member_ceo">업주회원</option>
						</select>
					</th>
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
					<td>2023/12/03 00:00</td>
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
					<td>2023/12/25 14:00</td>
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
					<td>2023/12/26 23:21</td>
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