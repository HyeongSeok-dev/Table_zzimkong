<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업장 신규 등록</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ceo_company_register.js"></script>
</head>
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>신규 입점 신청</h3></span>
			</div>
		</div>
		<div class="guide_top" >* 는사업자등록번호 조회를 위한 입력 필수사항입니다. 입력 후 '조회하기'버튼을 눌러주세요.</div>
		<div class="text_inner">
			<form action="registPro" method="post" name="ceoComForm" enctype="multipart/form-data">
				<table>
					<tr>
						<th>사업자등록번호<span class="*">*</span></th>
						<td colspan="5">
							<div class="div_display">
								<div class="div_display div_align">
									<input type="text" name="com_num_str" id="com_num_register" placeholder="사업자등록번호는 10자리로 '-'를 제외하고 정확하게 입력해주세요." id="comNumText">
									<button type="button" class="button_olive" id="comNumBtn">조회하기</button>
								</div>
								<div class="guide" id="guide"></div>
							</div>	
						</td>
					</tr>
					<tr>
						<th rowspan="5">사진등록</th>
						<td colspan="2" rowspan="5"> 
							<div id="img"><img src="" id="com_img_div"></div>
							<hr>
							<div class="div_display">
							<input type="file" id="file" name="file">
							<div class="guide">사진은 최대 한장만 등록 가능합니다.</div>
							</div>
							<th>대표자명<span class="*">*</span></th>
							<td colspan="2"><input type="text" name="user_name" id="user_name" value="홍길동" readonly="readonly"></td>
	<%-- 						<td colspan="2"><input type="text" name="user_name" id="user_name" value="${member.user_name }" readonly="readonly"></td> --%>
						</td>
					</tr>
					<tr>
						<th>개업일자<span class="*">*</span></th>
						<td colspan="2"><input type="text" name="com_open_date" id="openDate" value="" placeholder="특수기호 없이 YYYYMMDD" style="font-size: 14px;"></td>
					</tr>
					<tr>
						<th>상호명</th>
						<td colspan="2"><input type="text" name="com_name" id="com_name"  value="" readonly="readonly"></td>
					</tr>
					<tr>
						<th>업태</th>
						<td colspan="2"><input type="text" name=com_category id="com_category" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="2"><input type="text" name="com_tel" id="com_tel" value="" placeholder="'-'를 제외하고 적어주세요"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="5">
						<input type="text" name="com_address" id="com_address" maxlength="5" size="50" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<th>영업 시작시간</th><!-- 자바스크립트로 데이터 합치기 -->
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
							<select class="hour" name="closeHour" id="closeHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <c:forEach var="i" begin="0" end="23">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
							:
							<select class="minute" name="closeMin" id="closeMin">
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
							<select class="hour" name="startHour" id="openHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <c:forEach var="i" begin="0" end="23">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
							:
							<select class="minute" name="starMin" id="openMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
								<c:forEach var="i" begin="0" end="59">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
						</td>
						<th>브레이크타임 종료시간</th>
						<td colspan="2">
							<select class="hour" name="endHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <c:forEach var="i" begin="0" end="23">
							    	<option value="${i}">${i}</option>
							    </c:forEach>
							</select>
							:
							<select class="minute" name="endMin">
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
						<td colspan="2" style="font-size: 18px;"><input name="com_max_people" id="hMax" type="text" value=""> &nbsp;명</td>
						<th>광고신청</th>
						<td colspan="2">
							<select name="adRegister" id="adRegister">
								<option name="application" value="">광고선택</option>
								<option name="application" value="신청">신청</option>
								<option name="unapplied" value="미신청">미신청</option>
							</select>
							-
							<select name="com_ad_grade" id="adLevel">
								<option value="0">0단계</option>
								<option value="1">1단계</option>
								<option value="2">2단계</option>
								<option value="3">3단계</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td colspan="4" style="font-size: 18px;">
							<div id="checkbox">
								<input type="checkbox" value="데이트" name="com_tag" class="category">&nbsp;데이트&nbsp; 
								<input type="checkbox" value="가족모임" name="com_tag" class="category">&nbsp;가족모임 &nbsp;
								<input type="checkbox" value="단체회식" name="com_tag" class="category">&nbsp;단체회식 &nbsp;
								<input type="checkbox" value="조용한" name="com_tag" class="category">&nbsp;조용한 &nbsp;
								<input type="checkbox" value="주차가능" name="com_tag" class="category">&nbsp;주차가능 &nbsp;
								<input type="checkbox" value="노키즈존" name="com_tag" class="category">&nbsp;노키즈존 &nbsp;
							</div>	
							<div>	
								<input type="checkbox" value="장애인편의시설" name="com_tag" class="category">&nbsp;장애인편의시설 &nbsp;
								<input type="checkbox" value="반려동물" name="com_tag" class="category">&nbsp;반려동물 동반 &nbsp;
								<input type="checkbox" value="홀" name="com_tag" class="category">&nbsp;홀 &nbsp;
								<input type="checkbox" value="룸" name="com_tag" class="category">&nbsp;룸 &nbsp;
								<input type="checkbox" value="테라스" name="com_tag" class="category">&nbsp;테라스 &nbsp;
								<input type="checkbox" value="창가자리" name="com_tag" class="category">&nbsp;창가자리 &nbsp;
							</div>
						</td>
					</tr>
					<tr>
						<th >검색키워드</th>
						<td colspan="4">
							<div class="div_display">
								<input type="text" id="keyword" name="com_search_tag" value="" placeholder="사업장이 검색될 키워드를 입력하고 스페이스바를 눌러주세요">
								<div class="guide">키워드를 입력하고 스페이스바를 누르면 자동으로 '#'가 붙습니다.</div>
							</div>
						</td>
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