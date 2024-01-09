<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 확인</title>
		<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login_findPasswd.css">
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/join.js"></script>
	</head>
	<body>
	
		<div id="nmContainer" class="nm_container ">
		  <div class="nm_find_wrap">
		      <div class="find_box">
		        <form id="resultIdPro" method="POST" action="resultIdPro">
		        
		        <!-- 로고 이미지 -->
		        <div align="center" class="div_img">
		        	<img class="logo_img_1" src="${pageContext.request.contextPath }/resources/img/logo1_2.png" alt="메인로고1" >
		        	<img class="logo_img_2" src="${pageContext.request.contextPath }/resources/img/logo3_2.png" alt="메인로고2" >
		       </div><br>
		       
		       <!-- 테두리를 위한 div테그 -->
		       <div id="box">
		       		<p>회원님의 아이디는 ${member.user_id } 입니다.</p>
			          <div class="button_find"  align="center">
				          <button type="button" class="btn findbtnB" id="findBtn" onclick="location.href='${pageContext.request.contextPath}/login'">
				            <span>로그인 하러 가기</span>
				          </button>
			         </div>
		     </div>
	       </form>
	      </div>
	    </div>
	  </div>
		  
	</body>
</html>
