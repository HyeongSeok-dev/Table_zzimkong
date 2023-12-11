<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_company.jsp</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/com_black.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<%-- 사이드바 css --%>
<link href="${pageContext.request.contextPath }/resources/css/com_sidebar.css" rel="stylesheet">
<script type="text/javascript">
	function blackRegister() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('com_black_register.jsp','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
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
	<%-- 사이드바 삽입 --%>
	<jsp:include page="../inc/com_sidebar.jsp"/>

	<section class="article">
        <div class="text_header">업주 페이지</div>
        
        <br>
		<div class="text">
			<div class="header">
			<span><h3>블랙회원 관리</h3></span>
			<span>
				<button type="button" onclick="blackRegister()">등록</button> 
				<button type="reset" onclick="blackDelete()">선택 삭제</button>
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
					<td><button type="reset" onclick="blackDelete()">삭제</button></td>
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
					<td><button type="reset" onclick="blackDelete()">삭제</button></td>
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
					<td><button type="reset" onclick="blackDelete()">삭제</button></td>
				</tr>
				
			</table>
		</div>
	</section>
</body>
</html>