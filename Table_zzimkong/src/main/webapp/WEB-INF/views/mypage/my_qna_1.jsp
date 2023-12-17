<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../inc/my_sidebar.jsp"/>
	<div class="wrapper">
		<div>
			<div class ="title">
			<span class= "mypg">
				<h1>1:1 문의</h1>
			</span>
			<span>
				<input type="date">
				-
				<input type="date">
				<button type="button" onclick="showDate()">조회</button>
				<p id="selectedDate"></p>
			</span>
			</div>
			<br>
			<table style="width: 1000px; height: 100px; table-layout: fixed;">
				<tr>
					<th style="width: 500px;">제목</th>
					<th style="width: 300px;">작성일</th>				
					<th style="width: 200px;">처리 상태</th>
				</tr>
				<tr>
					<td>포인트 사용 문의</td>
					<td>23/09/15 14:00</td>
					<td>답변 완료</td>
				</tr>
			</table>
			<div class="click_button">
			<button type="button" onclick="location.href='${pageContext.request.contextPath }/member/cs/qna/register'">1:1 문의하기</button>
			</div>
		</div>
	</div>
</body>
</html>