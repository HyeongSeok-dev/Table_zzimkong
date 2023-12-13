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
					<th>방문일자</th>
					<th>가게명</th>				
					<th>내용</th>
					<th>수정/삭제</th>
				</tr>
				<tr>
					<td align="center">23/09/15 14:00</td>
					<td>현풍닭칼국수</td>
					<td>★★★★★<br>맛있어서 울면서 먹었어요</td>
					<td align="center">
					<button type="button">수정</button>
					<button type="reset" id="my_delete" >삭제</button>
					</td>
				</tr>
				<tr>
					<td align="center">23/09/24 19:30</td>
					<td>맛나주꾸미</td>
					<td>★★<br>음식은 맛있는데 청결하지 못한 매장</td>
					<td align="center">
					<button type="button">수정</button>
					<button type="reset" id="my_delete" >삭제</button>
					</td>
				</tr>
				<tr>
					<td align="center">23/12/05 12:30</td>
					<td>파전닭갈비</td>
					<td>★★★★★<br>존맛 대존맛</td>
					<td align="center">
					<button type="button">수정</button>
					<button type="reset" id="my_delete" >삭제</button>
					</td>
				</tr>
			</table>
			<div align="center">
			1 | 2 | 3 
			</div>
		</div>
	</div>
</body>
</html>
