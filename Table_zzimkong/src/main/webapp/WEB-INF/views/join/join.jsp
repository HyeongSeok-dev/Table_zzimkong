<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
    <!-- 본인인증api를 위한 sdk설치 -->
	<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
<!-- 	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.6.js"></script> -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- ================================ -->
  
    <meta charset="UTF-8">
    <title>일반회원 가입</title>
    <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css">
    <script src="${pageContext.request.contextPath }/resources/js/join.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/Phone_API.js"></script>
    
    

  </head>
  <body>
  
  	<jsp:include page="../inc/top2.jsp"></jsp:include>
  
    <div id="nmContainer" class="nmContainer">
      <div class="nmTit">
        <h2>
          일반회원 가입
        </h2>
      </div>
        <div class="nmLoginWrap">
          <div class="loginBox">
            <form id="loginForm" method="POST" action="MemberJoinPro"  name="joinForm">
<!--               <input type="hidden" name="fromUrl" value=""> -->
<!--               <input type="hidden" name="brandId" value=""> -->
              
              <!-- 아이디 -->
              	<input type="text" id="userId" name="user_id" class="inputTxt inpBig" placeholder="아이디 (영문자, 숫자 조합 8~16자리 필수(한글, 특수문자 사용불가 )"
               maxlength="100" />
              	<span id="checkIdResult"></span>
              	<br><br>
              <!-- 비밀번호 -->
              <input type="password" id="passwd" name="user_passwd" class="inputTxt inpBig"  style="text-align: left;"
              placeholder="비밀번호 (영문, 숫자, 특수문자 조합 8~16자리) 권장" maxlength="16" autocomplete="false">
             <span id = "checkPasswdResult" ></span>
             <br><br>
              <!-- 비밀번호 확인 -->              
              <input type="password" id="passwd2" name="passwd2" class="inputTxt inpBig"  style="text-align: left;"
              placeholder="비밀번호 확인" maxlength="16" autocomplete="false" >
             <span id = "checkPasswd2Result" ></span>
             <br><br>
              <!-- 닉네임 -->
              <input type="text" id="u_nick" name="user_nick" class="inputTxt inpBig" placeholder="닉네임"maxlength="100">
              <span id="checkNickResult"></span>
              <br><br>
              <!-- 이름 -->
              <input type="text" id="u_name" name="user_name" class="inputTxt inpBig" placeholder="이름" maxlength="16" autocomplete="false" >
              <!-- 생년월일 --><span class="bday">생년월일</span>
              <input type="date" id="com_birth" name="user_birth" class="inputTxt inpBig" maxlength="16" autocomplete="false">
           	  <br><br><br>
              <!-- 이메일 -->
	              <div class="u_emil">
	                <input type="text" id="u_email" name="user_email1" class="inputTxt inpBig" placeholder="이메일" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
	                <span id="at">@</span>
	                
					<input type="text" id="customEmail" class="inputTxt inpBig" name="user_email2" style="display:none;" placeholder="이메일을 입력하세요" disabled="disabled">
					&nbsp;&nbsp;
					<select id="u_email2" name="user_email2" class="inputTxt inpBig" onchange="checkOption(this)">
				  <option value="">선택하세요</option>
				  <option value="gmail.com">gmail.com</option>
				  <option value="naver.com">naver.com</option>
				  <option value="daum.net">daum.net</option>
				  <option value="yahoo.com">yahoo.com</option>
				  <option value="custom">직접입력</option>
				</select> 

		           </div>
   				   <span id="checkEmailResult"></span><br>
<!--               <br> -->
<!--               전화번호 -->
              <div id="phoneBox">
				  <input type="text" id="u_phone" name="user_phone" class="inputTxt inpBig" placeholder="전화번호 (' - ' 를 빼고 입력)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="100">
<!-- 				  <button type="button" class="inputTxt inpBig" id="api">인증하기</button> -->
				  <span id="checkPhoneResult"></span><br>
			  </div>
		       <br>   
<!--               가입하기 버튼 -->
              <button type="submit" class="btnJoin btnB" id="joinBtn" >
                <span>
                  가입하기
                </span>
              </button>
              <br>
            </form>
          </div>
        </div>
      </div>
    
    <footer>
		      	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    </footer>
  </body>
</html>