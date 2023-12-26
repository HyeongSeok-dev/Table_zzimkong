<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top2.css">  
</head>
<body>
<!-- <div> -->
<!-- 	<div> -->
<!-- 		<a  href="/"></a>  -->
<!-- 	</div> -->
<!-- </div> -->
	<div class="headerMenu_search_bar">
		<div class="top_logo_img">
		    <a href="${pageContext.request.contextPath}/">
				<img alt="logo1" id="logo1" src="${pageContext.request.contextPath }/resources/img/logo1_2.png">
				<img alt="logo2" id="logo2" src="${pageContext.request.contextPath }/resources/img/logo3_2.png">
			</a>
		</div>
		<div class="top_search_button">
			<jsp:include page="search_bar.jsp"/>
		</div>
		<div class="top_menu">
			<c:choose>
				<c:when test="${empty sessionScope.sId }"> <%-- 미 로그인 시 --%>
					<%--로그인 --%>
					<li class="li"><a href="${pageContext.request.contextPath}/login">
					<img src="${pageContext.request.contextPath}/resources/img/top_user.png"
					style="width: 25px; height: 25px;"></a></li>
					&nbsp;
					<%--고객센터 --%>
					<li class="li"><a href="${pageContext.request.contextPath}/member/cs/faq">
					<img  src="${pageContext.request.contextPath}/resources/img/top_headset.png"
					style="width: 25px; height: 25px;"></a></li>
				</c:when>
				<c:otherwise>
					<%--로그인후 마이페이지/로그아웃 --%>
<!-- 					<li class="dropdown"> -->
<!-- 					    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> -->
<%-- 					    <img src="${pageContext.request.contextPath}/resources/img/top_user.png" style="width: 25px; height: 25px;"></a> --%>
<!-- 					    <ul class="dropdown-menu"> -->
<%-- 					        <li><a href="${pageContext.request.contextPath}/my/list">마이페이지</a></li> --%>
<%-- 					        <li><a href="${pageContext.request.contextPath}/MemberLogout">로그아웃</a></li> --%>
<!-- 					    </ul> -->
<!-- 					</li> -->
					<li class="li"><a href="${pageContext.request.contextPath}/login">
					<img src="${pageContext.request.contextPath}/resources/img/top_user.png"
					style="width: 25px; height: 25px;"></a></li>
					&nbsp;
					<%--알림 --%>
					<li class="li"><a href="${pageContext.request.contextPath}/#">
					<img src="${pageContext.request.contextPath}/resources/img/top_bell.png"
					style="width: 25px; height: 25px;"></a></li>
					&nbsp;
					<%--고객센터 --%>
					<li class="li"><a href="${pageContext.request.contextPath}/member/cs/faq">
					<img  src="${pageContext.request.contextPath}/resources/img/top_headset.png"
					style="width: 25px; height: 25px;"></a></li>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>