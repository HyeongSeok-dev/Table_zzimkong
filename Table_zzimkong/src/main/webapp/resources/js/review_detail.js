
	// ===========================================================
	function formatDate(dateString) {
    var options = { year: '2-digit', month: '2-digit', day: '2-digit', weekday: 'short' };
    return new Intl.DateTimeFormat('ko-KR', options).format(new Date(dateString));
}
	
	function sortReviews(sortType) {
		console.log("Sorting reviews by: >>>>>>>>>>>>>>>>>>>>> " + sortType); // 로그 출력으로 함수 호출 확인
	    var comId = getParameterByName('com_id'); // com_id 값을 가져옴

	    $.ajax({
    url: '/zzimkong/review/redetail/sortedReviews', // 컨텍스트 경로를 포함한 전체 경로
			type: 'GET',
	        data: {
	            comId: comId, // comId 변수의 값이 정의되어 있어야 합니다.
	            sortType: sortType // 'newest', 'highest', 'lowest', 'likes' 등
	        },
	        dataType: 'json', // 서버로부터 JSON 형태의 응답을 기대
	        success: function(response) {
	            // response 형식이 JSON이고, reviews 배열을 포함하는지 확인 필요
	          	console.log("Response received: >>>>>>>>>>>>>>> ", response);
	            var reviews = response;
	            var reviewsContainer = $('#reviewsContainer');
//	            var reviewUpdate = review.review_update;
//       			console.log('Review update date:', reviewUpdate); // 여기에서 날짜 확인


	            reviewsContainer.empty(); // 기존 리뷰 목록을 비움

	reviews.forEach(function(review) {
//    console.log(review.review_update); // 날짜 값 확인	
//    var formattedDate = formatDate(review.review_update); // 날짜 포맷팅
    var formattedDate = formatDate(review.review_update); // 서버로부터 받은 review_update 값을 형식화

	
    var deleteFormHtml = 
        '<form action="' + contextPath + '/zzimkong/review/delete" method="POST">' +
            '<input type="hidden" name="review_num" value="' + review.review_num + '">' +
            '<input type="submit" class="review_delete" value="삭제" onclick="return confirm(\'리뷰를 삭제하시겠습니까?\');">' +
        '</form>';

    var modifyButtonHtml = 
        '<a href="modify?review_num=' + review.review_num + '">' +
            '<button class="review_modify">수정</button>' +
        '</a>';

    var reportButtonHtml = 
        '<a href="' + contextPath + '/review/report" class="review_report_btn" role="button">리뷰 신고하기</a>';

    var imagePopupHtml = '';
    if (review.review_img_1) {
        imagePopupHtml = 
            '<div class="review_photos">' +
                '<img src="' + contextPath + '/resources/upload/' + review.review_img_1 + '" alt="Review Image">' +
                '<div id="image-popup" class="image-popup" style="display: none;">' +
                    '<span class="close-popup">&times;</span>' +
                    '<img id="popup-img" class="popup-content">' +
                '</div>' +
            '</div>';
    }
//	var formattedDate = formatDate(review.review_update);

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
                        '<div class="reviewer_name">' + review.user_id + '</div>' +
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
                        '<i class="far fa-comment" id="commentIcon" style="cursor: pointer;"></i>' +
                        '<i class="far fa-heart" id="heartIcon" style="cursor: pointer;"></i>' +
                    '</div>' +
                    '<div class="review-action2">' +
                        '<div class="review-action-buttons">' +
                            deleteFormHtml +
                            modifyButtonHtml +
                            reportButtonHtml +
                        '</div>' +
                        '<span class="comment-icon" onclick="showCommentForm()"></span><br><br>' +
    				    '<div class="review_date">' + formattedDate + ' 작성</div>' + 
//                    '<div class="review_date">' + formattedDate + ' 작성</div>' + 
						 '<div class="separator"></div>' + 
                    '</div>' +
                '</div>' +
            '</li>' +
        '</ul>';

    $('#reviewsContainer').append(reviewHtml);
});
	        },
	        error: function(error) {
	            console.error("Error: ", error);
	        }
	    });
	}
	
$(document).ready(function() {
    sortReviews('newest'); // 페이지 로드 시 최신순 정렬을 기본값으로 설정
    
      // 리뷰 컨테이너 내에서 댓글 및 하트 아이콘에 대한 이벤트 위임
    $('#reviewsContainer').on('click', '.fa-comment, .fa-heart', function() {
        // 댓글 아이콘 클릭 이벤트
        if ($(this).hasClass('fa-comment')) {
            var contextRoot = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
            var url = contextRoot + "/review/comment";
            var windowName = "commentPopup";
            var windowSize = "width=515,height=632";
            window.open(url, windowName, windowSize);
        }

        // 하트 아이콘 클릭 이벤트
        if ($(this).hasClass('fa-heart')) {
            $(this).toggleClass('far').toggleClass('fas').toggleClass('filled');
        }
    });

});
	// ===================================================================
document.addEventListener('DOMContentLoaded', function() {

	// ===================================================================
	// 정렬 링크를 찾음
    var sortLinks = document.querySelectorAll('.sort-link');
    sortLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            // 이벤트의 기본 동작을 방지
            event.preventDefault();

            // data-sort-type 속성에서 정렬 타입을 읽음
            var sortType = this.getAttribute('data-sort-type');
            sortReviews(sortType);
        });
    });
	// ===================================================================
	// 댓글 아이콘 팝업
	 var commentIcons = document.querySelectorAll('.fa-comment');

   	 commentIcons.forEach(function(commentIcon) {
        commentIcon.addEventListener('click', function() {
            var contextRoot = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
            var url = contextRoot +  "/review/comment";
            var windowName = "commentPopup";
            var windowSize = "width=500,height=600";

            window.open(url, windowName, windowSize);
        });
    });
    
	// ===================================================================
    // 최신 리뷰 목록을 불러오기
    sortReviews('newest');

	// ===================================================================
	// 하트 아이콘(좋아요)
    var heartIcons = document.querySelectorAll('.fa-heart');

    heartIcons.forEach(function(heartIcon) {
        heartIcon.addEventListener('click', function() {
            this.classList.toggle('far');
            this.classList.toggle('fas');
            this.classList.toggle('filled');
        });
    });

	// ===================================================================
	// 사진 넘기기 
	var carouselInner = document.querySelector('.carousel-inner');
	var images = Array.from(carouselInner.children);
	var imageWidth = images[0].getBoundingClientRect().width;

	images.forEach(function(img, idx) {
		img.style.left = imageWidth * idx + 'px';
	});

	document.querySelector('.carousel-next').addEventListener(
		'click',
		function() {
			if (currentIndex < images.length - 1) {
				currentIndex++;
				carouselInner.style.transform = 'translateX('
					+ (-imageWidth * currentIndex) + 'px)';
			}
		});


	var currentIndex = 0;
	document.querySelector('.carousel-prev').addEventListener(
		'click',
		function() {
			if (currentIndex > 0) {
				currentIndex--;
				carouselInner.style.transform = 'translateX('
					+ (-imageWidth * currentIndex) + 'px)';
			}
		});

	// ===================================================================
	// 리뷰 메뉴버튼 
	document.querySelectorAll('.menu_button').forEach(button => {
		button.addEventListener('click', function() {
			this.classList.toggle('active');
		});
	});

	// ===================================================================
	var deleteButtons = document.querySelectorAll('.review_delete');
deleteButtons.forEach(function(deleteButton) {
    deleteButton.addEventListener('click', function(event) {
        // 팝업창을 표시
        deleteConfirmationPopup.style.display = 'block';

        // 기본 이벤트 방지 (링크 이동 등)
        event.preventDefault();
    });
}); 

}); //document.addEventListener의 끝

