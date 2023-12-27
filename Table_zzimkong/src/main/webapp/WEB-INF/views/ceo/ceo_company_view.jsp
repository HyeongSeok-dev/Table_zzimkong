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
	function comAdRegistration() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/ceo/company/ad','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
	function modifyAndCloseRegister() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/ceo/company/modify','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
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
						<td colspan="1"></td>
						<th colspan="1">사업자등록번호</th>
						<td colspan="1"></td>
					</tr>
					<tr>
						<th colspan="2">상호명</th>
						<td colspan="1"></td>
						<th colspan="1">업태</th>
						<td colspan="1"></td>
					</tr>
					<tr>
						<th colspan="2">대표자명</th>
						<td colspan="1"></td>
						<th colspan="1">전화번호</th>
						<td colspan="1"></td>
					</tr>
					<tr>
						<th colspan="2">주소</th>
						<td colspan="3"></td>
					</tr>
					<tr>		    
						<th colspan="2">업체상태</th>
						<td colspan="1"></td>
						<th colspan="1">업체상태변경</th>
						<td colspan="1"></td>
					</tr>	
					<tr>
						<th colspan="2">시간당 최대 인원</th>
						<td colspan="1"></td>
						<th colspan="1">광고등급</th>
						<td colspan="2">
							
						</td>
					</tr>
					<tr>
						<th colspan="2">건당 최대 인원</th>
						<td colspan="1"></td>
						<th colspan="1">등록일자</th>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th rowspan="2" colspan="1">영업시간</th>
						<th colspan="1">영업시작시간</th>
						<td colspan="3"></td>
					</tr>	
					<tr>	
						<th colspan="1">영업종료시간</th>
						<td colspan="3"></td>
					</tr>
				</table>
				<br><br>
				<button type="button" class="button_olive" onclick="comAdRegistration()">광고등록</button>
				<button type="button" class="button_olive" onclick="modifyAndCloseRegister()">수정/폐점신청</button>
			</form>
		</div>
	</section>
</body>
</html>