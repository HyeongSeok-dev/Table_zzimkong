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
<style type="text/css">
	input[type="number"]{
		font-size: 15px;
		border: none;
		border-radius: 10px;
		outline: none;
		background-color: #eff7fe;
		padding-left: 15px;
		height: 35px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ceo_menu_modify.js"></script>
</head>
<body class="info_window">
	<section>
		<h3>메뉴 수정/삭제</h3>
		<br><br>
		<form action="modifyPro" method="post" id="menuForm" name="menuInfoModify" enctype="multipart/form-data">
			<table>
				<tr>
					<th>업체명</th>
					<td colspan="3">${company.com_name}</td>
					<th>메뉴번호</th>
					<td colspan="3">${menu.menu_idx} <input type="hidden" id="menu_idx" name="menu_idx" value="${menu.menu_idx}"></td>
				</tr>
				<tr>
					<th>메뉴명</th>
					<td colspan="3"><input type="text" name="menu_name" value="${menu.menu_name}"></td>
					<th>가격</th>
					<td colspan="3"><input type="number" name="menu_price" value="${menu.menu_price}"></td>
				</tr>
				<tr class="menu_info">
					<th class="menu_info">메뉴설명</th>
					<td colspan="7" class="menu_info">
						<div>
							<textarea class="menu_info" name="menu_describe">${menu.menu_describe}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="8">메뉴이미지</th>
				</tr>
				<tr>
					<td colspan="8">
						<div class="preview_container">
							<img class="preview_image" src="${pageContext.request.contextPath }/resources/upload/${menu.menu_img}" alt="이미지 미리보기">
						</div>
					</td>
				</tr>	
				<tr>
					<td colspan="8">
						<div>
							<input type="hidden" name="menu_img" value="${menu.menu_img}">
							<input type="file" name="menuImages" class="menuImage" accept="image/*">
						</div>
					</td>
				</tr>
				
			</table>
			<br>
			<button type="submit" class="button_olive">수정</button>
			<button type="button" id="button_delete">삭제</button>
		</form>
	</section>
</body>
</html>