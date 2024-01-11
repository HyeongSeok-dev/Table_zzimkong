<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<!-- jQuery, javascript -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage2.js"></script>
<script type="text/javascript">
	function writeReview(com_id, res_idx) {
		location.href = "${pageContext.request.contextPath}/review/write?com_id=" + com_id + "&res_idx=" + res_idx;
	}
</script>
</head>
<body>
	<%-- 페이지네이션 - pageNum 파라미터 가져와서 저장(없을 경우 기본값 1로 설정) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>
	<header>
		<jsp:include page="../inc/top2.jsp"/>
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
				<button type="button">6개월</button>
				<button type="button">3개월</button>
				<button type="button">1개월</button>
				<input type="date" id="date1">
				-
				<input type="date" id="date2">
				<button type="button" onclick="showDate()">조회</button>
				<p id="selectedDate"></p>
			</span>
			</div>
			<br>
			<table style="width: 1000px; height: 100px; table-layout: fixed;">
				<tr class ="subject">
					<th>예약번호</th>
					<th>가게명</th>
					<th style="width: 50px">방문자명</th>					
					<th style="width: 25px">인원</th>
					<th>선주문메뉴</th>
					<th>방문예정일</th>
					<th style="width: 50px">예약상태</th>
					<th style="width: 50px">결제상태</th>
					<th style="width: 100px"></th>
				</tr>
				<%-- 예약 목록 출력 --%>
				<c:forEach var="res2" items="${resList2}">
				  <tr>
						<td>${res2.res_idx }</td>
						<td style="height: 45px;"><b><a href="${pageContext.request.contextPath}/product/detail?com_id=${res2.com_id}">${res2.com_name }</a></b></td>
						<td>${res2.res_name }</td>
						<td>${res2.res_person }</td>
						<td>${res2.ordered_menus }</td>
						<td>${res2.res_date } ${res2.res_time}</td>
					<c:choose>
						<c:when test="${res2.res_status eq 1}">
							<td style="color: #3FAFFC;">예약완료</td>
						</c:when>
						<c:when test="${res2.res_status eq 2}">
							<td style="color: red;">예약취소</td>
						</c:when>
						<c:when test="${res2.res_status eq 3}">
							<td style="color: green;">방문완료</td>
						</c:when>
						<c:otherwise>
							<td> - </td>
						</c:otherwise>
					</c:choose>
					<c:choose>
					    <c:when test="${res2.res_status eq 2}">
					        <td style="color: red; text-decoration: line-through;">결제취소</td>
					    </c:when>
					    <c:when test="${res2.res_pay_status eq 1}">
					        <td style="color: blue;">결제</td>
					    </c:when>
					    <c:otherwise>
					        <td>미결제</td>
					    </c:otherwise>
					</c:choose>
	                <td>
					<c:choose>
						<c:when test="${res2.res_status eq 1}">
							<button type="submit" id="my_delete" onclick="cancelReservation(${res2.res_idx})">예약취소</button>
						</c:when>
						<c:when test="${res2.res_status eq 3}">
							<c:choose>
								<c:when test="${res2.hasReview}">
									리뷰 작성완료
								</c:when>
								<c:otherwise>
									<button type="submit" id="write_review" onclick="writeReview(${res2.com_id},${res2.res_idx})">리뷰쓰기</button>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>

	                 </td>
				  </tr>
				</c:forEach>
			</table>
	<section id="pageList">
		<%-- [이전] 버튼 클릭 시 BoardList.bo 서블릿 요청(파라미터 : 현재 페이지번호 - 1) --%>
		<%-- 단, 현재 페이지 번호(pageNum) 가 1보다 클 경우에만 동작(아니면 비활성화 처리) --%>
		<input type="button" value="이전" 
				onclick="location.href = 'reservation?pageNum=${pageNum - 1}'"
				<c:if test="${pageNum <= 1 }">disabled</c:if>
		>	
	
		<%-- 현재 페이지 번호가 저장된 pageInfo 객체를 통해 페이지 번호 출력 --%>
		<%-- 시작페이지(startPage) 부터 끝페이지(endPage) 까지 표시 --%>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<%-- 각 페이지마다 하이퍼링크 설정(페이지번호를 pageNum 파라미터로 전달) --%>
			<%-- 단, 현재 페이지는 하이퍼링크 제거하고 굵게 표시 --%>
			<c:choose>
				<%-- 현재 페이지번호와 표시될 페이지번호가 같을 경우 판별 --%>
				<c:when test="${pageNum eq i}">
					<b>${i}</b> <%-- 현재 페이지 번호 --%>
				</c:when>
				<c:otherwise>
					<a href="reservation?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<%-- [다음] 버튼 클릭 시 BoardList.bo 서블릿 요청(파라미터 : 현재 페이지번호 + 1) --%>
		<%-- 단, 현재 페이지 번호(pageNum) 가 최대 페이지번호 보다 작을 경우에만 동작(아니면 비활성화 처리) --%>
		<input type="button" value="다음" 
			onclick="location.href = 'reservation?pageNum=${pageNum + 1}'"
			<c:if test="${pageNum >= pageInfo.maxPage }">disabled</c:if>
		>	
	</section>
		</div>
	</div>
	
	
	
	</main>
			

</body>
</html>