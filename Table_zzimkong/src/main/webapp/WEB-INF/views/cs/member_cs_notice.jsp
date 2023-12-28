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
	function noticeViewForm() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/member/cs/notice/view','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
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
			     	 <h3>공지사항</h3>
		        </span>
		        <span>
		    	    <button type="button" id="buttonNotice" onclick="location.href='${pageContext.request.contextPath }/member/cs/notice'">공지사항</button>
					<button type="button" id="buttonFaq" onclick="location.href='${pageContext.request.contextPath }/member/cs/faq'">자주묻는 질문</button>	
					<button type="button" onclick="location.href='${pageContext.request.contextPath }/member/cs/qna'" id="buttonQna">1 : 1 문의</button>	
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
		
		  <!-- board list area -->
		    <div id="board-list">
		        <div class="container">
		            <table class="board-table">
		                <thead>
		                <tr>
		                    <th scope="col" class="th-num">번호</th>
		                    <th scope="col" class="th-title">제목</th>
		                    <th scope="col" class="th-date">등록일</th>
		                </tr>
		                </thead>
		                <tbody>
		                <tr>
		                    <td>3</td>
		                    <th class="cs_th">
		                      <a onclick="noticeViewForm()">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
		                      <p>테스트</p>
		                    </th>
		                    <td>2017.07.13</td>
		                </tr>
		
		                <tr>
		                    <td>2</td>
		                    <th class="cs_th"><a onclick="noticeViewForm()">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
		                    <td>2017.06.15</td>
		                </tr>
		
		                <tr>
		                    <td>1</td>
		                    <th class="cs_th"><a onclick="noticeViewForm()">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
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