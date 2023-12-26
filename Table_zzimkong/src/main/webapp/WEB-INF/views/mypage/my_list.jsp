<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<!-- javascript -->
<script
	src="${pageContext.request.contextPath}/resources/js/mypage.js">
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
				<h1>나의 예약 내역</h1>
			</span>
			<span>
				<button type= "button" onclick="location.href='reservation'">더보기</button>
			</span>
			</div>
			<br>
			<table style="width: 1000px; height: 400px; table-layout: fixed;">
				<tr class ="subject">
					<th style="width:150px;">예약일자</th>
					<th>가게명</th>
					<th>주소</th>					
					<th style="width:50px;">인원</th>
					<th style="width:200px"">선주문유무</th>
					<th>예약상태</th>
					<th style="width:140px;">예약변경/취소</th>
				</tr>
				<tr>
					<td>23/09/15 14:00</td>
					<td>현풍닭칼국수</td>
					<td>서면</td>
					<td>3</td>
					<td>예약금 결제</td>
					<td>예약 완료</td>
					<td>
						<div class="div_button">
							<button type="button" id="my_delete" onclick="cancelReservation()">예약취소</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>23/09/24 19:30</td>
					<td>맛나주꾸미</td>
					<td>남포동</td>
					<td>4</td>
					<td>예약금 미결제</td>
					<td>예약 취소</td>
					<td>
						<div class="div_button">
<!-- 							<button type="button">변경</button> -->
							<button type="button" id="my_delete" onclick="cancelReservation()">예약취소</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>23/12/05 12:30</td>
					<td>파전닭갈비</td>
					<td>양정</td>
					<td>4</td>
					<td>예약금 결제/ 메뉴 결제</td>
					<td>예약 완료</td>
					<td>
						<div class="div_button">
<!-- 							<button type="button">변경</button> -->
							<button type="button" id="my_delete" onclick="cancelReservation()">예약취소</button>
						</div>
					</td>
				</tr>
				
			</table>
			<br>
			<div class ="title">
			<span class= "mypg">
				<h1>나의 북마크</h1>
			</span>			
			<span>
				<button type= "button" onclick="location.href='bookmark'">더보기</button>
			</span>
			</div>
			<br>
			<div class="bookmark_image">
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image1.jpg" >
					</a>
				<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						83해치
				</div>
				</div>			
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image2.jpg" >
					</a>
				<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						이재모피자 부산역점
				</div>	
				</div>	
				<div>
					<a href="${pageContext.request.contextPath}/product/detail">
						<img class="image_size" src="${pageContext.request.contextPath}/resources/img/mylist_image3.jpg" >
					</a>
					<div id="likeButton" class="like_button">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
				        <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
				    </svg>
						아덴블랑제리 부전점
				</div>
				</div>	
			</div>		
			<br>
			<br>
			<div class ="title">
			<span class= "mypg">
				<h1>최근 본 매장</h1>
			</span>
			<br>
			</div>			
			<br>
			<div class="wrapper2">
		      <i id="left" class="fa-solid fa-angle-left"></i>
		      <div class="carousel">
		      	<a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image4.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image5.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image6.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image7.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image8.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		            <img src="${pageContext.request.contextPath}/resources/img/mylist_image9.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image10.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image1.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image2.jpg" alt="img" draggable="false">
		        </a>
		        <a href="${pageContext.request.contextPath}/product/detail">
		        	<img src="${pageContext.request.contextPath}/resources/img/mylist_image3.jpg" alt="img" draggable="false">
		      	</a>
		      </div>
		      <i id="right" class="fa-solid fa-angle-right"></i>
		    </div>
		</div>
	</div>
	</main>
</body>
</html>