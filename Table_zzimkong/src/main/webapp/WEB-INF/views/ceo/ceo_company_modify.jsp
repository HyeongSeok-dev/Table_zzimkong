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
<body class="info_window">
	<section>
		<h3>업체 상세 정보</h3>
		<br><br>
		<form action="" method="post" name="comInfoModify">
			<table>
				<tr>
					<th>업체번호</th>
					<td colspan="7">1</td>
				</tr>
				<tr>
					<th>업체명</th>
					<td colspan="3"><input type="text" value="아오모리" readonly="readonly"></td>
					<th>업태</th>
					<td colspan="3"><input type="text" value="일식" readonly="readonly"></td>
				</tr>
				<tr>
					<th>대표자명</th>
					<td colspan="3"><input type="text" value="최종권" readonly="readonly"></td>
					<th>사업자등록번호</th>
					<td colspan="3">051-720-8200</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="7"><input type="text" maxlength="5" size="50" value="부산광역시 해운대구 센텀3로 20 (우동, 센텀호텔316,317호)" readonly="readonly"></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td colspan="3"><input type="text" value="11:00~21:30"></td>
					<th>업체상태</th>
					<td>
						<input type="text" id="company_state1" name="company_state1" readonly="readonly" value="영업정지" size="4">
					</td>
					<td colspan="2">
						<select id="company_state2" onchange="comStateSelected(this.value)">
							<option value="영엽정지">영업정지</option>
							<option value="정상">정상</option>
						</select>
					</td>
				</tr>	
				<tr>
					<th>시간당 최대 테이블</th>
					<td colspan="3"><input type="text" value="10명"></td>
					<th>광고등급</th>
					<td colspan="3">
						2단계
					</td>
				</tr>
				<tr>
					<th>건당 최대인원</th>
					<td colspan="3"><input type="text" value="20명"></td>
					<th>등록일자</th>
					<td colspan="3">2023/12/24</td>
				</tr>
				
			</table>
			<br>
			<button type="submit" class="button_olive">수정</button>
			<button type="button" id="button_cancel" onclick="companyCheckShutDown()">폐점 신청</button>
		</form>
	</section>
</body>
</html>