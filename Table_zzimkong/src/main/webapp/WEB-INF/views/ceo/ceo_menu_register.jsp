<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>메뉴 등록 페이지</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/ceo_menu_form.css">
	<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/ceo_menu_form.js"></script>
</head>
<body>
	
	<div class="text">
			<h3>메뉴 등록</h3>
		<div class="article">
			<form id="menuForm" method="post" action="menuFormPro" class="section_box">
				<div id="menuContainer">
					<input type="hidden" name="menu_idx" value="1">
					<input type="hidden" name="com_id" value="1">
					<div class="menuRow">
						<div class="menuInput">
							<input type="text" name="menuList[0].menu_name" class="menuName" placeholder="메뉴 이름"> 
							<input type="number" name="menuList[0].menu_price" class="menuPrice" placeholder="메뉴 가격">
							<textarea name="menuList[0].menu_describe" class="menuDesc" placeholder="메뉴 설명"></textarea>
							<input type="file" name="menuImages[0].menu_img" class="menuImage"
								>
						</div>
						<div class="previewContainer">
							<img class="previewImage" src="" alt="이미지 미리보기">
						</div>
					</div>
					<!-- 위의 div를 복사하여 메뉴 등록 공간을 추가할 수 있습니다 -->
				</div>
				<div class="buttonRow">
					<button type="button" id="addMenuButton">메뉴 추가</button>
					<button type="submit" id="saveButton">저장</button>
					<button type="reset" id="cancelButton">초기화</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>


