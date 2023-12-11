<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_menu.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script type="text/javascript">
	
	
</script>
</head>
<body class="info_window">
	<section>
		<h3>메뉴 수정/삭제</h3>
		<br><br>
		<form action="" method="post" name="comInfoModify">
			<table>
				<tr>
					<th>업체명</th>
					<td colspan="3">파니니</td>
					<th>메뉴번호</th>
					<td colspan="3">1</td>
				</tr>
				<tr>
					<th>메뉴명</th>
					<td colspan="3"><input type="text" value="불고기 파니니"></td>
					<th>가격</th>
					<td colspan="3"><input type="text" value="7000원"></td>
				</tr>
				<tr class="menu_info">
					<th class="menu_info">메뉴설명</th>
					<td colspan="7" class="menu_info">
						<div>
							<textarea class="menu_info">단짠단짠 불고기 파니니</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="7">메뉴이미지</th>
				</tr>
				<tr>
					<td colspan="4">
						<div class="preview_container">
							<img class="preview_image" src="" alt="이미지 미리보기">
						</div>
					</td>
					<td colspan="4">
						<div>
							<input type="file" name="menuImages[0].menu_img" class="menuImage">
						</div>
					</td>
				</tr>	
				
				
			</table>
			<br>
			<button type="submit" class="button_olive">수정</button>
		</form>
	</section>
</body>
</html>