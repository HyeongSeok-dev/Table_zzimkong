<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
  
    <meta charset="UTF-8">
    <title>업체 회원 가입</title>
    <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join_ceo.css">
	<!-- 사업자번호 진위 여부 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<!-- js -->
    <script src="${pageContext.request.contextPath }/resources/js/join_ceo.js"></script>

  </head>
  <body>
  
  	<jsp:include page="../inc/top2.jsp"></jsp:include>
  
  
    <div id="nmContainer" class="nmContainer">
      <div class="nmTit">
        <h2>
          업체 회원 가입
        </h2>
      </div>
      <div class="nmCont">
        <div class="nmLoginWrap">
          <div class="loginBox">
            <form id="loginForm" method="POST"  action="MemberJoinCeoPro" name="joinForm"> 
              <input type="hidden" name="URL" value="https://www.ahnlab.com/kr/site/login/userLogin.do">
            
              <!-- 아이디 -->
              	<input type="text" id="userId" name="user_id" class="inputTxt inpBig" 
              	placeholder="아이디(영문자, 숫자 조합 8~16자리 필수 / 한글, 특수문자 사용불가 )"  maxlength="100" />
             	<span id="checkIdResult"></span>
             	<br><br>
              <!-- 비밀번호 -->
              <input type="password" id="passwd" name="user_passwd" class="inputTxt inpBig"  style="text-align: left;"
              placeholder="비밀번호 (영문, 숫자, 특수문자 조합 8~16자리) 권장" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
               <span id = "checkPasswdResult" ></span>
               <br><br>
              <!-- 비밀번호 확인 -->              
              <input type="password" id="passwd2" name="passwd2" class="inputTxt inpBig" style="text-align: left;"
               placeholder="비밀번호 확인" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
               <span id = "checkPasswd2Result" ></span>
               <br><br>
              <!-- 이름 -->
              <input type="text" id="u_name" name="user_name" class="inputTxt inpBig" placeholder="이름" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
              <br>
              <!-- 생년월일 --><span class="bday">생년월일</span>
              <input type="date" id="com_birth" name="user_birth" class="inputTxt inpBig"   onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
             <br><br><br>
             <!-- 이메일 -->
	              <div class="u_emil">
	                <input type="text" id="u_email" name="user_email1" class="inputTxt inpBig" placeholder="이메일" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
	                &nbsp;
	                <span>@</span>
	                 &nbsp;
					<input type="text" id="customEmail" class="inputTxt inpBig" name="user_email2" style="display:none;" placeholder="이메일을 입력하세요">
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
              
              <!-- 전화번호 -->
              <div id="phoneBox">
				  <input type="text" id="u_phone" name="user_phone" class="inputTxt inpBig" placeholder="전화번호 (' - ' 를 빼고 입력)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="100">
				  <button type="button" class="inputTxt inpBig">인증하기</button>
                  <span id="checkPhoneResult"></span>
			  </div>
			  <br>
			  <!-- 개업일 -->
			  <div>
	              <input type="text" id="com_date" class="inputTxt inpBig" placeholder="개업일 8자리(' - ' 를 빼고 입력)"  maxlength="16" autocomplete="false">
			  </div>
			  <br>
			   <!-- 사업자번호 -->
              <div id="ceoBox">
				  <input type="text" id="com_num" name="com_num" class="inputTxt inpBig" placeholder="사업자번호 (' - ' 를 빼고 입력)"  maxlength="100">
				  <button type="button" class="inputTxt inpBig" id="api">인증하기</button>
               	  <span id="checCeonNmResult"></span>
			  </div>
			  <br>              
              <!-- 가입하기 버튼 -->
              <button type="submit" class="btnJoin btnB" id="joinBtn">
                <span>
                  가입하기
                </span>
              </button>
              <br>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <footer>
    		      	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    </footer>
    
  </body>
</html>