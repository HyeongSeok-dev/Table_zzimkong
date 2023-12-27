<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
  
    <meta charset="UTF-8">
    <title>업체 회원 가입</title>
    <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join_total.css">

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
              <!-- 비밀번호 -->
              <input type="password" id="passwd" name="user_passwd" class="inputTxt inpBig"  style="text-align: left;"
              placeholder="비밀번호 (영문, 숫자, 특수문자 조합 8~16자리)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
               <span id = "checkPasswdResult" ></span>
              <!-- 비밀번호 확인 -->              
              <input type="password" id="passwd2" name="passwd2" class="inputTxt inpBig" style="text-align: left;"
               placeholder="비밀번호 확인" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
               <span id = "checkPasswd2Result" ></span>
              <!-- 이름 -->
              <input type="text" id="u_name" name="user_name" class="inputTxt inpBig" placeholder="이름" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
              <!-- 생년월일 --><span class="bday">생년월일</span>
              <input type="date" id="com_birth" name="user_birth" class="inputTxt inpBig"   onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
	             
	              <div class="u_emil">
	                <input type="text" id="u_email" name="user_email1" class="inputTxt inpBig" placeholder="이메일" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
	                &nbsp;
	                <span>@</span>
	                 &nbsp;
					<select id="u_email2" name="user_email2" class="inputTxt inpBig" >
		                <option value="">선택하세요</option>
		                <option value="gmail.com">gmail.com</option>
		                <option value="naver.com">naver.com</option>
		                <option value="daum.net">daum.net</option>
		                <option value="yahoo.com">yahoo.com</option>
		                <option value="yahoo.com">직접입력</option>
		             </select>	              
		           </div>
              
              <!-- 전화번호 -->
              <div id="phoneBox">
				  <input type="text" id="u_phone" name="user_phone" class="inputTxt inpBig" placeholder="전화번호 (' - ' 를 빼고 입력)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="100">
				  <button type="button" class="inputTxt inpBig">인증하기</button>
			  </div>
			  
			   <!-- 사업자번호 -->
              <div id="phoneBox">
				  <input type="text" id="com_num" name="com_num" class="inputTxt inpBig" placeholder="사업자번호 (' - ' 를 빼고 입력)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="100">
				  <button type="button" class="inputTxt inpBig">인증하기</button>
			  </div>
				              
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