<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 재설정</title>
		<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login_findPasswd.css">
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/join.js"></script>
	</head>
	<body>
	
		<div id="nmContainer" class="nm_container ">
		  <div class="nm_find_wrap">
		      <div class="find_box">
		        <form id="updatePasswdPro" method="POST" action="updatePasswdPro">
		        
		        <!-- 로고 이미지 -->
		        <div align="center" class="div_img">
		        	<img class="logo_img_1" src="${pageContext.request.contextPath }/resources/img/logo1_2.png" alt="메인로고1" >
		        	<img class="logo_img_2" src="${pageContext.request.contextPath }/resources/img/logo3_2.png" alt="메인로고2" >
		       </div><br>
		       
		       <!-- 테두리를 위한 div테그 -->
		       <div id="box">
		       		<input type="hidden" name="user_id" value="${authInfo.user_id}">
		       		<input type="hidden" name="auth_code" value="${authInfo.auth_code}">
		       		<input type="password" id="passwd" name="user_passwd" class="inputTxt inpBig"  style="text-align: left; width: 300px;"
		              placeholder="새 비밀번호 (영문, 숫자, 특수문자 조합 8~16자리)" maxlength="16" autocomplete="false"> 
		             <span id = "checkPasswdResult" ></span>
		             <br><br>
		              <!-- 비밀번호 확인 -->              
		              <input type="password" id="passwd2" name="passwd2" class="inputTxt inpBig"  style="text-align: left; width: 300px;"
		              placeholder="새 비밀번호 확인" maxlength="16" autocomplete="false" >
		             <span id = "checkPasswd2Result" ></span>
			          <div class="button_find"  align="center">
				          <button type="submit" class="btn findbtnB" id="findBtn">
				            <span>확인</span>
				          </button>
			          </div>
		          </div>
		       </form>
		      </div>
		    </div>
		  </div>
		  
	</body>
</html>
