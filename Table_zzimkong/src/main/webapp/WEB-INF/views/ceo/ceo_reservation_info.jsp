<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 글로벌 css --%>
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<%-- 사이드바 css --%>
<!-- <link href="side_bar.css" rel="stylesheet"> -->
</head>
<body>
<input type="hidden" name="res_idx" value="${res.res_idx}" />
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>예약 상세 정보</h3></span>
			</div>
		</div>
		<div class="text_inner">
<!-- 			<h3>예약자</h3> -->
			<table border="1">
				<tr>
					<th>예약번호</th>
					<th>방문자성명</th>
					<th colspan="2">연락처</th>
				</tr>
				<tr>
					<td>${res.res_num}</td>
					<td>${res.res_name}</td>
					<td colspan="2">${res.res_phone}</td>
				</tr>
				<tr>
					<th>예약금</th>
					<th>선주문가격</th>
					<th>총결제금액</th>
					<th>예약인원</th>
				</tr>
				<tr>
					<td>${res.res_table_price}원</td>
					<td>${menuTotalPrice}원</td>
					<td>${totalPrice}원</td>
					<td>${res.res_person}명</td>
				</tr>
				
				<tr>
					<th colspan="2">메뉴</th>
					<th colspan="2">수량</th>
				</tr>
				    <c:forEach items="${preInfo}" var="preOrder">
				       <tr>
				           <td colspan="2">${preOrder.menu_name}</td>
				           <td colspan="2">${preOrder.pre_num}개</td>
				       </tr>
				   </c:forEach>
			     <tr>
			       	 <th>요구사항</th>
        			 <td colspan="3">${res.res_request}</td>
   			  	 </tr> 
			</table>
			<br>
			<button type="button" class="button_olive" onclick="javascript:window.close()">닫기</button>
		</div>
	</section>	

</body>
</html>