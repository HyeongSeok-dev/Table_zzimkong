<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath }/resources/css/ceo_cs.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ceo_top.css"> 
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function faqViewForm(board_num) {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/ceo/cs/faq/view?cs_board_num=' + board_num,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
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
		        	"cs_board_category_user" : '2',
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
			                    categoryText = '예약관리';
			                    break;
			                case 2:
			                    categoryText = '메뉴관리';
			                    break;
			                case 3:
			                    categoryText = '광고';
			                    break;
			                case 4:
			                    categoryText = '블랙회원관리';
			                    break;
			                case 5:
			                    categoryText = '업체관리';
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
	/* 마우스 오버시 한줄 색변경*/
// 	$(document).ready(function() {
//   $("#hover td, #hover th").hover(function() {
//     var index = $(this).index();
//     $("#hover tr").each(function() {
//       $(this).find('td').eq(index).addClass('highlight');
//       $(this).find('th').eq(index).addClass('highlight');
//     });
//   }, function() {
//     var index = $(this).index();
//     $("#hover tr").each(function() {
//       $(this).find('td').eq(index).removeClass('highlight');
//       $(this).find('th').eq(index).removeClass('highlight');
//     });
//   });
// });

</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/ceo_top.jsp"/>
	</header>
	<section class="notice">
	  <div class="text">
		  	<div class="header_div01">
		        <span><h1>사업자 고객센터</h1></span>
	   		</div>
		  	<div class="page-title">
		        <span class="container">
		            <h3>자주묻는 질문</h3>
		        </span>
		        <span>
					<button type="button" id="buttonNotice" onclick="location.href='${pageContext.request.contextPath }/ceo/cs/notice'">공지사항</button>
					<button type="button" id="buttonFaq" onclick="location.href='${pageContext.request.contextPath }/ceo/cs/faq'">자주묻는 질문</button>	
					<button type="button" id="buttonQna" onclick="location.href='${pageContext.request.contextPath }/ceo/cs/qna'">1 : 1문의</button>	
		    	</span>
	   		</div>
		
		    <!-- board seach area -->
		    <div id="board-search">
		        <div class="container">
		            <div class="search-window">
		                <form action="" name="ceoCsSearch">
			                <div class="search_and_date">
				       	        <span class="date_input_wrap"></span>
			                    <div class="search-wrap">
			                        <label for="search" class="blind">자주묻는 질문 검색</label>
			                        <input id="search" type="search" name="searchFAQ" placeholder="검색어를 입력해주세요.">
			                        <button type="submit" class="btn btn-dark">검색</button>
			                    </div>
		                   		<span></span>
		                   </div> 
		                </form>
		            </div>
		        </div>
		    </div>
		
		   <div id="board-list">
		   		<div class="text_inner">
				    <table class="board-table">
				        <thead>
				        <tr>
				            <th scope="col" class="th-num">번호</th>
				            <th scope="col" class="th-category">
				            	<select name="ceoCategory" id="cs_board_category_sub" style="border: none; background-color: rgb(244, 250, 255); font-weight: bold; text-align: center; font-size: 15px; color: #333;">
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
					        <c:forEach var="board" items="${boardList}">
				                <tr onclick="faqViewForm(${board.cs_board_num})">
				                    <td>${board.cs_board_num}</td>
				                    <c:choose>
				                    	<c:when test="${board.cs_board_category_sub eq '1'}">
						                    <th class="cs_th">예약관리</th>
				                    	</c:when>
				                    	<c:when test="${board.cs_board_category_sub eq '2'}">
						                    <th class="cs_th">메뉴관리</th>
				                    	</c:when>
				                    	<c:when test="${board.cs_board_category_sub eq '3'}">
						                    <th class="cs_th">광고</th>
				                    	</c:when>
				                    	<c:when test="${board.cs_board_category_sub eq '4'}">
						                    <th class="cs_th">블랙회원관리</th>
				                    	</c:when>
				                    	<c:when test="${board.cs_board_category_sub eq '5'}">
						                    <th class="cs_th">업체관리</th>
				                    	</c:when>
				                    </c:choose>
				                    <th class="cs_th">
				                        ${board.cs_board_subject}
				                    </th>
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
		<jsp:include page="../inc/topup.jsp"/>
	</footer>
<!-- 	<footer> -->
<%-- 		<jsp:include page="bottom.jsp"></jsp:include> --%>
<!-- 	</footer> -->
</body>
</html>