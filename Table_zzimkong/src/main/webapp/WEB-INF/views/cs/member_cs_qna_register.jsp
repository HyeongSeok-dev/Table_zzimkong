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

        $("form[name='memberQnaForm']").submit(function(event) {
            if (!$('#cs_agree_checkbox').prop('checked')) {
                event.preventDefault(); // 폼 제출을 막음
                alert("개인정보 수집 및 이용에 동의해야 합니다."); // 얼럿 메시지 표시
            }
            if($('.category_select').val() === ''){
                event.preventDefault(); // 폼 제출을 막음
                alert("분류를 선택해주세요"); // 얼럿 메시지 표시
                $('.category_select').focus();
            }
        });
    });
</script>
</head>
<body>
	<section class="ceo_popup_sec">
		<div class="text_inner">
			<div class="header_div01">
				<span><h3>1 : 1 문의하기</h3></span>
			</div>
		</div>		
		<div class="text_inner_form">
			<form action="registerPro" method="post" name="memberQnaForm" enctype="multipart/form-data">
				<table>
					<tr>
						<th width="80">회원정보</th>
                        <td width="100">${member.user_name}</td>
						<th width="80">유형</th>
						<td>
							<select class="category_select" name="cs_board_category_sub">
			            		<option value="">유형선택</option>
			            		<option value="1">예약</option>
								<option value="2">주문/결제</option>
								<option value="3">리뷰</option>
								<option value="4">회원정보</option>
								<option value="5">이용문의</option>
								<option value="6">쿠폰/포인트</option>
			            	</select>
						</td>
					</tr>
					<tr>
						<th colspan="1">제목</th>
						<td colspan="3">
                            <input type="text" placeholder="제목" name="cs_board_subject" id="csQnaRegiTitle">
						</td>
					</tr>
					<tr>
						<th colspan="1">문의내용</th>
						<td colspan="3">
                            <textarea rows="20" cols="80" name="cs_board_content" id="csQnaRegiContent"></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="1">파일첨부</th>
						<td colspan="3" class="td_file">
                            <input type="file" name="mFile1" class="file" accept="image/*">
                            <input type="file" name="mFile2" class="file" accept="image/*">
                            <input type="file" name="mFile3" class="file" accept="image/*">
                            <input type="file" name="mFile4" class="file" accept="image/*">
                            <input type="file" name="mFile5" class="file" accept="image/*">
                        </td>
					</tr>
				</table>
				<br>
				<div class="cs_agree">
					<input type="checkbox" id="cs_agree_checkbox" name="mustAgree">
					<span class="cs_checkbox_must">
						<span class="must">[필수]</span> 개인정보 수집 및 이용에 동의합니다.
					</span>
				</div>
				<br><br>
				<button type="submit" class="button_olive">문의등록</button>
				<button type="reset" class="button_grey2">초기화</button>
			</form>
		</div>
	</section>
</body>
</html>