<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_company.jsp</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<%-- 탑 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_top.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ceo_menu_list.js"></script>
<style type="text/css" >
	.menu_img{
		width: auto;
		height: 100px;
	}
</style>
</head>
<body>
	<%-- 사이드바 삽입 --%>
	<%-- <jsp:include page="../company/com_sidebar.jsp"/> --%>
	<%-- top 삽입 --%>
	<header>
		<jsp:include page="../inc/ceo_top.jsp"/>
	</header>
	<section class="ceo_sec">
		<div class="text">
			<div class="text_inner">
				<div class="header_div01">
					<span><h1>사업장별 메뉴관리</h1></span>
					<span class="header_span">
						<select id="storeList">
							<c:if test="${not empty myCompanyList}">
								<c:forEach var="company" items="${myCompanyList}">
									<option value="${company.com_id}">${company.com_name}</option>
								</c:forEach>
							</c:if>
						</select>
						
					</span>	
				</div>
			</div>
			<div class="text_inner">
				<div class="header">
					<span><h3>메뉴 관리 리스트</h3></span>
					<span><button type="button" class="button_olive" onclick="menuRegistration()">메뉴등록</button></span>
				</div>
				<table id="menuTable" border="1">
					<tr>
						<th>메뉴번호</th>
						<th>메뉴명</th>
						<th>가격</th>
						<th>메뉴설명</th>
						<th>이미지</th>
						<th>수정/삭제</th>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
	</footer>
</body>
</html>