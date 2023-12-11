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
	<!--     <li> -->
	<%--       <a id="about" href="${pageContext.request.contextPath }/views/company/com_dashboard.jsp" class="on"> --%>
	<%--       <img alt="logo" src="${pageContext.request.contextPath }/resources/img/logo1_1.png" width="150px"><br> --%>
	<!--       <div class="page_name">업주 페이지</div> -->
	<!--       </a> -->
	<!--     </li> -->
	    <li>
	      <a id="menu" href="${pageContext.request.contextPath }/views/company/com_dashboard.jsp">
	        판매관리
	      </a>
	    </li>
	    <li>
	      <a id="franchise" href="${pageContext.request.contextPath }/views/company/com_list.jsp">
	        내업체관리
	      </a>
	    </li>
	    <li>
	      <a id="store" href="${pageContext.request.contextPath }/views/company/com_menu_list.jsp">
	        메뉴관리
	      </a>
	    </li>
	    <li>
	      <a id="news" href="${pageContext.request.contextPath }/views/company/com_reservation.jsp">
	        예약관리
	      </a>
	    </li>
	    <li>
	      <a id="sns" href="${pageContext.request.contextPath }/views/company/com_black.jsp">
	        블랙회원관리
	      </a>
	    </li>
	    <li>
	      <a id="sns" href="${pageContext.request.contextPath }/views/company/com_CS.jsp">
	        고객센터
	      </a>
	    </li>
	    <li>
		    <div class="com_top_logout">
		    	<span class="top_name">이형석님</span>
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
</body>
</html>