<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 본문 css --%>
<link href="${pageContext.request.contextPath }/resources/css/ceo_article.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("input[type='file']").change(function() {
            var currentFileInput = $(this);
            var currentPreviewContainer = currentFileInput.next(".previewContainer"); // 다음에 있는 미리보기 컨테이너를 찾음

            if (currentFileInput.val() !== "") {
                // 이미지 미리보기 컨테이너가 존재하지 않으면 동적으로 생성
                if (currentPreviewContainer.length === 0) {
                    currentPreviewContainer = $("<div>").addClass("previewContainer");
                    currentFileInput.after(currentPreviewContainer);
                }

                var newPreviewImage = $("<img>").addClass("previewImage").attr("src", "").attr("alt", "이미지 미리보기");
                currentPreviewContainer.html(newPreviewImage); // 기존 미리보기 이미지 초기화
                
                readURL(currentFileInput, newPreviewImage); // 파일 미리보기 함수 호출
            } else {
                // 파일이 선택되지 않은 경우 미리보기 이미지 제거
                currentPreviewContainer.remove();
            }
        });

        // 파일 미리보기 함수
        function readURL(input, previewImage) {
            if (input[0].files && input[0].files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    previewImage.attr("src", e.target.result);
                }

                reader.readAsDataURL(input[0].files[0]);
            }
        }

    });
</script>
</head>
<body class="info_window">
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>1 :1 문의 수정</h3></span>
			</div>
		</div>
		<div class="text_inner_form">
			<form action="modifyPro" method="post" name="ceoQnaModifyPro" enctype="multipart/form-data">
				<table>
					<tr>
						<th width="80">회원정보</th>
						<td width="100">${member.user_name}</td>
						<th width="80">유형</th>
						<td>
							<select class="category_select" name="cs_board_category_sub">
			            		<option value="" >유형선택</option>
			            		<option value="1" <c:if test="${board.cs_board_category_sub eq 1}">selected</c:if>>예약관리</option>
			            		<option value="2" <c:if test="${board.cs_board_category_sub eq 2}">selected</c:if>>메뉴관리</option>
			            		<option value="3" <c:if test="${board.cs_board_category_sub eq 3}">selected</c:if>>광고</option>
			            		<option value="4" <c:if test="${board.cs_board_category_sub eq 4}">selected</c:if>>블랙회원관리</option>
			            		<option value="5" <c:if test="${board.cs_board_category_sub eq 5}">selected</c:if>>업체관리</option>
			            	</select>
						</td>
					</tr>
					<tr>
						<th colspan="1">제목</th>
						<td colspan="3">
							<input type="text" placeholder="제목" id="" name="cs_board_subject" id="csQnaRegiTitle" value="${board.cs_board_subject}">
						</td>
					</tr>
					<tr>
						<th colspan="1">문의내용</th>
						<td colspan="3">
							<textarea rows="20" cols="80" name="cs_board_content" id="csQnaRegiContent"> ${board.cs_board_content} </textarea>
						</td>
					</tr>
					<tr>
						
						<th colspan="1">파일첨부</th>
						<td colspan="3" class="td_file">
							<div><c:if test="${not empty board.cs_board_img_1}"><img src="/upload${board.cs_board_img_1}"></c:if></div>
                            <input type="file" name="mFile1" class="file" accept="image/*">
                            <div><c:if test="${not empty board.cs_board_img_2}"><img src="/upload${board.cs_board_img_2}"></c:if></div>
                            <input type="file" name="mFile2" class="file" accept="image/*">
                            <div><c:if test="${not empty board.cs_board_img_3}"><img src="/upload${board.cs_board_img_3}"></c:if></div>
                            <input type="file" name="mFile3" class="file" accept="image/*">
                            <div><c:if test="${not empty board.cs_board_img_4}"><img src="/upload${board.cs_board_img_4}"></c:if></div>
                            <input type="file" name="mFile4" class="file" accept="image/*">
                            <div><c:if test="${not empty board.cs_board_img_5}"><img src="/upload${board.cs_board_img_5}"></c:if></div>
                            <input type="file" name="mFile5" class="file" accept="image/*">
                        </td>
					</tr>
				</table>
				<br>
				<br><br>
				<button type="button" class="button_olive" onclick="location.href='javascript:history.back()'">뒤로가기</button>
				<button type="submit" class="button_olive">수정</button>
				<button type="reset" class="button_grey2">초기화</button>
				<input type="hidden" name="cs_board_num" value="${board.cs_board_num}">
				<input type="hidden" name="user_id" value="${board.user_id}">
			</form>
		</div>
	</section>
</body>
</html>