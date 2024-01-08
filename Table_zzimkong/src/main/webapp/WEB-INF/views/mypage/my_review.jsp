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
	function reviewEdit(review_num, com_id) {
		location.href = "${pageContext.request.contextPath}/review/modify?review_num=" + review_num + "&com_id=" + com_id;
	}
	
	function reviewDelete() {
		confirm("리뷰를 삭제하시겠습니까?")
		if(true){
			alert("리뷰를 삭제하였습니다.")
		}
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
			<div class ="title">
			<span class= "mypg">
				<h1>나의 리뷰</h1>
			</span>
			</div>
			<br>
			<table style="width: 1000px; height: 200px; table-layout: fixed;">
				<tr>
					<th>작성일자</th>				
					<th>가게명</th>				
					<th>내용</th>
					<th></th>
				</tr>
				<c:forEach var="myReview" items="${myReviewList}">	
					<tr>
						<td>${myReview.review_update}</td>
						<td><b><a href="${pageContext.request.contextPath}/product/detail?com_id=${myReview.com_id}">${myReview.com_name}</a></b></td>
						<td>${myReview.review_content}</td>
						<td align="center">
						<button type="button" onclick="reviewEdit(${myReview.review_num}, ${myReview.com_id})">수정</button>
						<button type="button" id="my_delete" onclick="reviewDelete()">삭제</button>
						</td>
					</tr>
				</c:forEach>
		</div>
	</div>
	</main>
</body>
</html>
