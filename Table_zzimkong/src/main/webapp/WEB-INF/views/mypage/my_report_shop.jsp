<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	function reportReason() {
		var popupW = 600;
		var popupH = 650;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('reason','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')				
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/top2_search_bar.jsp"/>
	</header>
	<main>
	<jsp:include page="../inc/my_sidebar.jsp" />
	<div class="wrapper">
		<div>
			<div class="title">
			<span class= "mypg">
				<h1>가게 신고하기</h1>
			</span>
			</div>
			<br>
				<h3 class="small-text">* 신고할 가게를 선택해주세요 (이름순)</h3>
				<table style="width: 1000px; table-layout: fixed;">
					<tr>
						<th style="width:150px">가게명</th>
						<th>주소</th>
						<th style="width:150px"></th>
					</tr>
					<%-- 방문한 가게 출력 --%>
					<c:forEach var="visitedShop" items="${visitedShopList}">
						<tr>
							<td><b>${visitedShop.com_name}</b></td>
							<td>${visitedShop.com_address}</td>
							<td>
								<div class = "click_button">
									<button type="button" onclick="reportReason()">신고하기</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
	</div>
	</main>


</body>
</html>