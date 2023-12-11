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
	<div class="headerMenu imgP snipcss-X9RSH">
		<img alt="logo1" src="${pageContext.request.contextPath }/resources/img/logo1_2.png" width="100px">
		<img alt="logo2" src="${pageContext.request.contextPath }/resources/img/logo2_1.png" width="260px">
	</div>
	<div class="headerMenu imgP snipcss-X9RSH">
	  <ul class="">
	    <li>
	      <a id="about" href="/" class="on">
	      <div class="page_name">관리자 페이지</div>
	      </a>
	    </li>
	    <li>
	      <a id="menu" href="admin_main.jsp">
	        Dashboard
	      </a>
	    </li>
	    <li>
	      <a id="franchise" href="admin_user.jsp">
	        회원관리
	      </a>
	    </li>
	    <li>
	      <a id="store" href="admin_company.jsp">
	        업체관리
	      </a>
	    </li>
	    <li>
	      <a id="news" href="admin_review.jsp">
	        리뷰관리
	      </a>
	    </li>
	    <li>
	      <a id="news" href="#">
	        고객센터
	      </a>
	    </li>
	    <li>
	     <div class="com_top_logout">
				<span class="headerRi">
				    <a href="/bbs/content.php?co_id=franchise#con13">
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