<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_cs.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#cs_board_category_user').change(function() {
		    let cs_board_category_user = $(this).val();
		    let searchFAQ = $('#search').val();
		    let sdate = $('#sdate').val();
		    let edate = $('#edate').val();
			console.log("버튼체인지됨");
		    $.ajax({
		        url: "../../sortBoardNotice", 
		        type: 'GET',
		        dataType: 'json',
		        data: { 
		        	"cs_board_category_user" : cs_board_category_user,
		        	"cs_board_category_main" : '1',
		            "searchFAQ" : searchFAQ,
		            "sdate" : sdate,
		            "edate" : edate
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

		                switch (board.cs_board_category_user) {
			                case 1:
			                    categoryText = '일반회원';
			                    break;
			                case 2:
			                    categoryText = '업주회원';
			                    break;
	           			 }
	                    var newRow = '<tr onclick="faqViewForm(' + board.cs_board_num + ')">' +
	                        '<td>' + board.cs_board_num + '</td>' +
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
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>
	
	<section class="notice">
		<div class="text">
		
			<div class="header_div01"></div>
			<div class="page-title">
				<span class="container">
					<h3>고객센터 - 공지사항 관리</h3>
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
								<span class="date_input_wrap">
									<div class="datepicker dp1">
										<input type="date" maxlength="10" name="sdate" id="sdate" class="hasDatepicker" placeholder="">
									</div>
									<span>~</span>
									<div class="datepicker dp2">
										<input type="date" maxlength="10" name="edate" id="edate" class="hasDatepicker">
									</div>
								</span>
								
								<span class="search-wrap">
									<label for="search" class="blind">공지사항 내용 검색</label>
									<input id="search" type="search" name="searchFAQ" placeholder="검색어를 입력해주세요." value="">
									<button type="submit" class="btn btn-dark">검색</button>
								</span>
								
								<button type="button" id="buttonRegister" onclick="noticeRegisterForm()">새글작성</button>
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
								<th scope="col" class="th-num" rowspan="2">번호</th>
								<%-- 카테고리 필터 : 고객센터(공지사항) --%>
								<th scope="col" class="th-category">
									<select class="user_select" id= "cs_board_category_user" style="border: none; background-color: rgb(244, 250, 255); font-weight: bold; text-align: center; font-size: 15px; color: #333;">
										<option>회원유형</option>
										<option value="1">일반회원</option>
										<option value="2">사업자회원</option>
									</select>
								</th>
								<th scope="col" class="th-title" rowspan="2">제목</th>
								<th scope="col" class="th-date" rowspan="2">등록일</th>
							</tr>
						</thead>
						<tbody>
							<%-- 아래로 공지사항 목록 출력 --%>
							<c:forEach var="cs_notice" items="${adminCsNoticeList}">
								<tr onclick="noticeViewForm('${cs_notice.cs_board_num}', '${cs_notice.cs_board_category_user}', '${pageContext.request.contextPath}')">
									<td>${cs_notice.cs_board_num}</td>
									<%-- 노출회원 카테고리 구분 --%>
									<c:choose>
										<c:when test="${cs_notice.cs_board_category_user eq 1}">
											<th class="cs_th">일반회원</th>
										</c:when>
										<c:when test="${cs_notice.cs_board_category_user eq 2}">
											<th class="cs_th">업주회원</th>
										</c:when>
										<c:when test="${cs_notice.cs_board_category_user eq 3}">
											<th class="cs_th">전체회원</th>
										</c:when>
										<c:otherwise>
											<th class="cs_th" style="color:red;">알수없음</th>
										</c:otherwise>
									</c:choose>
									<%-- 카테고리 소분류 --%>
									<th class="cs_th">
											<c:choose>
												<c:when test="${cs_notice.cs_board_category_sub eq 1}">
													[알림] 
												</c:when>
												<c:when test="${cs_notice.cs_board_category_sub eq 2}">
													[이벤트] 
												</c:when> 
												<c:otherwise>
													[기타]
												</c:otherwise>
											</c:choose>
											${cs_notice.cs_board_subject}
									</th>
									<td>${cs_notice.cs_board_date}</td>
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