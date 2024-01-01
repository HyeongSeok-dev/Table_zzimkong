<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- JSTL 에서 split() 등의 함수 사용을 위해 functions 라이브러리 추가(${fn:xxx()} 형식으로 활용) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
</head>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js">
</script>
<body>
	<header>
		<jsp:include page="../inc/top2_search_bar.jsp"/>
	</header>
	<main>
		<jsp:include page="../inc/my_sidebar.jsp" />
	<div class="wrapper">
		<form action="MyModifyPro" method="post" name="modifyForm" enctype="multipart/form-data">
			<div class="title">
			<span class= "mypg">
				<h1>회원정보 변경</h1>
			</span>
			</div>
			<br>
				
				<table style="width: 1000px; table-layout: fixed;">
					<tr>
						<th style="width: 300px;">프로필사진</th>
						<td style="width: 700px;">
							<img src="${pageContext.request.contextPath}/resources/img/profile.png" width="100" height="100">
							<p>프로필 사진으로 사용할 이미지를 등록해 주세요.</p>
	                          <input type="file" name="fImage" class="hide"><br>
	                          <input type="checkbox" > 프로필 초기화
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" class="input_text" value="${mypage.user_name}" readonly>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="text" class="input_text" value="${mypage.user_birth}" readonly>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input type="text" id="u_nick" name=user_nick class="input_text" value="${mypage.user_nick}" placeholder="2 ~ 6자리 닉네임">
							<span id= "checkNickResult"></span>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<%-- 이메일 주소 분리("@" 기준)하여 표시 --%>
							<c:set var="arrEmail" value="${fn:split(mypage.user_email, '@')}" />
							<input type="text" name="user_email1" class="email_text" value="${arrEmail[0]}"> @
							<input type="text" name="user_email2" class="email_text" value="${arrEmail[1]}">
	                    	<select class="email_domain" name="emailDomain">
								<option value="">선택하세요</option>
				                <option value="gmail.com">gmail.com</option>
				                <option value="naver.com">naver.com</option>
				                <option value="daum.net">daum.net</option>
				                <option value="yahoo.com">yahoo.com</option>
				                <option value="">직접입력</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
						 	<div>
						 	<%-- 현재 비밀번호 --%>
	                     	<input type="password" id="txtPassword" name="user_passwd" class="passwd_text" placeholder="현재 비밀번호"><br><br>
	                     	<%-- 새 비밀번호 --%>
	                     	<input type="password" id="txtPassword2" name="user_passwd1" class="passwd_text2" placeholder="새 비밀번호 (영어 대소문자, 숫자, 특수문자 조합 8 ~ 16자리)">
	                     	<div id="checkPasswdResult"></div><br>
	                     	<%-- 새 비밀번호 확인 --%>
	                     	<input type="password" id="txtPassword3" name="user_passwd2" class="passwd_text2" placeholder="비밀번호 확인">
	                     	<div id="checkPasswd2Result"></div><br>
	                     </div>
						</td>
					</tr>
				</table>
				
            <a id="btnDeactivate" href="${pageContext.request.contextPath }/my/unregister" class="btn_out">회원탈퇴하기</a> 
            <div class = "click_button">
            		<button type="submit" >수정하기</button>
			</div>
		</form>
	</div>		
	</main>
	<footer>
<%-- 		<jsp:include page="../inc/bottom.jsp"/> --%>
	</footer>
</body>
</html>