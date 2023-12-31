<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업장 정보 수정</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	function companyCheckShutDown() {
		if(company_state2.selectedIndex = 0) {
			   alert("영업상태가 정상영업중 입니다. 영업상태를 확인 해주세요");
		   } else {
			  var value = confirm("폐점 하시겠습니까? 신청완료 후 폐점 신청을 철회하고 싶으시다면 고객센터로 문의 주세요");
				if(value === true) {
					companyShutDown();
				} 
		   }
		
	}
	
	function companyShutDown() {
		document.querySelector("#company_state1").value = "폐점신청중";
		document.querySelector("#company_state2").disabled = true;
	}
	
	function comStateSelected(com_state) {
		  
		  document.querySelector("#company_state1").value = com_state;
	}		  
	
</script>
</head>
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>사업장 정보 수정</h3></span>
			</div>
		</div>
		<div class="text_inner">
			<form action="" method="post" name="ceoComForm">
				<table>
					<tr>
						<th>사업자등록번호</th>
						<td colspan="5">
							<div>
								<input type="search" name="comNum" id="comNumText" value="">
							</div>	
						</td>
					</tr>
					<tr>
						<th rowspan="2">사진등록</th>
						<td colspan="2" rowspan="2"> 
							<div id="img"></div>
							<hr>
							<div class="file_div">
							<input type="file" id="file">
							<div id="onlyone">*사진은 최대 한장만 올려주세요</div>
							</div>
						</td>
						<th>상호명</th>
						<td colspan="2"><input type="text" name="com_name" value="" readonly="readonly"></td>
					</tr>
					<tr>
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
						<th>카테고리</th>
						<td colspan="4" style="font-size: 18px;">
							<div>
								<input type="checkbox" value="데이트" name="category" class="category">&nbsp;데이트&nbsp; 
								<input type="checkbox" value="가족모임" name="category" class="category">&nbsp;가족모임 &nbsp;
								<input type="checkbox" value="단체회식" name="category" class="category">&nbsp;단체회식 &nbsp;
								<input type="checkbox" value="조용한" name="category" class="category">&nbsp;조용한 &nbsp;
								<input type="checkbox" value="주차가능" name="category" class="category">&nbsp;주차가능 &nbsp;
								<input type="checkbox" value="노키즈존" name="category" class="category">&nbsp;노키즈존 &nbsp;
							</div>	
							<div>	
								<input type="checkbox" value="장애인편의시설" name="category" class="category">&nbsp;장애인편의시설 &nbsp;
								<input type="checkbox" value="반려동물" name="category" class="category">&nbsp;반려동물 동반 &nbsp;
								<input type="checkbox" value="홀" name="category" class="category">&nbsp;홀 &nbsp;
								<input type="checkbox" value="룸" name="category" class="category">&nbsp;룸 &nbsp;
								<input type="checkbox" value="테라스" name="category" class="category">&nbsp;테라스 &nbsp;
								<input type="checkbox" value="창가자리" name="category" class="category">&nbsp;창가자리 &nbsp;
							</div>
						</td>
					</tr>
					<tr>
						<th >검색키워드</th>
						<td colspan="4">
							<input type="text" id="keyword" value="" placeholder="사업장이 검색될 키워드를 입력해주세요">
							<br>
							<div> </div>
						</td>
					</tr>
				</table>
				<br><br>
				<button type="submit" class="button_olive">수정</button>
				<button type="button" id="button_cancel" onclick="companyCheckShutDown()">폐점 신청</button>
			</form>
		</div>
	</section>
</body>
</html>