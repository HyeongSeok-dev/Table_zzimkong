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
	<div class="headerMenu">
		<div class="top_logo_img">
			<img alt="logo1" id="logo1" src="${pageContext.request.contextPath }/resources/img/logo1_2.png">
			<img alt="logo2" id="logo2" src="${pageContext.request.contextPath }/resources/img/logo3_2.png">
		</div>
		<div class="top_search_button">
			<jsp:include page="search_bar.jsp"/>
		</div>
		<div class="top_menu">
			<c:choose>
				<c:when test="${empty sessionScope.sId }"> <%-- 미 로그인 시 --%>
					<%--로그인 --%>
					<li><a href="${pageContext.request.contextPath}/login">
					<img src="${pageContext.request.contextPath}/resources/img/user.png"
					style="width: 30px; height: 30px;"></a></li>
					<%--고객센터 --%>
					<li><a href="${pageContext.request.contextPath}/member/cs/faq">
					<img  src="${pageContext.request.contextPath}/resources/img/headset.png"
					style="width: 30px; height: 30px;"></a></li>
				</c:when>
				<c:otherwise>
					<%--마이페이지 --%>
					<li><a href="${pageContext.request.contextPath}/my/list">
					<img src="${pageContext.request.contextPath}/resources/img/user.png"
						style="width: 30px; height: 30px;"></a></li>
					<%--알림 --%>
					<li><a href="${pageContext.request.contextPath}/#">
					<img src="${pageContext.request.contextPath}/resources/img/bell.png"
					style="width: 30px; height: 30px;"></a></li>
					<%--고객센터 --%>
					<li><a href="${pageContext.request.contextPath}/member/cs/faq">
					<img  src="${pageContext.request.contextPath}/resources/img/headset.png"
					style="width: 30px; height: 30px;"></a></li>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>