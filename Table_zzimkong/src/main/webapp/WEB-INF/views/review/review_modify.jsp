<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/css/review_modify.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_modify.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
                 
function deleteFile(review_num, review_img_1) {
	
	 // 새로운 파일 입력 요소 HTML 생성
  var newFileInputHtml = `
        <input type="file" id="photoInput${review_img_1}" name="file${review_img_1}" accept="image/*" style="display:none;">
        <button type="button" id="photoBtn${review_img_1}" class="photo_btn" name="file${review_img_1}">
            <i class="fas fa-camera"></i> 사진 추가
        </button>
        <div class="preview_container" id="previewContainer${review_img_1}" style="display: none;"></div>`;

    if (confirm("삭제하시겠습니까?")) {
        $.ajax({
            url: "ReviewDeleteFile",
            type: "POST",
            data: {
                "review_num": review_num,
                "review_img_1": review_img_1
            },
            success: function(response) {
                if(response == "true") {
                    // 프리뷰 요소 삭제
					$(".imagePreview").empty().hide();
                    $(".remove_btn").hide();

                    // 새로운 파일 입력 요소 HTML 생성
                    $("#fileItemArea").html(newFileInputHtml);

                    // 새 요소에 대한 이벤트 핸들러 설정
                    bindNewFileInputEvents(review_img_1);
                } else {
                    alert('이미지 삭제 실패: ' + response.message);
                }
            }
        });
    }
}

// function bindNewFileInputEvents(review_img_id) {
//     $("#photoBtn" + review_img_id).on('click', function() {
//         $("#photoInput" + review_img_id).click();
//     });

//     $("#photoInput" + review_img_id).on('change', function(event) {
//         handleImagePreview(event, review_img_id);
//     });
// }

// function removePreview(review_img_id) {
//     $("#previewContainer" + review_img_id).empty().hide();
//     $("#photoInput" + review_img_id).val('');
// }

function bindNewFileInputEvents(review_img_1) {
    $("#photoBtn" + review_img_1).on('click', function() {
        $("#photoInput" + review_img_1).click();
    });

    $("#photoInput" + review_img_1).on('change', function(event) {
        handleImagePreview(event, review_img_1);
    });
}

function removePreview(review_img_1) {
    $("#previewContainer" + review_img_1).empty().hide();
    $("#photoInput" + review_img_1).val('');
}

</script>
<title>리뷰 수정 페이지</title>
<!-- 수정 -->
</head>
<body>
	<article id="reviewModifyForm">
	<div class="container">
		<div class="restaurant_info">
<!-- 			 <a href="detail?com_id=1"><h1>음식점 이름</h1></a> -->
			 <a href="redetail?com_id=1"><h1>칸다소바 부전점</h1></a>
			 <a href="redetail?com_id=1"><h1>${com_id}</h1></a>
			 <!--            ~~~~~~~~~ : 나중에 ${com_id}로 고쳐서 값 받아오기 -->
<!-- 			 <input type="submit" value="음식점 이름" onclick="location.href=detail"> -->
			<p>몇번째 방문</p>
<!-- 			<p>먹은 메뉴</p> -->
		</div>
		<form action="${pageContext.request.contextPath}/zzimkong/review/ReviewModifyPro" method="POST" enctype="multipart/form-data">
<!-- 		<form action="ReviewModifyPro" name="reviewModifyForm" method="POST" enctype="multipart/form-data"> -->
	    <input type="hidden" name="review_num" value="${review.review_num}"> <!-- 231228 추가 -->
	    <input type="hidden" name="com_id" value="${review.com_id}">    <!-- 231228 추가 -->
	    <input type="hidden" name="user_id" value="${sId}">  <!-- 231228 추가 -->
		<div class="separator"></div>
		<div class="review_rate_1" style="text-align: center;">
		<fieldset class="review_rate">
			 <input type="radio" id="rating10" name="review_score" value="10" ${review.review_score == 10 ? 'checked' : ''}><label for="rating10" title="5점"></label>
			 <input type="radio" id="rating9" name="review_score" value="9" ${review.review_score == 9 ? 'checked' : ''}><label class="half" for="rating9" title="4.5점"></label>
			 <input type="radio" id="rating8" name="review_score" value="8" ${review.review_score == 8 ? 'checked' : ''}><label for="rating8" title="4점"></label>
			 <input type="radio" id="rating7" name="review_score" value="7" ${review.review_score == 7 ? 'checked' : ''}><label class="half" for="rating7" title="3.5점"></label>
			 <input type="radio" id="rating6" name="review_score" value="6" ${review.review_score == 6 ? 'checked' : ''}><label for="rating6" title="3점"></label>
			 <input type="radio" id="rating5" name="review_score" value="5" ${review.review_score == 5 ? 'checked' : ''}><label class="half" for="rating5" title="2.5점"></label>
			 <input type="radio" id="rating4" name="review_score" value="4" ${review.review_score == 4 ? 'checked' : ''}><label for="rating4" title="2점"></label>
			 <input type="radio" id="rating3" name="review_score" value="3" ${review.review_score == 3 ? 'checked' : ''}><label class="half" for="rating3" title="1.5점"></label>
			 <input type="radio" id="rating2" name="review_score" value="2" ${review.review_score == 2 ? 'checked' : ''}><label for="rating2" title="1점"></label>
			 <input type="radio" id="rating1" name="review_score" value="1" ${review.review_score == 1 ? 'checked' : ''}><label class="half" for="rating1" title="0.5점"></label>
        </fieldset>
		</div>
		<br>
		<div class="like_section" style="text-align: center;">
			<div class="like_section_text">
				<p>
					이곳이 마음에 든다면,<br> '좋아요'를 눌러주세요<br>
					<!-- 취향이 비슷한 사람을 추천받으세요. -->
				</p>
			</div>
		<!-- 좋아요 버튼, 'checked' 상태는 서버에서 제공된 review 데이터를 기반으로 결정됩니다. -->
		<label class="like_button" id="likeButton">
		    <input type="checkbox" name="review_like" value="true" ${review.review_like ? 'checked' : ''} style="display: none;"/>
		    <svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none"
		        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
		        <path stroke-linecap="round" stroke-linejoin="round" 
		              d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z">
		        </path>
		    </svg> 이런 곳 좋아요
		</label>
			<!-- ===================================================================== -->
		</div>
		<br>
		<div class="separator"></div>
		<div class="review_section">
			<h2>어떤 점이 좋았나요? (1개 ~ 5개)</h2>
			<p>이 장소에 어울리는 키워드를 골라주세요.</p>
			<div class="keyword_section">
				<div class="keyword_category">
			<h3>음식/가격</h3>		
							<!-- ===================================================================== -->
						<input type="checkbox" id="review_food_big_checkbox" ${review.review_food_big == 1 ? 'checked' : ''}>
						<label for="review_food_big_checkbox" class="checkbox_label">양이 많아요</label>
						<input type="hidden" name="review_food_big" value="${review.review_food_big}">
						<!-- ===================================================================== -->
						<input type="checkbox" id="review_food_deli_checkbox" ${review.review_food_deli == 1 ? 'checked' : ''}>
						<label for="review_food_deli_checkbox" class="checkbox_label">음식이 맛있어요</label>
						<input type="hidden" name="review_food_deli" value="${review.review_food_deli}">

						<input type="checkbox" id="review_food_cheap_checkbox"${review.review_food_cheap == 1 ? 'checked' : ''}>
						<label for="review_food_cheap_checkbox" class="checkbox_label">가성비가 좋아요</label>
						<input type="hidden" name="review_food_cheap" value="${review.review_food_cheap}">
						<!-- ===================================================================== -->
						<input type="checkbox" id="review_food_fresh_checkbox"${review.review_food_fresh == 1 ? 'checked' : ''}>
						<label for="review_food_fresh_checkbox" id="review_food_fresh" class="checkbox_label">재료가 신선해요</label>
						<input type="hidden" name="review_food_fresh" value="${review.review_food_fresh}">
						
						<input type="checkbox" id="review_food_healthy_checkbox"${review.review_food_healthy == 1 ? 'checked' : ''}>
						<label for="review_food_healthy_checkbox" id="review_food_healthy" class="checkbox_label">건강한 맛이에요</label>
						<input type="hidden" name="review_food_healthy" value="${review.review_food_healthy}">
				</div>
				<div class="keyword_category">
					<h3>분위기</h3>
						<input type="checkbox" id="review_mood_interior_checkbox"${review.review_mood_interior == 1 ? 'checked' : ''}>
						<label for="review_mood_interior_checkbox" id="review_mood_interior" class="checkbox_label">인테리어가 멋져요</label>
						<input type="hidden" name="review_mood_interior" value="${review.review_mood_interior}">

						<input type="checkbox" id="review_mood_alone_checkbox"${review.review_mood_alone == 1 ? 'checked' : ''}>
						<label for="review_mood_alone_checkbox" id="review_mood_alone" class="checkbox_label">혼밥하기 좋아요</label>
						<input type="hidden" name="review_mood_alone" value="${review.review_mood_alone}">

						<input type="checkbox" id="review_mood_large_checkbox"${review.review_mood_large == 1 ? 'checked' : ''}>
						<label for="review_mood_large_checkbox" id="review_mood_large" class="checkbox_label">매장이 넓어요</label>
						<input type="hidden" name="review_mood_large" value="${review.review_mood_large}">

						<input type="checkbox" id="review_mood_meeting_checkbox"${review.review_mood_meeting == 1 ? 'checked' : ''}>
						<label for="review_mood_meeting_checkbox" id="review_mood_meeting" class="checkbox_label">단체모임 하기 좋아요</label>
						<input type="hidden" name="review_mood_meeting" value="${review.review_mood_meeting}">

						<input type="checkbox" id="review_mood_view_checkbox"${review.review_mood_view == 1 ? 'checked' : ''}>
						<label for="review_mood_view_checkbox" id="review_mood_view" class="checkbox_label">뷰가 좋아요</label>
						<input type="hidden" name="review_mood_view" value="${review.review_mood_view}">
				</div>
				
				<div class="keyword_category">
					<h3>편의 시설/기타</h3>
						<input type="checkbox" id="review_etc_kind_checkbox"${review.review_etc_kind == 1 ? 'checked' : ''}>
						<label for="review_etc_kind_checkbox" id="review_etc_kind" class="checkbox_label">친절해요</label>
						<input type="hidden" name="review_etc_kind" value="${review.review_etc_kind}">

						<input type="checkbox" id="review_etc_parking_checkbox"${review.review_etc_parking == 1 ? 'checked' : ''}>
						<label for="review_etc_parking_checkbox" id="review_etc_parking" class="checkbox_label">주차하기 편해요</label>
						<input type="hidden" name="review_etc_parking" value="${review.review_etc_parking}">

						<input type="checkbox" id="review_etc_toilet_checkbox"${review.review_etc_toilet == 1 ? 'checked' : ''}>
						<label for="review_etc_toilet_checkbox" id="review_etc_toilet" class="checkbox_label">화장실이 깨끗해요</label>
						<input type="hidden" name="review_etc_toilet" value="${review.review_etc_toilet}">

						<input type="checkbox" id="review_etc_fast_checkbox"${review.review_etc_fast == 1 ? 'checked' : ''}>
						<label for="review_etc_fast_checkbox" id="review_etc_fast" class="checkbox_label">음식이 빨리 나와요</label>
						<input type="hidden" name="review_etc_fast" value="${review.review_etc_fast}">

						<input type="checkbox" id="review_etc_child_checkbox"${review.review_etc_child == 1 ? 'checked' : ''}>
						<label for="review_etc_child_checkbox" id="review_etc_child" class="checkbox_label">아이와 가기 좋아요</label>
						<input type="hidden" name="review_etc_child" value="${review.review_etc_child}">
				</div>
				<div class="keyword_category">
					<h3>&nbsp;&nbsp;&nbsp;&nbsp;</h3>
						<input type="checkbox" id="review_no_keyword_checkbox"${review.review_no_keyword == 1 ? 'checked' : ''}>
						<label for="review_no_keyword_checkbox" id="review_no_keyword" class="checkbox_label">선택할 키워드가 없어요</label>
						<input type="hidden" name="review_no_keyword" value="${review.review_no_keyword}">
				</div>
				<div class="separator"></div>
			</div>
		</div>
		<br> <br> <br>
		<div class="review_input_section">
			<div class="separator"></div>
			<h2 style="text-align: center;">리뷰를 남겨주세요</h2>
			<!-- 사진 추가 버튼 컨테이너 -->
		<div class="photo_box">
<!-- 		    <div class="file" id="fileItemArea1"> -->
		    <div class="file" id="fileItemArea">
		        <c:choose>
		            <c:when test="${not empty review.review_img_1}">
		                <div class="image_wrapper">
		                    <img src="${pageContext.request.contextPath}/resources/upload/${review.review_img_1}" alt="Image Preview" class="imagePreview"/>
		                    <!-- 수정된 removePreview 함수 호출 -->
<%-- 		                    <div class="remove_btn" onclick="deleteFile(${review.review_num}, '${review.review_img_1}')">X</div> --%>
		                    <div class="remove_btn" onclick="deleteFile(${review.review_num}, '${review.review_img_1}')">
                		        <img src="${pageContext.request.contextPath}/resources/img/close2.png" style="width: 20px; height: 20px;" alt="Delete">
		                    </div>
		                </div>
		            </c:when>
			            <c:otherwise>
						    <div class="photo_box">
							    <div class="file" id="fileItemArea1">
							        <input type="file" id="photoInput" name="file1" accept="image/*" style="display:none;"/>
							        <button type="button" id="photoBtn" class="photo_btn">
							            <i class="fas fa-camera"></i> 사진 추가
							        </button>
							        <div id="previewContainer" class="preview_container" style="display: none;">
								    	<div class="image_wrapper">
								      	  <img id="imagePreview" src="#" alt="Image Preview"/>
								        	<div class="remove_btn" onclick="removePreview()">
								            <img src="${pageContext.request.contextPath}/resources/img/close2.png" style="width: 20px; height: 20px;" alt="Delete">
											        </div>
											    </div>
											</div>
							            </div>
							        </div>
			            </c:otherwise>
			        </c:choose>
					    </div>
					</div>
			    </div>
			</div>
			<!-- ===================================================================== -->
			<!-- 리뷰 텍스트 박스 -->
			<textarea class="review_textarea" maxlength="500"
				name="review_content" placeholder="업주와 다른 사용자들이 상처받지 않도록 좋은 표현을 사용해주세요.(500자수 제한)">${review.review_content }</textarea>
			<a class="caution_link" href="#" onclick="openPopup()">리뷰 작성 유의사항</a>
			<section id="commandCell">
			<div class="review_input_section">
			<button class="register_button" onclick="location.href='${pageContext.request.contextPath}/review/complete'">수정하기</button>
			</div>
			</section>
			</form>
		</div>
	</div>
	<!-- ===================================================================== -->
	<!-- 팝업 창 -->
	<div id="popup">
		<h2>리뷰 작성 유의사항</h2>
		<p>
			<b>리뷰 작성 유의사항</b>
		<p>
		<p>
			리뷰 운영 정책을 위반한 경우, 통보 없이 리뷰를 숨김처리 하거나 회원의 리뷰 <br>작성 권한을 중지 또는 해지할
			수 있습니다.
		</p>

		<p>
			<ul>
				<li>잘못된 방문 인증이나 정상 이용 완료되지 않은 예약에 대해 리뷰를 작성한 경우</li><br>
				<li>장소와 무관한 내용이나 사진, 동일 문자의 반복 등 부적합한 내용을 포함한 경우</li><br>
				<li>욕설, 비방, 명예훼손을 포함한 내용이 포함한 내용이 있는 경우</li><br>
				<li>저작권, 초상권 등 타인의 권리, 명예, 신용, 기타 정당한 이익을 침해하는 경우</li>
			</ul><br>
			 더 자세한 이용 정책은 방문자리뷰 이용정책을 확인해주세요.
		</p>
			<button onclick="closePopup()">닫기</button>
	</div>
	<!-- ===================================================================== -->
	<!-- 토스트 메시지 -->
	 <div id="toastMessage" class="toast-message">좋아요가 반영되었습니다</div>
	</article>
</body>
</html>