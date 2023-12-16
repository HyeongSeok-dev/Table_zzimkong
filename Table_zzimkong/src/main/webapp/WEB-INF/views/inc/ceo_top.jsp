<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boss Page</title>
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ceo_top.css">  
</head>
<body>
<!-- <div> -->
<!-- 	<div> -->
<!-- 		<a  href="/"></a>  -->
<!-- 	</div> -->
<!-- </div> -->
	<div class="header_all">
	<div class="headerMenu1">
		<img alt="logo1" src="${pageContext.request.contextPath }/resources/img/logo4_1.png" width="50px">
	</div>
	<div class="headerMenu2">
	  <ul class="">
	    <li>
	      <a id="menu" href="${pageContext.request.contextPath }/ceo/sale">
	        판매관리
	      </a>
	    </li>
	    <li>
	      <a id="franchise" href="${pageContext.request.contextPath }/ceo/company/list">
	        사업장관리
	      </a>
	    </li>
	    <li>
	      <a id="store" href="${pageContext.request.contextPath }/ceo/menu/list">
	        메뉴관리
	      </a>
	    </li>
	    <li>
	      <a id="news" href="${pageContext.request.contextPath }/ceo/reservation">
	        예약관리
	      </a>
	    </li>
	    <li>
	      <a id="sns" href="${pageContext.request.contextPath }/ceo/black">
	        블랙회원관리
	      </a>
	    </li>
	    <li>
	      <a id="sns" href="${pageContext.request.contextPath }/ceo/cs/faq">
	        고객센터
	      </a>
	    </li>
	    <li>
		    <div class="com_top_logout">
		    	<span class="top_name">이형석님</span>
				<span class="headerRi">
				    <a href="">
				      <span>
				        로그아웃
				      </span>
				    </a>
				</span>
			</div>	
	    </li>
	  </ul>
	</div>
	</div>
</body>
</html>