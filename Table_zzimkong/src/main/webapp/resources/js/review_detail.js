document.addEventListener('DOMContentLoaded', function() {
    // 요소가 존재하는지 확인
//    let reviewCountsDataElement = document.getElementById('reviewCountsData');
//    if (reviewCountsDataElement) {
//        let reviewCountsJson = reviewCountsDataElement.getAttribute('data-review-counts');
//        let reviewCounts = JSON.parse(reviewCountsJson);
//
//        // 데이터 정렬 및 차트 데이터 준비
//        let sortedData = Object.entries(reviewCounts).sort((a, b) => b[1] - a[1]);
//        let labels = sortedData.map(item => item[0]);
//        let data = sortedData.map(item => item[1]);
//        
//        // 차트 생성
//        let ctx = document.getElementById('reviewChart').getContext('2d');
//        let myChart = new Chart(ctx, {
//            type: 'bar',
//            data: {
//                labels: labels, // 수정된 부분
//                datasets: [{
//                    label: '리뷰 카운트',
//                    data: data, // 수정된 부분
//                    backgroundColor: 'rgba(0, 123, 255, 0.5)',
//                    borderColor: 'rgba(0, 123, 255, 1)',
//                    borderWidth: 1
//                }]
//            },
//            options: {
//                scales: {
//                    y: {
//                        beginAtZero: true
//                    }
//                }
//            }
//        }); // 여기에 중괄호와 괄호를 닫아줍니다.
//    }
//    
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
}); // 여기에 중괄호를 닫습니다.

}); // 이것은 document.addEventListener의 끝을 나타냅니다.
