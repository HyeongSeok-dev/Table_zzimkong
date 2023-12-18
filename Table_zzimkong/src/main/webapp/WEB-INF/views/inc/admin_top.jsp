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
	<div class="header_all">
	<div class="headerMenu1">
		<a href="${pageContext.request.contextPath}/admin/main">
			<img alt="logo1" src="${pageContext.request.contextPath }/resources/img/logo4_1.png" width="50px">
		</a>
	</div>
	<div class="headerMenu2">
	  <ul class="">
	    <li>
	      <a id="menu" href="${pageContext.request.contextPath }/admin/main">
	        Dashboard
	      </a>
	    </li>
	    <li>
	      <a id="franchise" href="${pageContext.request.contextPath }/admin/user">
	        회원관리
	      </a>
	    </li>
	    <li>
	      <a id="store" href="${pageContext.request.contextPath }/admin/company">
	        업체관리
	      </a>
	    </li>
	    <li>
	      <a id="news" href="${pageContext.request.contextPath }/admin/review">
	        리뷰관리
	      </a>
	    </li>
	    <li>
	      <a id="news" href="${pageContext.request.contextPath }/admin/cs/faq">
	        고객센터
	      </a>
	    </li>
	    <li>
	     <div class="com_top_logout">
				<span class="headerRi">
				    <a href="">
				      <span>
				        로그아웃
				      </span>
				    </a>
				</span>
				<span> 
					<a href="${pageContext.request.contextPath}">
						<img src="">
					</a>
				</span>
	    </li>
	  </ul>
	  </div>
	</div>
	</div>

</body>
</html>