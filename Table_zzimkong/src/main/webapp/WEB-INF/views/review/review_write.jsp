<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/css/review_write.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/review_write.js"></script>
<!-- ==================================================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- ==================================================================================== -->

<title>리뷰 작성 페이지</title>

</head>
<body>
	<article id="reviewWriteForm">
	<div class="container">
		<div class="restaurant_info">
<!-- 			 <a href="detail?com_id=1"><h1>음식점 이름</h1></a> -->
			 <a href="redetail?com_id=1"><h1>음식점 이름</h1></a>
			 <!--            ~~~~~~~~~ : 나중에 ${com_id}로 고쳐서 값 받아오기 -->
<!-- 			 <input type="submit" value="음식점 이름" onclick="location.href=detail"> -->
			<p>몇번째 방문</p>
			<p>먹은 메뉴</p>
		</div>
		<form action="reviewWritePro" name="reviewWriteForm" method="POST" enctype="multipart/form-data">
		<div class="separator"></div>
		<div class="review_rate_1" style="text-align: center;">
		<fieldset class="review_rate">
             <input type="radio" id="rating10" name="review_score" value="10"><label for="rating10" title="5점"></label>
             <input type="radio" id="rating9" name="review_score" value="9"><label class="half" for="rating9" title="4.5점"></label>
             <input type="radio" id="rating8" name="review_score" value="8"><label for="rating8" title="4점"></label>
             <input type="radio" id="rating7" name="review_score" value="7"><label class="half" for="rating7" title="3.5점"></label>
             <input type="radio" id="rating6" name="review_score" value="6"><label for="rating6" title="3점"></label>
             <input type="radio" id="rating5" name="review_score" value="5"><label class="half" for="rating5" title="2.5점"></label>
             <input type="radio" id="rating4" name="review_score" value="4"><label for="rating4" title="2점"></label>
             <input type="radio" id="rating3" name="review_score" value="3"><label class="half" for="rating3" title="1.5점"></label>
             <input type="radio" id="rating2" name="review_score" value="2"><label for="rating2" title="1점"></label>
             <input type="radio" id="rating1" name="review_score" value="1"><label class="half" for="rating1" title="0.5점"></label>
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
			<!-- ===================================================================== -->
			<label class="like_button" id="likeButton">
			    <input type="checkbox" name="review_like" value="true" style="display: none;"/>
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
				        <input type="checkbox" id="review_food_big" class="hidden_checkbox" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_food_big" value="0">
				        <label for="review_food_big" class="keyword_btn">양이 많아요</label>
				      
						<input type="checkbox" id="review_food_deli" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_food_deli" value="0">
				        <label for="review_food_deli">음식이 맛있어요</label>
				        
						<input type="checkbox" id="review_food_cheap" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_food_cheap" value="0">
				        <label for="review_food_cheap">가성비가 좋아요</label>
				        
						<input type="checkbox" id="review_food_fresh" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_food_fresh" value="0">
				        <label for="review_food_fresh">재료가 신선해요</label>
				        
						<input type="checkbox" id="review_food_healthy" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_food_healthy" value="0">
				        <label for="review_food_healthy">건강한 맛이에요</label>
				</div>
				
				<div class="keyword_category">
					<h3>분위기</h3>
						<input type="checkbox" id="review_mood_interior" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_mood_interior" value="0">
				        <label for="review_mood_interior">인테리어가 멋져요</label>
				        
						<input type="checkbox" id="review_mood_alone" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_mood_alone" value="0">
				        <label for="review_mood_alone">혼밥하기 좋아요</label>
				        
						<input type="checkbox" id="review_mood_large" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_mood_large" value="0">
				        <label for="review_mood_large">매장이 넓어요</label>
				        
						<input type="checkbox" id="review_mood_meeting" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_mood_meeting" value="0">
				        <label for="review_mood_meeting">단체모임 하기 좋아요</label>
				        
						<input type="checkbox" id="review_mood_view" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_mood_view" value="0">
				        <label for="review_mood_view">뷰가 좋아요</label>
				</div>
				
				<div class="keyword_category">
					<h3>편의 시설/기타</h3>
						<input type="checkbox" id="review_etc_kind" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_etc_kind" value="0">
				        <label for="review_etc_kind">친절해요</label>
				        
						<input type="checkbox" id="review_etc_parking" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_etc_parking" value="0">
				        <label for="review_etc_parking">주차하기 편해요</label>
				        
						<input type="checkbox" id="review_etc_toilet" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_etc_toilet" value="0">
				        <label for="review_etc_toilet">화장실이 깨끗해요</label>
				        
						<input type="checkbox" id="review_etc_fast" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_etc_fast" value="0">
				        <label for="review_etc_fast">음식이 빨리 나와요</label>
				        
						<input type="checkbox" id="review_etc_child" onclick="updateCheckboxValue(this);">
				        <input type="hidden" name="review_etc_child" value="0">
				        <label for="review_etc_child">아이와 가기 좋아요</label>
				</div>
				<div class="keyword_category">
					<h3>&nbsp;&nbsp;&nbsp;&nbsp;</h3>
				        <input type="checkbox" id="review_no_keyword" onclick="toggleKeywords(this);">
				        <input type="hidden" name="review_no_keyword" value="0">
				        <label for="review_no_keyword">선택할 키워드가 없어요</label>
				</div>
				<div class="separator"></div>
			</div>
		</div>
		<br> <br> <br>
		<div class="review_input_section">
			<div class="separator"></div>
			<h2 style="text-align: center;">리뷰를 남겨주세요</h2>
			<!-- ==================================================================================================== -->
<!-- 			<button class="photo_btn" id="photoBtn" name="file1" style="text-align: center;"> -->
<!-- 			<i class="fas fa-camera"></i> 사진 추가  -->
<!-- 			<span style="color: gray; font-size: 0.8em;"> (최대 5장) </span> -->
<!-- 			</button> -->
			<!-- =============== 새로 한거 ===================================================================================== -->
<!-- 			<div> -->
<!-- 			<input type="file" id="photoInput" name="file1" accept="image/*" style="display: inline;"/> -->
<!-- 		    <img id="imagePreview" src="#" alt="Image Preview" style="display: none;"/>	 -->
<!-- 			</div> -->
			<!-- ==================================================================================================== -->
<!-- 				<div class="filebox clearfix"> -->
<!-- 				    <div class="inputFile"> -->
<!-- 				        <label for="AddImgs" class="addImgBtn">+</label> -->
<!-- 				        <input type="file" id="AddImgs" class="upload-hidden" accept=".jpg, .png, .gif"> -->
<!-- 				    </div> -->
<!-- 				    <ul id="Preview" class="sortable"></ul> -->
<!-- 				</div> -->
 			 <!-- ================================================================================================= -->
<!-- 			<div class="photo_box"> -->
<!-- 			    <input type="file" id="photoInput" name="file1" accept="image/*" style="display: inline;"/> -->
<!-- 			    이미지 프리뷰를 위한 img 태그와 컨테이너 div 추가 -->
<!-- 			    <div id="previewContainer" style="display: none;"> -->
<!-- 			        <img id="imagePreview" src="#" alt="Image Preview" style="display: block;"/> -->
<!-- 			        이미지 제거를 위한 버튼 추가, onclick 이벤트에 removePreview 함수 연결 -->
<!-- 			        <button type="button" onclick="removePreview()">Remove</button> -->
<!-- 			    </div> -->
<!-- 			</div>			  -->
			<!-- ================================================================================================= --> 
			<!-- 사진 추가 버튼 컨테이너 -->
			<div class="photo_box">
		    <input type="file" id="photoInput" name="file1" accept="image/*" style="display: none;"/>
		    <button type="button" id="photoBtn" class="photo_btn">
		        <i class="fas fa-camera"></i> 사진 추가
		    </button>
		    <div id="previewContainer" class="preview_container" style="display: none;">
		        <div class="image_wrapper">
		            <img id="imagePreview" src="#" alt="Image Preview"/>
		            <div class="remove_btn" onclick="removePreview()">X</div>
		        </div>
		    </div>
			</div>
			<!-- ================================================================================================= -->
			<textarea class="review_textarea"
				name="review_content" placeholder="업주와 다른 사용자들이 상처받지 않도록 좋은 표현을 사용해주세요."></textarea>
			<a class="caution_link" href="#" onclick="openPopup()">리뷰 작성 유의사항</a>
			<section id="commandCell">
<!-- 			<input type="submit" value="등록" a href="complete"> -->
<%-- 			<button class="register_button" onclick="location.href='${pageContext.request.contextPath}/review/complete'">등록하기</button> --%>
			<button class="register_button" onclick="location.href='${pageContext.request.contextPath}/review/complete'">등록하기</button>
			</section>
		</div>
	</form>
	</div>
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
			<li>잘못된 방문 인증이나 정상 이용 완료되지 않은 예약에 대해 리뷰를 작성한 경우</li>
			<br>
			<li>장소와 무관한 내용이나 사진, 동일 문자의 반복 등 부적합한 내용을 포함한 경우</li>
			<br>
			<li>욕설, 비방, 명예훼손을 포함한 내용이 포함한 내용이 있는 경우</li>
			<br>
			<li>저작권, 초상권 등 타인의 권리, 명예, 신용, 기타 정당한 이익을 침해하는 경우</li>
		</ul>
		<br> 더 자세한 이용 정책은 방문자리뷰 이용정책을 확인해주세요.
		</p>
		<button onclick="closePopup()">닫기</button>
	</div>
	<!-- 토스트 메시지 -->
	<div id="toastMessage" class="toast-message">좋아요가 반영되었습니다</div>
	</article>
</body>
</html>