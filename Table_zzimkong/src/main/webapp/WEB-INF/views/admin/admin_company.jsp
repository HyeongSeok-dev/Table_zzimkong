<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_company.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body id="body">
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>

	<section class="article">
		<div class="text">
		
			<%-- 검색창 --%>
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<form action="">
							<div class="search-wrap">
								<input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
								<button type="submit" class="btn btn-dark">
									<i class="material-icons search_icon">&#xe8b6;</i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="float_after"></div>
	        
			<h3>업체 관리</h3>
			
			<table border="1">
				<tr>
					<th>업체번호</th>
					<th>업체명</th>
					<th>업태</th>
					<th>전화번호</th>
					<th>영업시간</th>
					<th>시간당<br>최대 테이블</th>
					<th>건당<br>최대인원</th>
					<th>등록일자</th>
					<th>광고등급</th>
					<th>업체상태</th>
				</tr>
				<tr>
					<td onclick="company_info_open()"></td>
					<td onclick="업체페이지로">칸다소바</td>
					<td>일식</td>
					<td>051-430-1230</td>
					<td>09:00~23:30</td>
					<td>8개</td>
					<td>19명</td>
					<td>2023/12/25 05:12</td>
					<td>0단계</td>
					<td>
						<button type="button" class="button_olive" onclick="company_approve()">승인</button>
						<button type="button" class="button_cancel" onclick="company_disapprove()">거부</button>
					</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				
				
				<%-- 삭제 예정 --%>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<tr>
					<td onclick="company_info_open()">1</td>
					<td>아오모리</td>
					<td>일식</td>
					<td>051-720-8200</td>
					<td>11:00~21:30</td>
					<td>10개</td>
					<td>20명</td>
					<td>2023/12/24 11:17</td>
					<td>1단계</td>
					<td>정상</td>
				</tr>
				<%-- 삭제 예정 끝 --%>
				
			</table>			
		</div>
	</section>
	
	<%-- 상단으로/bottom --%>
	<footer>
		<jsp:include page="../inc/admin_topup.jsp"/>
	<%-- 	<jsp:include page="../inc/bottom_main.jsp"/> --%>
	</footer>
</body>
</html>