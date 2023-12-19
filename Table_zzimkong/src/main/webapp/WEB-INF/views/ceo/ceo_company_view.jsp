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
				<span><h3>사업장 정보</h3></span>
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
						<td colspan="1">아오모리</td>
						<th colspan="1">업태</th>
						<td colspan="1">일식</td>
					</tr>
					<tr>
						<th colspan="2">대표자명</th>
						<td colspan="1">최종권</td>
						<th colspan="1">전화번호</th>
						<td colspan="1">051-234-3242</td>
					</tr>
					<tr>
						<th colspan="2">주소</th>
						<td colspan="3">부산광역시 해운대구 센텀3로 20 (우동, 센텀호텔316,317호)</td>
					</tr>
					<tr>		    
						<th colspan="2">업체상태</th>
						<td colspan="1">영업정지</td>
						<th colspan="1">업체상태변경</th>
						<td colspan="1">정상</td>
					</tr>	
					<tr>
						<th colspan="2">시간당 최대 인원</th>
						<td colspan="1">10명</td>
						<th colspan="1">광고등급</th>
						<td colspan="2">
							2단계
						</td>
					</tr>
					<tr>
						<th colspan="2">건당 최대 인원</th>
						<td colspan="1">20명</td>
						<th colspan="1">등록일자</th>
						<td colspan="2">2023/12/24</td>
					</tr>
					<tr>
						<th rowspan="2" colspan="1">영업시간</th>
						<th colspan="1">영업시작시간</th>
						<td colspan="3">10:00</td>
					</tr>	
					<tr>	
						<th colspan="1">영업종료시간</th>
						<td colspan="3">20:00</td>
					</tr>
				</table>
				<br><br>
				<button type="submit" class="button_olive">수정/폐점신청</button>
			</form>
		</div>
	</section>
</body>
</html>