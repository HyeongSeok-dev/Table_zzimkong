<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<form action="" method="post" name="comInfoModify">
				<table>
					<tr>
						<th colspan="2">번호</th>
						<td colspan="1">1</td>
						<th colspan="1">사업자등록번호</th>
						<td colspan="1">3333-333-1</td>
					</tr>
					<tr>
						<th colspan="2">상호명</th>
						<td colspan="1"><input type="text" value="아오모리" readonly="readonly" name="comName"></td>
						<th colspan="1">업태</th>
						<td colspan="1"><input type="text" value="일식" readonly="readonly" name="comState"></td>
					</tr>
					<tr>
						<th colspan="2">대표자명</th>
						<td colspan="1"><input type="text" value="최종권" readonly="readonly" name="ceoName"></td>
						<th colspan="1">전화번호</th>
						<td colspan="1"><input type="text" value="051-234-3242" name="comPhoneNum"></td>
					</tr>
					<tr>
						<th colspan="2">주소</th>
						<td colspan="3"><input type="text" name="comAdress" maxlength="5" size="50" value="부산광역시 해운대구 센텀3로 20 (우동, 센텀호텔316,317호)" readonly="readonly"></td>
					</tr>
					<tr>		    
						<th colspan="2">업체상태</th>
						<td colspan="1">
							<input type="text" id="company_state1" name="comStatus" readonly="readonly" value="영업정지" size="4">
						<th colspan="1">업체상태변경</th>
						</td>
						<td colspan="1">
							<select id="company_state2" name="comStatusChange" onchange="comStateSelected(this.value)">
								<option value="영엽정지">영업정지</option>
								<option value="정상">정상</option>
							</select>
						</td>
					</tr>	
					<tr>
						<th colspan="2">시간당 최대 인원</th>
						<td colspan="1"><input type="text" value="10명" name="perHourMaxTable"></td>
						<th colspan="1">광고등급</th>
						<td colspan="2">
							2단계
						</td>
					</tr>
					<tr>
						<th colspan="2">건당 최대 인원</th>
						<td colspan="1"><input type="text" value="20명" name="perResMaxPerson"></td>
						<th colspan="1">등록일자</th>
						<td colspan="2">2023/12/24</td>
					</tr>
					<tr>
						<th rowspan="2" colspan="1">영업시간</th>
						<th colspan="1">영업시작시간</th>
						<td colspan="3">
							<select class="hour" name="openHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <script>
							        for(var i = 0; i < 24; i++){
							            document.write('<option value="'+ i +'">'+ i +'</option>');
							        }
							    </script>
							</select>
							:
							<select class="minute" name="openMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
							    <script>
							        for(var i = 0; i < 60; i++){
							            document.write('<option value="'+ i +'">'+ i +'</option>');
							        }
							    </script>
							</select>
						</td>
					</tr>	
					<tr>	
						<th colspan="1">영업종료시간</th>
						<td colspan="3">
							<select class="hour" name="closeHour">
							    <!-- 0시부터 23시까지 -->
							    <option value="">시</option>
							    <script>
							        for(var i = 0; i < 24; i++){
							            document.write('<option value="'+ i +'">'+ i +'</option>');
							        }
							    </script>
							</select>
							:
							<select class="minute" name="closeMin">
								<!-- 0분부터 59분까지 -->
							    <option value="">분</option>
							    <script>
							        for(var i = 0; i < 60; i++){
							            document.write('<option value="'+ i +'">'+ i +'</option>');
							        }
							    </script>
							 </select>
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