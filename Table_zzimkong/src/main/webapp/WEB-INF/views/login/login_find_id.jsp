<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- JSTL 에서 split() 등의 함수 사용을 위해 functions 라이브러리 추가(${fn:xxx()} 형식으로 활용) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login_findId.css">
		<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
	</head>
	<body>
		<br>
		<div id="nmContainer" class="nm_container ">
		  <div class="nm_find_wrap">
		      <div class="find_box">
		        <form action="idPro" id="findForm" method="POST" target="_self">
		        <!-- 로고 이미지 -->
		        <div align="center" class="div_img">
		        	<img class="logo_img_1" src="${pageContext.request.contextPath }/resources/img/logo1_2.png" alt="메인로고1" >
		        	<img class="logo_img_2" src="${pageContext.request.contextPath }/resources/img/logo3_2.png" alt="메인로고2" >
		       </div>
		   			<br>
		       
		       <!-- 테두리를 위한 div테그 -->
		       <div id="box">
			        <!-- 이메일 -->
			        <div class="u_email" align="center" >
<!-- 		                <input type="text" id="uEmail" name="uEmail" placeholder="이메일" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false" required> -->
<!-- 		                <span id="at">@</span> -->
<!-- 						<select id="uEmail2" name="uEmail2" required> -->
<!-- 			                <option value="">선택하세요</option> -->
<!-- 			                <option value="gmail.com">gmail.com</option> -->
<!-- 			                <option value="naver.com">naver.com</option> -->
<!-- 			                <option value="daum.net">daum.net</option> -->
<!-- 			                <option value="yahoo.com">yahoo.com</option> -->
<!-- 			                <option value="">직접입력</option> -->
<!-- 			             </select>	               -->
						<!-- 이메일 주소 분리("@" 기준)하여 표시 -->
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
		           </div>
		        
		           
			        <!-- 아이디 찾기 버튼 -->
			          <div class="button_find"  align="center">
				          <button type="submit" class="btn findbtnB" id="findBtn">
				            <span>아이디 찾기</span>
				          </button>
			          </div>
		          </div>
		          
		          <br><br>
		          <!-- 고객센터 연결 -->
		          <div align="center">
			          아이디 찾기에 어려움이 있으신가요? 
			          <a href="${pageContext.request.contextPath }/member/cs/faq">고객센터</a>
		          </div>
		          
				 <!-- 바텀 -->
			<footer>
	      		<jsp:include page="../inc/bottom.jsp"></jsp:include>
   			</footer>
				
		        </form>
		      </div>
		    </div>
		  </div>
		  
	</body>
</html>
