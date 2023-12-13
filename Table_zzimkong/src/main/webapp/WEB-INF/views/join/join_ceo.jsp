<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>업체 회원 가입</title>
    <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join_total.css">

  </head>
  <body>
  
<%--   	<jsp:include page="top.jsp"></jsp:include> --%>
  
  
    <div id="nmContainer" class="nmContainer">
      <div class="nmTit">
        <h2>
          업체 회원 가입
        </h2>
      </div>
      <div class="nmCont">
        <div class="nmLoginWrap">
          <div class="loginBox">
            <form id="loginForm" method="POST" target="_self">
              <input type="hidden" name="URL" value="https://www.ahnlab.com/kr/site/login/userLogin.do">
              <input type="hidden" name="fromUrl" value="">
              <input type="hidden" name="brandId" value="">
              
              <!-- 아이디 -->
              	<input type="text" id="userId" name="userId" class="inputTxt inpBig" placeholder="아이디" onkeydown="eventObj.loginByEnterKey(event)" maxlength="100" />
              <!-- 비밀번호 -->
              <input type="password" id="passwd" name="passwd" class="inputTxt inpBig"  style="text-align: left;"
              placeholder="비밀번호 (영문, 숫자, 특수문자 조합 8~16자리)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
              <!-- 비밀번호 확인 -->              
              <input type="password" id="passwd2" name="passwd2" class="inputTxt inpBig" style="text-align: left;"
               placeholder="비밀번호 확인" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
              <!-- 이름 -->
              <input type="text" id="u_name" name="u_name" class="inputTxt inpBig" placeholder="이름" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
              <!-- 생년월일 --><span class="bday">생년월일</span>
              <input type="date" id="com_birth" name="com_birth" class="inputTxt inpBig"   onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
	             
	              <div class="u_emil">
	                <input type="text" id="u_email" name="u_email" class="inputTxt inpBig" placeholder="이메일" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
	                &nbsp;
	                <span>@</span>
	                 &nbsp;
					<select id="u_email2" name="u_email" class="inputTxt inpBig" >
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
				  <input type="text" id="u_phone" name="u_phone" class="inputTxt inpBig" placeholder="전화번호 (' - ' 를 빼고 입력)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="100">
				  <button type="button" class="inputTxt inpBig">인증하기</button>
			  </div>
			  
			   <!-- 사업자번호 -->
              <div id="phoneBox">
				  <input type="text" id="u_phone" name="u_phone" class="inputTxt inpBig" placeholder="사업자번호 (' - ' 를 빼고 입력)" onkeydown="eventObj.loginByEnterKey(event)" maxlength="100">
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