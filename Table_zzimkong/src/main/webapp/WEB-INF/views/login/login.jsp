<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
		<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
		<script src="${pageContext.request.contextPath }/resources/js/login.js"></script>
	
	
	</head>
	
	<body>
	
		<jsp:include page="../inc/top2.jsp"></jsp:include>

		<div id="nmContainer" class="nmContainer snipcss-FsXc1">
		  <div class="nmTit">
		    <h2>
		     로그인
		    </h2>
		  </div>
		    <div class="nmLoginWrap">
		      <div class="loginBox">
		        <form action="loginPro" id="loginForm" method="post">
		          <!-- ID입력 텍스트박스 -->
		           <input type="text" id="userId" name="user_id" class="inputTxt inpBig" placeholder="아이디" required>
		          <!-- 비밀번호 입력 텍스트박스 -->
		          <input type="password" id="passwd" name="user_passwd" class="inputTxt inpBig" style="text-align: left;"
		           placeholder="비밀번호 (영문, 숫자, 특수문자 조합 8~16자리)" required>
		           <!-- ID 저장하기 체크박스 -->
		           <div class="check" align="left">
					    <input type="checkbox" class="save_id" name="checkId" id="saveId">
					    <label for="saveId">ID 저장하기</label>
					</div>
		          <button type="submit" class="btnLogin btnB" id="loginBtn">
		            <span>
		              로그인
		            </span>
		          </button>
		          <button type="button" class="btnkakaoLogin btnB" id="loginkakaoBtn">
			          <span>
			          카카오로 간편 로그인
			          </span>
		          </button>
		        </form>
		      </div>
		    </div>
		    <ul class="siteList">
		      <li>
		        <div onclick="joinAgree()" id="joinBtn">
		          회원가입
		        </div>
		      </li>
		      <!-- 아이디 찾기 -->
		      <li>
				  <a href="" id="find_id" onclick="popupFindId()">
				  아이디 찾기
				  </a>
		     </li>
		     
		     
		      <li>
				 <a href="" id="find_passwd" onclick="popupFindPasswd()">
		          비밀번호 찾기
		        </a>
		      </li>
		    </ul>
		  </div>
	</body>
	
	
	<footer>
	      	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    </footer>
	
	
</html>