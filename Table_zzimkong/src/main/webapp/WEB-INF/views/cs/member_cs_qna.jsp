<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath }/resources/css/member_cs.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ceo_top.css"> 
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
 <script type="text/javascript">
 	function popupResister() {
 		
 		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/member/cs/qna/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
 	
 	function qnaViewForm(board_num) {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/member/cs/qna/view?cs_board_num=' + board_num,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
 	$('#cs_board_category_sub').change(function() {
	    var cs_board_category_sub = $(this).val();
	    var searchFAQ = $('#search').val();
	    var sdate = $('#sdate').val();
	    var edate = $('#edate').val();
		console.log("버튼체인지됨");
	    $.ajax({
	        url: "sortBoardQna", 
	        type: 'GET',
	        dataType: 'json',
	        data: { 
	        	"cs_board_category_user" : '1',
	            "cs_board_category_main" : '2',
	            "cs_board_category_sub" : cs_board_category_sub,
	            "searchFAQ" : searchFAQ
	            "sdate" : sdate
	            "edate" : edate
	        },
	        success: function(response) {
	        	
	        },
	        error: function(xhr, textStatus, errorThrown) {
	            console.log('에러 발생: ' + errorThrown);
	        }
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
		            <h3>1 : 1 문의</h3>
		        </span>
		        <span>
					<button type="button" id="buttonNotice" onclick="location.href='${pageContext.request.contextPath }/member/cs/notice'">공지사항</button>	
					<button type="button" id="buttonFaq" onclick="location.href='${pageContext.request.contextPath }/member/cs/faq'">자주묻는 질문</button>	
					<button type="button" id="buttonQna" onclick="location.href='${pageContext.request.contextPath }/member/cs/qna'">1 : 1 문의</button>
		    	</span>
		    </div>
		
		    <!-- board seach area -->
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
			                    <button type="button" id="buttonRegister" onclick="popupResister()">문의하기</button>
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
				            <th scope="col" class="th-category">
				            	<select name="category" id="cs_board_category_sub" style="border: none; background-color: rgb(244, 250, 255); font-weight: bold; text-align: center; font-size: 15px; color: #333;">
				            		<option value="">유형선택</option>
				            		<option value="1">예약</option>
				            		<option value="2">주문/결제</option>
				            		<option value="3">리뷰</option>
				            		<option value="4">회원정보</option>
				            		<option value="5">이용문의</option>
				            		<option value="6">쿠폰/포인트</option>
				            	</select>
				            </th>
				            <th scope="col" class="th-title">제목</th>
				            <th scope="col" class="th-date">등록일</th>
				        </tr>
				        </thead>
				        <tbody>
				        <c:forEach var="board" items="${boardList}">
				                <tr onclick="qnaViewForm(${board.cs_board_num})">
				                    <td>${board.cs_board_num}</td>
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
				                    <th class="cs_th">
				                          <c:if test="${board.cs_board_re_lev > 0}">
											<c:forEach begin="1" end="${board.cs_board_re_lev}">
												&nbsp;&nbsp;							
											</c:forEach>
											<img src="${pageContext.request.contextPath }/resources/img/reply-icon.png" style="width: 20px; height: 20px;">
										</c:if>
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
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer> 
</body>
</html>