<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_company.jsp</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function blackRegister() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('black/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
	function blackDelete() {
		confirm("블랙회원 목록에서 삭제하시겠습니까?");
		if(true){
			alert("삭제되었습니다.");
		}
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/ceo_top.jsp"/>
	</header>
	<section class="ceo_sec">
		<div class="text">
			<div class="text_inner">
				<div class="header_div01">
					<span><h1>사업장별 블랙회원 관리</h1></span>
					<span class="header_span">
							<select id="storeList">
								<option value="">상호명</option>
								<option value="칸다소바">칸다소바</option>
								<option value="아오모리">아오모리</option>
							</select>
					</span>	
				</div>
			</div>
			<div class="text_inner">
				<div class="header">
				<span><h3>블랙회원 목록</h3></span>
				<span>
					<button type="button" onclick="blackRegister()">등록</button> 
					<button type="button" id="my_delete" onclick="blackDelete()">선택 삭제</button>
				</span>
				</div>
				<table border="1">
					<tr>
						<th>선택</th>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>연락처</th>
						<th>사유</th>
						<th>처리날짜</th>
						<th>블랙상태</th>
						<th></th>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="select">
						</td>
						<td>11</td>
						<td>a123</td>
						<td>김개굴</td>
						<td>010-1234-5678</td>
						<td>악의적인 리뷰를 잦게 씀 </td>
						<td>22/11/06 16:25</td>
						<td>처리완료</td>
						<td><button type="button" id="my_delete" class= "" onclick="blackDelete()">삭제</button></td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="select">
						</td>
						<td>73</td>
						<td>bcd93</td>
						<td>강하마</td>
						<td>010-1234-5678</td>
						<td>술 마시고 가게 안에서 고성방가</td>
						<td>22/12/26 16:25</td>
						<td>처리중</td>
						<td><button type="button" id="my_delete" onclick="blackDelete()">삭제</button></td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="select">
						</td>
						<td>52</td>
						<td>hahaha77</td>
						<td>최기린</td>
						<td>010-1234-5678</td>
						<td>예약 후 잦은 취소</td>
						<td>23/01/08 18:34</td>
						<td>처리완료</td>
						<td><button type="button" id="my_delete" onclick="blackDelete()">삭제</button></td>
					</tr>
					
				</table>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
	</footer>
</body>
</html>