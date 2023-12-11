<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
	</head>
	
	<body>
	
<%-- 	<jsp:include page="top_ns.jsp"></jsp:include> --%>

		<div id="nmContainer" class="nmContainer snipcss-FsXc1">
		  <div class="nmTit">
		    <h2>
		     로그인
		    </h2>
		  </div>
		  <div class="nmCont">
		    <div class="nmLoginWrap">
		      <div class="loginBox">
		        <form id="loginForm" method="POST" target="_self" >
		          <input type="hidden" name="URL" value="https://www.ahnlab.com/kr/site/login/userLogin.do">
		          <input type="hidden" name="fromUrl" value="">
		          <input type="hidden" name="brandId" value="">
		          <!-- ID입력 텍스트박스 -->
		          <input type="text" id="userId" name="userId" class="inputTxt inpBig" placeholder="아이디" onkeydown="eventObj.loginByEnterKey(event)" maxlength="100">
		          <!-- 비밀번호 입력 텍스트박스 -->
		          <input type="password" id="passwd" name="passwd" class="inputTxt inpBig" style="text-align: left;"
		           placeholder="비밀번호 (영문, 숫자, 특수문자 조합 8~16자리)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
		           <!-- ID기억하기 체크박스 -->
		           <div class="check" align="left">
					    <input type="checkbox"  id="remember-id">
					    <label for="remember-id">ID기억하기</label>
					</div>
		          <button type="button" class="btnLogin btnB" id="loginBtn">
		            <span>
		              로그인
		            </span>
		          </button>
		          <br><br>
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
		        <a href="join_choice.jsp">
		          회원가입
		        </a>
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
		</div>
	
	
	</body>
	
	<script src="./js/login.js"></script>
	
	
	<footer>
		      	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    </footer>
	
	
</html>