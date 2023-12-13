<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login_findId.css">
	</head>
	<body>
		<br>
		<div id="nmContainer" class="nm_container ">
		  <div class="nm_find_wrap">
		      <div class="find_box">
		        <form id="findForm" method="POST" target="_self">
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
		                <input type="text" id="uEmail" name="uEmail" placeholder="이메일" onkeydown="eventObj.loginByEnterKey(event)" maxlength="16" autocomplete="false">
		                <span id="at">@</span>
						<select id="uEmail2" name="uEmail">
			                <option value="">선택하세요</option>
			                <option value="gmail.com">gmail.com</option>
			                <option value="naver.com">naver.com</option>
			                <option value="daum.net">daum.net</option>
			                <option value="yahoo.com">yahoo.com</option>
			                <option value="yahoo.com">직접입력</option>
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
			          <a href="">고객센터</a>
		          </div>
		          
				 <!-- 바텀 -->
				 <div align="center">
					 <br>
					 <hr>
					 <br>
					  <a href="">서비스 이용약관</a>
					 |
					 <a href="">개인정보 처리방침</a>
					 | 
					 <a href="">위치정보 이용약관</a>	  
				</div>
				
		        </form>
		      </div>
		    </div>
		  </div>
		  
	</body>
</html>
