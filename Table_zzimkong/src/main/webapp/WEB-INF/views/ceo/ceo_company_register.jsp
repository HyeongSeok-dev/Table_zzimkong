<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ceo_company.js"></script>
<script type="text/javascript">
$(function () {
	$('#keyword').keyup(function() {
        var inputVal = $(this).val();
        if(inputVal && !inputVal.startsWith('#')) {
            $(this).val('#' + inputVal);
        }
    });
});
</script>
</head>
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>신규 입점 신청</h3></span>
			</div>
		</div>
		<div class="text_inner">
			<form action="" method="post" name="ceoComForm">
				<table>
					<tr>
						<th>사업자등록번호</th>
						<td colspan="5">
							<div>
								<input type="search" name="comNum" placeholder="사업자등록번호를 입력해 주세요." id="comNumText">
								<button type="submit" class="button_olive">번호찾기</button>
							</div>	
						</td>
					</tr>
					<tr>
						<th>상호명</th>
						<td colspan="2"><input type="text" name="com_name" value="" readonly="readonly"></td>
						<th>대표자명</th>
						<td colspan="2"><input type="text" name="user_name" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<th>업태</th>
						<td colspan="2"><input type="text" name=com_category value="" readonly="readonly"></td>
						<th>전화번호</th>
						<td colspan="2"><input type="text" name="com_tel" value=""></td>
					</tr>
					<tr>
					</tr>	
					<tr>
						<th>주소</th>
						<td colspan="5">
						<input type="text" name="com_address" maxlength="5" size="50" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<th>영업 시작시간</th>
						<td colspan="2">
							<select class="hour" name="openHour" id="openHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <c:forEach var="i" begin="0" end="23">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
							:
							<select class="minute" name="openMin" id="openMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
								<c:forEach var="i" begin="0" end="59">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
						</td>
						<th>영업 종료시간</th>
						<td colspan="2">
							<select class="hour" name="closeHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <c:forEach var="i" begin="0" end="23">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
							:
							<select class="minute" name="closeMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
								<c:forEach var="i" begin="0" end="59">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
						</td>
					</tr>	
					<tr>
						<th>브레이크타임 시작시간</th>
						<td colspan="2">
							<select class="hour" name="openHour" id="openHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <c:forEach var="i" begin="0" end="23">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
							:
							<select class="minute" name="openMin" id="openMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
								<c:forEach var="i" begin="0" end="59">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
						</td>
						<th>브레이크타임 종료시간</th>
						<td colspan="2">
							<select class="hour" name="closeHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <c:forEach var="i" begin="0" end="23">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
							:
							<select class="minute" name="closeMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
								<c:forEach var="i" begin="0" end="59">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
						</td>
					</tr>	
					<tr>
						<th>시간당 최대 인원</th>
						<td colspan="2" style="font-size: 18px;"><input name="perHourMaxPerson" id="hMax" type="text" value=""> &nbsp;명</td>
						<th>광고신청</th>
						<td colspan="2">
							<select name="adRegister" id="adRegister">
								<option name="application" value="신청">신청</option>
								<option name="unapplied" value="미신청">미신청</option>
							</select>
							-
							<select name="adLevel" id="adLevel">
								<option value="0단계">0단계</option>
								<option value="1단계">1단계</option>
								<option value="2단계">2단계</option>
								<option value="3단계">3단계</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리분류</th>
						<td colspan="4" style="font-size: 18px;">
							<input type="checkbox" value="데이트" name="">데이트 
							<input type="checkbox" value="가족모임" name="">가족모임 
							<input type="checkbox" value="단체회식" name="">단체회식 
							<input type="checkbox" value="조용한" name="">조용한 
							<input type="checkbox" value="주차가능" name="">주차가능 
							<input type="checkbox" value="노키즈존" name="">노키즈존 
							<br>
							<input type="checkbox" value="장애인편의시설" name="">장애인편의시설 
							<input type="checkbox" value="반려동물" name="">반려동물 동반 
							<input type="checkbox" value="홀" name="">홀 
							<input type="checkbox" value="룸" name="">룸 
							<input type="checkbox" value="테라스" name="">테라스 
							<input type="checkbox" value="창가자리" name="">창가자리 
						</td>
					</tr>
					<tr>
						<th>키워드</th>
						<td><input type="text" id="keyword" value="" placeholder="사업장이 검색될 키워드를 입력해주세요"></td>
					</tr>
				</table>
				<br><br>
			<button type="submit" class="button_olive">신청</button>
			<button type="reset" class="button_grey2">초기화</button>
			</form>
		</div>	
	</section>
</body>
</html>