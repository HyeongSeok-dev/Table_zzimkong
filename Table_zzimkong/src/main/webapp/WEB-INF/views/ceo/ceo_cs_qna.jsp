<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath }/resources/css/ceo_cs.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ceo_top.css"> 

</head>
<body>
	<header>
		<jsp:include page="../inc/ceo_top.jsp"/>
	</header>
	<section class="notice">
	  <div class="text">
		  <div class="page-title">
		        <span class="container">
		            <h3>고객센터 - 1 : 1 문의</h3>
		        </span>
		        <span>
					<button type="button" id="buttonNotice" onclick="location.href='${pageContext.request.contextPath }/ceo/cs/notice'">공지사항</button>	
					<button type="button" id="buttonFnq" onclick="location.href='${pageContext.request.contextPath }/ceo/cs/fnq'">자주묻는 질문</button>	
					<button type="button" id="buttonRegister" onclick="location.href='${pageContext.request.contextPath }/ceo/cs/qna/register'">문의하기</button>	
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
			                        <input id="search" type="search" name="searchNotice" placeholder="검색어를 입력해주세요." value="">
			                        <button type="submit" class="btn btn-dark">검색</button>
			                    </span>
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
				            <th scope="col" class="th-category">유형</th>
				            <th scope="col" class="th-title">제목</th>
				            <th scope="col" class="th-date">등록일</th>
				        </tr>
				        </thead>
				        <tbody>
				        <tr>
				            <td>3</td>
				            <th class="cs_th">블랙리스트</th>
				            <th class="cs_th">
				              <a href="#!">문의문의</a>
				              <p>테스트</p>
				            </th>
				            <td>2017.07.13</td>
				        </tr>
				
				        <tr>
				            <td>2</td>
				            <th class="cs_th">블랙리스트</th>
				            <th class="cs_th"><a href="#!">문의문의</a></th>
				            <td>2017.06.15</td>
				        </tr>
				
				        <tr>
				            <td>1</td>
				            <th class="cs_th">블랙리스트</th>
				            <th class="cs_th"><a href="#!">문의문의</a></th>
				            <td>2017.06.15</td>
				        </tr>
				        </tbody>
				    </table>
				</div>
		   </div> 
		</div>
	</section>
<!-- 	<footer> -->
<%-- 		<jsp:include page="bottom.jsp"></jsp:include> --%>
<!-- 	</footer> -->
</body>
</html>