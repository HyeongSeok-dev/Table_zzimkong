<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 출력 형식 변경을 위해 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1" />
<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review_detail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Js -->
<script
	src="${pageContext.request.contextPath}/resources/js/review_detail.js"></script>
</head>
<body>
	<div class="restaurant_name">
		<h2>&nbsp; ${comName}</h2>
		<div class="separator"></div>
	</div>
	<br>
	<br>
	<br>
	<div class="average">
		<h5>
			<span>${reviewCount}개 리뷰 별점 평균</span>
		</h5>
		<br>
		<div class="score">
<!-- 			<strong>4.8</strong> -->
			<strong>${reviewAverage}</strong>
<%-- 			<h3>${reviewAverage}</h3> --%>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="review_container">
		<h2 class="place_reason">
			이런 점이 좋았어요&nbsp;
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15 15"
				class="question_mark" aria-hidden="true">    
				<path d="M7.5 14.97a7.62 7.62 0 01-2.88-.55 7.25 7.25 0 01-2.44-1.62 7.25 7.25 0 01-1.61-2.43A7.81 7.81 0 010 7.5a7.25 7.25 0 01.55-2.88 7.44 7.44 0 011.63-2.43A7.45 7.45 0 014.62.55 7.27 7.27 0 017.5 0c1.01.01 1.97.2 2.88.57a7.25 7.25 0 012.43 1.61 7.25 7.25 0 011.62 2.43A7.81 7.81 0 0115 7.5a7.25 7.25 0 01-.55 2.88 7.44 7.44 0 01-1.63 2.43A7.45 7.45 0 017.5 15v-.03zM7.5 1a6.3 6.3 0 00-3.25.88 6.59 6.59 0 00-2.37 2.37A6.3 6.3 0 001 7.5c0 1.17.3 2.25.88 3.25a6.59 6.59 0 002.37 2.37A6.3 6.3 0 007.5 14c.87 0 1.7-.16 2.5-.49a6.4 6.4 0 002.1-1.4A6.4 6.4 0 0013.51 10a6.5 6.5 0 000-5 6.4 6.4 0 00-1.4-2.1A6.4 6.4 0 0010 1.49 6.5 6.5 0 007.5 1zM5 5.31C5.06 4.02 5.9 3 7.54 3 9 3 10 3.93 10 5.16c0 .93-.47 1.59-1.22 2.05-.73.45-.94.78-.94 1.4V9H6.82v-.55c0-.78.37-1.32 1.16-1.8.68-.43.94-.8.94-1.44 0-.74-.56-1.28-1.43-1.28-.87 0-1.43.53-1.5 1.38H5zm2.5 6.19a.74.74 0 01-.75-.75c0-.43.33-.75.75-.75.43 0 .75.32.75.75 0 .42-.32.75-.75.75z"></path>
			</svg>
		</h2>
		<div class="review_write_button">
		    <a href="write"><i class="fas fa-pencil-alt"></i> 리뷰쓰기</a>
		</div>
	</div>
	<div class="review_select">
		<ul class="review_select_list">
			<li class="rv_sl_1">
				<div class="review_select_chart_1"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_interior.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(분위기) 인테리어가 멋져요"</span> 
					<span class="review_select_chart_count"> <span class="review_blind">이 키워드를 선택한 인원</span>126 
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_2"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_alone.png" alt="" width="22" height="22" data-grid-lazy="false">
					<span class="review_select_chart_content">&nbsp;&nbsp;"(분위기) 혼밥하기 좋아요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_3"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_big.png" alt="" width="22" height="22" data-grid-lazy="false">
					<span class="review_select_chart_content">&nbsp;&nbsp;"(분위기) 매장이 넓어요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_4"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_many.png" alt="" width="22" height="22" data-grid-lazy="false">
					<span class="review_select_chart_content">&nbsp;&nbsp;"(분위기) 단체모임 하기 좋아요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_5"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_view.png" alt="" width="22" height="22" data-grid-lazy="false">
					<span class="review_select_chart_content">&nbsp;&nbsp;"(분위기) 뷰가 좋아요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_6"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_rice.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(음식/가격) 양이 많아요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_7"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_deli.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(음식/가격)음식이 맛있어요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_8"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_money.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(음식/가격)가성비가 좋아요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_9"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_fresh.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(음식/가격)재료가 신선해요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_10"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_nice.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(음식/가격)메뉴가 알차요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_11"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_kind.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(편의시설/기타)친절해요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_12"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_toilet.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(편의시설/기타)화장실이 깨끗해요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_13"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_hurry.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(편의시설/기타)음식이 빨리나와요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_14"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_child.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(편의시설/기타)아이와 가기 좋아요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
			<li class="rv_sl_1">
				<div class="review_select_chart_15"></div>
				<div class="review_select_chart_1_1">
					<img src="${pageContext.request.contextPath}/resources/img/review_couch.png" alt="" width="22" height="22" data-grid-lazy="false"> 
					<span class="review_select_chart_content">&nbsp;&nbsp;"(편의시설/기타)좌석이 편해요"</span>
					<span class="review_select_chart_count">
					<span class="review_blind">이 키워드를 선택한 인원</span>126</span>
				</div>
			</li>
		</ul>
		<a href="#" target="_self" role="button" class="more-button"> <svg
				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15 8"
				class="svg-icon" aria-hidden="true">
        <path
					d="M7.5 8c-.2 0-.5-.1-.7-.3l-6.5-6C-.1 1.3-.1.7.2.3c.4-.4 1-.4 1.4-.1l5.8 5.4L13.2.2c.4-.4 1-.3 1.4.1.4.4.3 1-.1 1.4L8 7.7c0 .2-.3.3-.5.3z"></path>
    </svg> <span class="blind_text">더보기</span>
		</a>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h2 class="review_photo_subject">사진/영상리뷰</h2>
	<div class="carousel">
		<div class="carousel-inner">
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
			<img src="${pageContext.request.contextPath}/resources/img/soba.jpeg" alt="이미지 1"> 
		</div>
		<div class="carousel-prev">&#10094;</div>
		<div class="carousel-next">&#10095;</div>
	</div>
	<div class="separator"></div>
	<div class="review_main_subject">
		<h2 class="review_subject">
			리뷰&nbsp;<span class="review_subject_count">${reviewCount}</span>
		</h2>
		<label class="checkbox-container"><input type="checkbox"><span
			class="checkmark"></span>사진/영상 리뷰만 
	</div>
	</div>
	<div class="menu_select">
		<span class="menu_select_subject">&nbsp;&nbsp;&nbsp;&nbsp;메뉴&nbsp;</span>
			<button class="menu_button" id="mazeBtn">마제소바</button>
			<button class="menu_button" id="mazeBtn">껍데기</button>
			<button class="menu_button" id="mazeBtn">라멘</button>
			<button class="menu_button" id="mazeBtn">돈코츠라멘</button>
			<button class="menu_button" id="mazeBtn">하이볼</button>
	</div>
	<br>
	<div class="menu_select">
		<span class="menu_select_subject">&nbsp;&nbsp;&nbsp;&nbsp;특징&nbsp;</span>
			<button class="menu_button" id="mazeBtn">맛</button>
			<button class="menu_button" id="mazeBtn">만족도</button>
			<button class="menu_button" id="mazeBtn">서비스</button>
			<button class="menu_button" id="mazeBtn">대기시간</button>
			<button class="menu_button" id="mazeBtn">음식량</button>
	</div>
	<br>
	<br>
	<div class="reviewer_order">최신순 | 별점순 | 좋아요순</div>
	<div class="separator"></div>
	<!-- ========================================================================================= -->
	<c:forEach items="${reviews}" var="review">
	<ul class="review_list">
		<li class="review_list1">
			<div class="reviewer">
			<div class="reviewer_photo">
				<a href="사용자 사진 크게보기" target="_blank" role="button" class="profile_link">
					<div class="profile_image">
						<img src="${pageContext.request.contextPath}/resources/img/person.png" alt="프로필" width="38" height="38">
					</div>
				</a>	 
					<!-- 사용자가 썼던 리뷰를 볼 수 있는 창 연결 -->
				 <a href="마이페이지 프로필 연결" target="_blank" role="button" class="review_details">
<!-- 					<div class="reviewer_name">사용자닉네임</div> -->
					<div class="reviewer_name">${review.user_id}</div>
				</a>
			</div>
			<div class="reviewer_info"></div>
			<div class="review_photos">
	        	<c:if test="${not empty review.review_img_1}">
					<img src="${pageContext.request.contextPath}/resources/upload/${review.review_img_1}" alt="Review Image" />
					<div id="image-popup" class="image-popup" style="display: none;">
					    <span class="close-popup">&times;</span>
					    <img id="popup-img" class="popup-content">
					</div>
	        	</c:if>
			</div>
			<p class="review_content">${review.review_content}</p>
			<div class="review-actions">
					<div class="review-action1">
						<i class="far fa-comment" id="commentIcon" style="cursor: pointer;"></i>
						<!-- 댓글 아이콘 -->
						<i class="far fa-heart" id="heartIcon" style="cursor: pointer;"></i>
						<!-- 하트 아이콘 -->
					</div>
				</div>
			</div>
		</div>
		<br>
				<div class="review-actions">
					<div class="review-action2">
				<!-- 				<button class="review_delete">삭제</button> -->
					<!-- ======================================================= -->
<%-- 				<a href="/review/modify?review_num=${review.review_num}" class="review_modify">수정</a> --%>
<!-- 				<input type="submit" class="review_delete" value="삭제" -->
<!-- 				    onclick="if(!confirm('리뷰를 삭제하시겠습니까?')){return false;}"/>					 -->
									
					<!-- ======================================================= -->
<!-- 			<input type="submit" class="review_delete" value="삭제" -->
<!-- 					onclick="if(!confirm('리뷰를 삭제하시겠습니까?')){return false;}" /> -->
				<form action="review/delete" method="POST">
	   			 	<input type="hidden" name="review_num" value="${review.review_num}">
	    			<input type="submit" class="review_delete" value="삭제" onclick="if(!confirm('리뷰를 삭제하시겠습니까?')){return false;}">
				</form>
<%-- 				<input type="button" class="review_delete" value="삭제" onclick="deleteReview(${review.review_num})"/> --%>
					
					
					
				<a href="/review/modify?review_num=${review.review_num}">		
				<button class="review_modify">수정</button></a>

				<a href="${pageContext.request.contextPath}/review/report">
					<button class="review_report_btn">리뷰 신고하기</button>
				</a> <span class="comment-icon" onclick="showCommentForm()"></span><br>
			   <br>
			   </div>
			</div>
		</li>
	</ul>
	<br><br><br><br>
	</c:forEach>
	<!-- ========================================================================================= -->
	<br><br><br><br><br><br><br><br><br><br>
	<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>