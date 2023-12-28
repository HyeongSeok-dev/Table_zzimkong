<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath }/resources/css/member_cs.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ceo_top.css"> 
<script type="text/javascript">
	function faqViewForm() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/member/cs/faq/view','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
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
			                	<span class="date_input_wrap"></span>
			                    <span class="search-wrap">
			                        <label for="search" class="blind">공지사항 내용 검색</label>
			                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
			                        <button type="submit" class="btn btn-dark">검색</button>
			                    </span>
			                    <span></span>
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
				            	<select name="memberCategory" style="border: none; background-color: rgb(244, 250, 255); font-weight: bold; text-align: center; font-size: 15px; color: #333;">
				            		<option value="">유형선택</option>
				            		<option value="예약">예약</option>
									<option value="주문/결제">주문/결제</option>
									<option value="리뷰">리뷰</option>
									<option value="회원정보">회원정보</option>
									<option value="이용문의">이용문의</option>
									<option value="쿠폰/포인트">쿠폰/포인트</option>
				            	</select>
				            </th>
				            <th scope="col" class="th-title">제목</th>
				            <th scope="col" class="th-date">등록일</th>
				        </tr>
				        </thead>
				        
				        <tbody>
				        <tr>
				            <td>3</td>
				            <th class="cs_th">
				              	업체관리
				            </th>
				            <th class="cs_th">
				              <a onclick="faqViewForm()">문의문의</a>
				              <p>테스트</p>
				            </th>
				            <td>2017.07.13</td>
				        </tr>
				
				        <tr>
				            <td>2</td>
				            <th class="cs_th">예약관리</th>
				            <th class="cs_th"><a onclick="faqViewForm()">문의문의</a></th>
				            <td>2017.06.15</td>
				        </tr>
				
				        <tr>
				            <td>1</td>
				            <th class="cs_th">광고</th>
				            <th class="cs_th"><a onclick="faqViewForm()">문의문의</a></th>
				            <td>2017.06.15</td>
				        </tr>
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