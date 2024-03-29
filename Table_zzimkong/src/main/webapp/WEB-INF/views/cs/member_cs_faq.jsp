<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath }/resources/css/global.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/member_cs.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/ceo_top.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function faqViewForm(board_num) {
	/* 팝업창 중앙 정렬 */
	var popupW = 950;
	var popupH = 700;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open('${pageContext.request.contextPath }/member/cs/faq/view?cs_board_num=' + board_num,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}
$(document).ready(function() {
	$('#cs_board_category_sub').change(function() {
	    let cs_board_category_sub = $(this).val();
	    let searchFAQ = $('#search').val();
		console.log("버튼체인지됨");
	    $.ajax({
	        url: "../../sortBoardFaq", 
	        type: 'GET',
	        dataType: 'json',
	        data: { 
	        	"cs_board_category_user" : '1',
	            "cs_board_category_main" : '2',
	            "cs_board_category_sub" : cs_board_category_sub,
	            "searchFAQ" : searchFAQ
	        },
	        success: function(data) {
                let tbody = $('#board-list tbody');
                tbody.empty();
	        	if (data.boardList.length === 0){
		        	var newRow = "<td colspan='4'>검색결과가 없습니다.</td>"
	           		tbody.append(newRow);
		        	return;
	        	}
	        	for(let board of data.boardList) { 

	                switch (board.cs_board_category_sub) {
		                case 1:
		                    categoryText = '예약';
		                    break;
		                case 2:
		                    categoryText = '주문/결제';
		                    break;
		                case 3:
		                    categoryText = '리뷰';
		                    break;
		                case 4:
		                    categoryText = '회원정보';
		                    break;
		                case 5:
		                    categoryText = '이용문의';
		                    break;
		                case 6:
		                    categoryText = '쿠폰/포인트';
		                    break;
           			 }
	                let orderNumber = 1;
                    var newRow = '<tr onclick="faqViewForm(' + board.cs_board_num + ')">' +
                        '<td>' + orderNumber++ + '</td>' +
                        '<th class="cs_th">' + categoryText + '</th>' +
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
		<jsp:include page="../inc/top2.jsp"></jsp:include>
	</header>
	<section class="notice">
		<div class="text">
			<h3>고객센터</h3>
			<div class="page-title">
				<span class="container">
					<h3>자주묻는 질문</h3>
				</span> <span>
					<button type="button" id="buttonNotice"
						onclick="location.href='${pageContext.request.contextPath }/member/cs/notice'">공지사항</button>
					<button type="button" id="buttonFaq"
						onclick="location.href='${pageContext.request.contextPath }/member/cs/faq'">자주묻는
						질문</button>
					<button type="button" id="buttonQna"
						onclick="location.href='${pageContext.request.contextPath }/member/cs/qna'">1
						: 1 문의</button>
				</span>
			</div>

			<!-- board seach area -->
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<form action="">
							<div class="search_and_date">
								<span class="date_input_wrap"></span> <span class="search-wrap">
									<label for="search" class="blind">공지사항 내용 검색</label> <input
									id="search" type="search" name="searchFAQ"
									placeholder="검색어를 입력해주세요." value="">
									<button type="submit" class="btn btn-dark">검색</button>
								</span> <span></span>
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
								<th scope="col" class="th-num">
								<select name="category"	id="cs_board_category_sub"
									style="border: none; background-color: rgb(244, 250, 255); font-weight: bold; text-align: center; font-size: 15px; color: #333;">
										<option value="" disabled>유형선택</option>
										<option value="1">예약</option>
										<option value="2">주문/결제</option>
										<option value="3">리뷰</option>
										<option value="4">회원정보</option>
										<option value="5">이용문의</option>
										<option value="6">쿠폰/포인트</option>
								</select></th>
								<th scope="col" class="th-title">제목</th>
								<th scope="col" class="th-date">등록일</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="board" items="${boardList}" varStatus="status">
								<tr onclick="faqViewForm(${board.cs_board_num})">
									<td>${status.index + 1}</td>
									<c:choose>
										<c:when test="${board.cs_board_category_sub eq '1'}">
											<th class="cs_th">예약</th>
										</c:when>
										<c:when test="${board.cs_board_category_sub eq '2'}">
											<th class="cs_th">주문/결제</th>
										</c:when>
										<c:when test="${board.cs_board_category_sub eq '3'}">
											<th class="cs_th">리뷰</th>
										</c:when>
										<c:when test="${board.cs_board_category_sub eq '4'}">
											<th class="cs_th">회원정보</th>
										</c:when>
										<c:when test="${board.cs_board_category_sub eq '5'}">
											<th class="cs_th">이용문의</th>
										</c:when>
										<c:when test="${board.cs_board_category_sub eq '6'}">
											<th class="cs_th">쿠폰/포인트</th>
										</c:when>
									</c:choose>
									<th class="cs_th">${board.cs_board_subject}</th>
									<td>${board.cs_board_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>