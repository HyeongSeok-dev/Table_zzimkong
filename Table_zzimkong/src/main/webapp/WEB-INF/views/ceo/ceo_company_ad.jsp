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
	function company_shut_down() {
		var company_state = document.getElementById("company_state");
		var value = company_state.options[company_state.selectedIndex].value;
		if(value == "4") {
			confirm("폐점으로 바꾸시겠습니까?");
		}
	}
</script>
</head>
<body>
	<sectionc class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>광고 등록</h3></span>
			</div>
		</div>
		<div class="text_inner">
			<form action="payAdPro" method="post" name="comAdJoin">
				<table>
					<tr>
						<th>업체번호</th>
						<td colspan="1">1</td>
						<th>업체명</th>
						<td colspan="3"><input type="text" value="" name="comName"></td>
					</tr>
					<tr>
						<th>광고상태</th>
						<td colspan="1"><input type="text" value="" name="adStatus"></td>
						<th>광고등급</th>
						<td colspan="3">
							<select id="company_state" onchange="company_shut_down()" name="adStatusLevel">
								<option value="1">광고없음</option>
								<option value="2">1단계</option>
								<option value="3">2단계</option>
								<option value="4">3단계</option>
							</select>
						</td>
					</tr>	
					<tr>
						<th colspan="6">광고 등급당 가격 안내</th>
					</tr>
					<tr>
						<th colspan="2">등급</th>
						<th colspan="2">가격</th>
					</tr>
					<tr>
						<td colspan="2">1</td>
						<td colspan="2">30만원</td>
					</tr>
					<tr>
						<td colspan="2">2</td>
						<td colspan="2">50만원</td>
					</tr>
					<tr>
						<td colspan="2">3</td>
						<td colspan="2">100만원</td>
					</tr>
					
				</table>
				<br><br>
				<button type="submit" class="button_olive">결제</button>
				<button type="reset" class="button_grey2">초기화</button>
			</form>
		</div>
	</section>
</body>
</html>