<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 출력 형식 변경을 위해 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	// [ 체크박스 선택 시 해당 리뷰출력 ]
	
	
	 
	// =================================================================	
	$(document).ready(function() {
	// =================================================================	
  // 체크박스와 정렬 링크의 이벤트 핸들러 설정
  //  $('.category_button, #photoReviewCheckbox').change(filterReviewsByCheckedMenus);

	// =================================================================	
	// 카테고리 체크박스 변경 감지
	    $('.category_button').change(function() {
	    	var selectedCategories = getSelectedCategories();
	        if (selectedCategories.length > 0) {
	            filterReviewsByCategories(selectedCategories);
	        } else {
	            // 모든 체크박스가 해제되면 원래의 리뷰 리스트를 불러옴
	            filterReviewsByCheckedMenus();
	        }
	    });
	    // 선택된 카테고리를 배열로 반환하는 함수
	    function getSelectedCategories() {
	        return $('.category_button:checked').map(function() {
	            return $(this).data('category');
	        }).get();
	    }

   // 카테고리 버튼 클릭 이벤트 핸들러
    $('.category_button').click(function() {
        var category = $(this).data('category');
        var comId = Number(getParameterByName('com_id'));
        loadReviewsByCategory(category,comId);
    });

	// 카테고리별 리뷰 로드 함수
	function loadReviewsByCategory(category,comId) {

	    $.ajax({
  			url: '/zzimkong/review/redetail/filterByCategory', 
	        type: 'GET',
	        data: { category: category, 
	        	comId: comId},
	        dataType: 'json',
	        success: function(reviews) {
	            displayReviews(reviews);
// 	            console.log("업체아이디!!!!! >>>>>>" + comId)
	        },
	        error: function(xhr, status, error) {
	            console.error("Error occurred: " + error);
	        }
	    });
	}
	
	// 리뷰 표시 함수
	function displayReviews(reviews) {
	    var reviewsContainer = $('#reviewsContainer');
	    reviewsContainer.empty();

	    reviews.forEach(function(review) {
	    
// 	   	console.log("Review ID:>>>>>>>>>>>>>>>>>>>>>>>>>", review.review_num, "Comment Count:", review.commentCount);
        // photoOnly가 true일 때, 이미지가 없는 리뷰는 건너뜀
        if (photoOnly && !review.review_img_1) {
            return;
        }

//         var reviewerName = review.user_nick; // user_nick이 없는 경우를 대비한 기본값 설정
        var commentCount = review.commentCount; // commentCount 추출
	    var formattedDate = formatDate(review.review_update); // 서버로부터 받은 review_update 값을 형식화
	    var deleteFormHtml = '';
	    var modifyButtonHtml = '';
	    var reportButtonHtml = '';


    // sId가 review.user_id와 같거나, sId가 'admin'일 경우에만 삭제 및 수정 버튼 생성
    if (sId === review.user_id || sId === 'admin') {
        deleteFormHtml = 
            '<form action="' + contextPath + '/zzimkong/review/delete" method="POST">' +
                '<input type="hidden" name="review_num" value="' + review.review_num + '">' +
                '<input type="submit" class="review_delete" value="삭제" onclick="return confirm(\'리뷰를 삭제하시겠습니까?\');">' +
            '</form>';

        modifyButtonHtml = 
            '<a href="modify?review_num=' + review.review_num + '">' +
                '<button class="review_modify">수정</button>' +
            '</a>';
    }	else {
        // sId가 review.user_id나 'admin'이 아닐 때만 신고 버튼 생성
        reportButtonHtml = 
            '<a href="' + contextPath + '/review/report?review_num=' + review.review_num + '&com_id=' + review.com_id + '" class="review_report_btn" role="button">리뷰 신고하기</a>';
    }

//     var reportButtonHtml = 
// '<a href="' + contextPath + '/review/report?review_num=' + ${reviewNum} + '&com_id=' + review.com_id + '" class="review_report_btn" role="button">리뷰 신고하기</a>';
    var imagePopupHtml = '';
    if (review.review_img_1) {
        imagePopupHtml = 
            '<div class="review_photos">' +
            		// 이미지경로 수정(240110) - 1
            	'<img src="${pageContext.request.contextPath}/resources/upload/' + review.review_img_1 + '" alt="Review Image">' +
//                 '<img src="' + contextPath + '/resources${pageContext.request.contextPath }/resources/upload/' + review.review_img_1 + '" alt="Review Image">' +
                '<div id="image-popup" class="image-popup" style="display: none;">' +
                    '<span class="close-popup">&times;</span>' +
                    '<img id="popup-img" class="popup-content">' +
                '</div>' +
            '</div>';
    }

    var reviewHtml = 
        '<ul class="review_list">' +
            '<li class="review_list1">' +
                '<div class="reviewer">' +
                    '<div class="reviewer_photo">' +
                        '<a href="#" target="_blank" class="profile_link">' +
                            '<div class="profile_image">' +
                                '<img src="' + contextPath + '/resources/img/profile.png" alt="프로필" width="38" height="38">' +
                            '</div>' +
                        '</a>' +
                    '</div>' +
                    '<div class="reviewer_info">' +
//                         '<div class="reviewer_name">' + review.user_id + '</div>' +
	                        '<div class="reviewer_name">' + review.user_nick + '</div>' +
                        '<div class="score1">' +
                            '<img src="' + contextPath + '/resources/img/review_star.png" width="15" height="15">' +
                            (review.review_score / 2).toFixed(1) +
                        '</div>' +
                    '</div>' +
                '</div>' +
                imagePopupHtml +
                '<p class="review_content">' + review.review_content + '</p>' +
                '<div class="review-actions">' +
                    '<div class="review-action1">' +
// 					'<i class="far fa-comment" data-review-num="' + review.review_num + '" style="cursor: pointer;" onclick="showCommentForm(this);"></i>' + commentCount + 
'<div class="comment-section">' +
    '<i class="far fa-comment" data-review-num="' + review.review_num + '" style="cursor: pointer;" onclick="showCommentForm(this);"></i>' + '<span class="comment_count_number">' + commentCount + '</span>' +'</div>'+
//   						  '<i class="far fa-heart" id="heartIcon" style="cursor: pointer;"></i>' + // 리뷰 좋아요 보류
                    '</div>' +
                    '<div class="review-action2">' +
                        '<div class="review-action-buttons">' +
                            deleteFormHtml +
                            modifyButtonHtml +
                            reportButtonHtml +
                        '</div>' +
                        '<span class="comment-icon" onclick="showCommentForm()"></span><br><br>'
    				    '<div class="review_date">' + formattedDate + ' 작성</div>' + 
               		  '<div class="separator"></div>' + 
                    '</div>' +
                '</div>' +
            '</li>' +
        '</ul>';

    $('#reviewsContainer').append(reviewHtml);
	});

}


// ==============================================================================================

// [html]

	<div class="category_buttons">
	    <span class="menu_select_subject">&nbsp;&nbsp;&nbsp;&nbsp;특징&nbsp;</span>
	
	    <label class="category_label" data-category="taste">
	        <input type="checkbox" class="category_button" data-category="taste">
	        <span class="button_text">맛 ${categoryCount.review_category_count_taste}</span>
	    </label>
	
	    <label class="category_label" data-category="satisfaction">
	        <input type="checkbox" class="category_button" data-category="satisfaction">
	        <span class="button_text">만족도 ${categoryCount.review_category_count_satisfaction}</span>
	    </label>
	
	    <label class="category_label" data-category="service">
	        <input type="checkbox" class="category_button" data-category="service">
	        <span class="button_text">서비스 ${categoryCount.review_category_count_service}</span>
	    </label>
	
	    <label class="category_label" data-category="waiting">
	        <input type="checkbox" class="category_button" data-category="waiting">
	        <span class="button_text">대기 시간 ${categoryCount.review_category_count_waiting}</span>
	    </label>
	
	    <label class="category_label" data-category="quantity">
	        <input type="checkbox" class="category_button" data-category="quantity">
	        <span class="button_text">음식량 ${categoryCount.review_category_count_quantity}</span>
	    </label>
	</div>
	
 // [html내 ajax 출력되는 곳]
 	<div class="reviews_container" id="reviewsContainer">
 	

