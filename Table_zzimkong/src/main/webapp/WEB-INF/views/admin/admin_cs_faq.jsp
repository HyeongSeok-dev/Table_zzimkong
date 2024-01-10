<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/admin_cs.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ceo_top.css"> 
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	 	$('.sub_category_select').change(function() {
		    let cs_board_category_sub = $(this).val();
		    let cs_board_category_user = $('#cs_board_category_user').val();
		    let searchFAQ = $('#search').val();
		    let sdate = $('#sdate').val();
		    let edate = $('#edate').val();
		    
		    if(cs_board_category_user == ""){
		    	cs_board_category_user = 1;
		    }
		    $.ajax({
		        url: "../../sortBoardFaq", 
		        type: 'GET',
		        dataType: 'json',
		        data: { 
		        	"cs_board_category_user" : cs_board_category_user,
		            "cs_board_category_main" : '2',
		            "cs_board_category_sub" : cs_board_category_sub,
		            "searchFAQ" : searchFAQ,
		            "sdate" : sdate,
		            "edate" : edate
		        },
		        success: function(data) {
	                let tbody = $('#board-list tbody');
	                tbody.empty();
		        	if (data.boardList.length === 0){
			        	var newRow = "<td colspan='6'>검색결과가 없습니다.</td>"
		           		tbody.append(newRow);
			        	return;
		        	}
		        	for(let board of data.boardList) { 
		                switch (board.cs_board_category_user) {
		                case 1:
		                    categoryUser = '일반회원';
			                switch (board.cs_board_category_sub) {
				                case 1:
				                	categorySub = '예약';
				                    break;
				                case 2:
				                	categorySub = '주문/결제';
				                    break;
				                case 3:
				                	categorySub = '리뷰';
				                    break;
				                case 4:
				                	categorySub = '회원정보';
				                    break;
				                case 5:
				                	categorySub = '이용문의';
				                    break;
				                case 6:
				                	categorySub = '쿠폰/포인트';
				                    break;
		           			 }
	                    break;
		                case 2:
		                	categoryUser = '업주회원';
		                	switch (board.cs_board_category_sub) {
				                case 1:
				                	categorySub = '예약관리';
				                    break;
				                case 2:
				                	categorySub = '메뉴관리';
				                    break;
				                case 3:
				                	categorySub = '광고';
				                    break;
				                case 4:
				                	categorySub = '블랙회원관리';
				                    break;
				                case 5:
				                	categorySub = '업체관리';
				                    break;
		           			 }
	                    break;
           				 }
	                    var newRow = '<tr onclick="faqViewForm(' + board.cs_board_num + ')">' +
	                        '<td>' + board.cs_board_num + '</td>' +
	                        '<th class="cs_th">' + categoryUser + '</th>' +
	                        '<th class="cs_th">' + categorySub + '</th>' +
	                        '<th class="cs_th">' + board.cs_board_subject + '</th>' +
	                        '<td>' + board.cs_board_date + '</td>' +
	                        '</tr>';
	                    tbody.append(newRow);
		        	}
		        },
		        error: function(e) {
	                console.log("에러" +e)
		        }
		    });
		});
	 	
	 	$('#cs_board_category_user').change(function() {
		    let cs_board_category_user = $(this).val();
		    let searchFAQ = $('#search').val();
		    let sdate = $('#sdate').val();
		    let edate = $('#edate').val();
			console.log("버튼체인지됨");
			if (cs_board_category_user == '1') {
	            $('#cs_board_category_user_sub').show();
	            $('#cs_board_category_ceo_sub').hide();
	        } else if (cs_board_category_user == '2') {
	            $('#cs_board_category_ceo_sub').show();
	            $('#cs_board_category_user_sub').hide();
	        }
		    $.ajax({
		        url: "../../sortBoardNotice", 
		        type: 'GET',
		        dataType: 'json',
		        data: { 
		        	"cs_board_category_user" : cs_board_category_user,
		        	"cs_board_category_main" : '2',
		            "searchFAQ" : searchFAQ,
		            "sdate" : sdate,
		            "edate" : edate
		        },
		        success: function(data) {
	                let tbody = $('#board-list tbody');
	                tbody.empty();
		        	if (data.boardList.length === 0){
			        	var newRow = "<td colspan='6'>검색결과가 없습니다.</td>"
		           		tbody.append(newRow);
			        	return;
		        	}
		        	for(let board of data.boardList) { 

		                switch (board.cs_board_category_user) {
			                case 1:
			                    categoryUser = '일반회원';
				                switch (board.cs_board_category_sub) {
					                case 1:
					                	categorySub = '예약';
					                    break;
					                case 2:
					                	categorySub = '주문/결제';
					                    break;
					                case 3:
					                	categorySub = '리뷰';
					                    break;
					                case 4:
					                	categorySub = '회원정보';
					                    break;
					                case 5:
					                	categorySub = '이용문의';
					                    break;
					                case 6:
					                	categorySub = '쿠폰/포인트';
					                    break;
			           			 }
			                    break;
			                case 2:
			                	categoryUser = '업주회원';
			                	switch (board.cs_board_category_sub) {
					                case 1:
					                	categorySub = '예약관리';
					                    break;
					                case 2:
					                	categorySub = '메뉴관리';
					                    break;
					                case 3:
					                	categorySub = '광고';
					                    break;
					                case 4:
					                	categorySub = '블랙회원관리';
					                    break;
					                case 5:
					                	categorySub = '업체관리';
					                    break;
			           			 }
			                    break;
	           			 }
	                    var newRow = '<tr onclick="faqViewForm(' + board.cs_board_num + ')">' +
	                        '<td>' + board.cs_board_num + '</td>' +
	                        '<th class="cs_th">' + categoryUser + '</th>' +
	                        '<th class="cs_th">' + categorySub + '</th>' +
	                        '<th class="cs_th">' + board.cs_board_subject + '</th>' +
	                        '<td>' + board.cs_board_date + '</td>' +
	                        '</tr>';
	                    tbody.append(newRow);
		        	}
		        },
		        error: function() {
	                
		        }
		    });
		});
	 	
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>
	
	<section class="notice">
		<div class="text">
		
			<div class="header_div01"></div>
			<div class="page-title">
				<span class="container">
					<h3>고객센터 - 자주묻는 질문 관리</h3>
				</span>
				
				<span>
					<button type="button" id="buttonNotice" onclick="location.href='notice'">공지사항 관리</button>
					<button type="button" id="buttonFaq" onclick="location.href='faq'">자주 묻는 질문 관리</button>	
					<button type="button" id="buttonQna" onclick="location.href='qna'">1:1 문의 관리</button>	
				</span>
			</div>
		
			<!-- 검색창 -->
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<form action="">
							<div class="search_and_date">
								<span class="date_input_wrap" style="visibility: hidden;">
									<div class="datepicker dp1">
										<input type="date" maxlength="10" name="sdate" id="sdate" class="hasDatepicker" placeholder="">
									</div>
									<span>~</span>
									<div class="datepicker dp2">
										<input type="date" maxlength="10" name="edate" id="edate" class="hasDatepicker">
									</div>
								</span>
								
								<span class="search-wrap">
									<label for="search" class="blind">자주묻는 질문 검색</label>
									<input id="search" type="search" name="searchFAQ" placeholder="검색어를 입력해주세요." value="">
									<button type="submit" class="btn btn-dark">검색</button>
								</span>
								
								<button type="button" id="buttonRegister" onclick="faqRegisterForm()">새글작성</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<div id="board-list">
				<div class="container">
					<table class="board-table">
						<thead>
							<tr>
								<th scope="col" class="th-num">번호</th>
								<th scope="col" class="th-user" width="80">
									<select class="user_select" id="cs_board_category_user" style="border: none; background-color: rgb(244, 250, 255); font-weight: bold; text-align: center; font-size: 15px; color: #333;">
					            		<option value="" disabled>회원유형</option>
										<option value="1">일반회원</option>
										<option value="2">사업자회원</option>
					            	</select>
								</th>
							<th scope="col" class="th-category">
				            	<select class="sub_category_select" id="cs_board_category_user_sub" style="border: none; background-color: rgb(244, 250, 255); font-weight: bold; text-align: center; font-size: 15px; color: #333;">
				            		<option value="" disabled>유형선택</option>
				            		<option value="1">예약</option>
				            		<option value="2">주문/결제</option>
				            		<option value="3">리뷰</option>
				            		<option value="4">회원정보</option>
				            		<option value="5">이용문의</option>
				            		<option value="6">쿠폰/포인트</option>
				            	</select>
				            	<select class="sub_category_select" id="cs_board_category_ceo_sub" hidden="" style="border: none; background-color: rgb(244, 250, 255); font-weight: bold; text-align: center; font-size: 15px; color: #333;">
				            		<option value="" disabled>유형선택</option>
				            		<option value="1">예약관리</option>
				            		<option value="2">메뉴관리</option>
				            		<option value="3">광고</option>
				            		<option value="4">블랙회원관리</option>
				            		<option value="5">업체관리</option>
				            	</select>
				            </th>
								<th scope="col" class="th-title">제목</th>
								<th scope="col" class="th-date">등록일</th>
							</tr>
						</thead>
						<tbody>
							<%-- 아래로 자주묻는질문 목록 출력 --%>
							<c:forEach var="cs_faq" items="#{adminCsFaqList}">
								<tr>
									<td>${cs_faq.cs_board_num}</td>
									<%-- 노출회원 카테고리 구분 --%>
									<%-- 카테고리 소분류 --%>
									<c:if test="${cs_faq.cs_board_category_user eq 1}">
										<th class="cs_th">일반회원</th>
										<c:choose>
											<c:when test="${cs_faq.cs_board_category_sub eq 1}">
												<th class="cs_th">예약</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 2}">
												<th class="cs_th">주문/결제</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 3}">
												<th class="cs_th">리뷰</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 4}">
												<th class="cs_th">회원정보</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 5}">
												<th class="cs_th">이용문의</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 6}">
												<th class="cs_th">쿠폰/포인트</th>
											</c:when>
										</c:choose>
									</c:if>
									<c:if test="${cs_faq.cs_board_category_user eq 2}">
										<th class="cs_th">업주회원</th>
										<c:choose>
											<c:when test="${cs_faq.cs_board_category_sub eq 1}">
												<th class="cs_th">예약관리</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 2}">
												<th class="cs_th">메뉴관리</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 3}">
												<th class="cs_th">광고</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 4}">
												<th class="cs_th">블랙회원관리</th>
											</c:when>
											<c:when test="${cs_faq.cs_board_category_sub eq 5}">
												<th class="cs_th">업체관리</th>
											</c:when>
										</c:choose>
									</c:if>
									<th class="cs_th">
										<a onclick="faqViewForm('${cs_faq.cs_board_num}', '${cs_faq.cs_board_category_user}', '${pageContext.request.contextPath}')">${cs_faq.cs_board_subject}</a>
									</th>
									<td>${cs_faq.cs_board_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	
	<%-- 상단으로/bottom --%>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
		<jsp:include page="../inc/bottom_main.jsp"/>
	</footer>
</body>
</html>