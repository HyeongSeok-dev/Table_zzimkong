document.addEventListener('DOMContentLoaded', function() {
    var carouselInner = document.querySelector('.carousel-inner');
    var images = Array.from(carouselInner.children);
    var imageWidth = images[0].getBoundingClientRect().width;

    images.forEach(function(img, idx) {
        img.style.left = imageWidth * idx + 'px';
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
        
	// 사진 넘기기 
    document.querySelector('.carousel-next').addEventListener(
        'click',
        function() {
            if (currentIndex < images.length - 1) {
                currentIndex++;
                carouselInner.style.transform = 'translateX('
                    + (-imageWidth * currentIndex) + 'px)';
            }
        });

    var moreButton = document.querySelector('.more-button');
    var hiddenItems = document.querySelectorAll('.rv_sl_1:nth-child(n+6)');
    var svgIcon = moreButton.querySelector('.svg-icon');
    var buttonText = moreButton.querySelector('.blind-text');

    moreButton.addEventListener(
        'click',
        function(event) {
            event.preventDefault();

            hiddenItems.forEach(function(item) {
                item.style.display = (item.style.display === 'none' || item.style.display === '') ? 'block'
                    : 'none';
            });

            if (buttonText.textContent.trim() === '더보기') {
                buttonText.textContent = '접기';
                svgIcon.style.transform = 'rotate(180deg)'; // 아이콘 뒤집기
            } else {
                buttonText.textContent = '더보기';
                svgIcon.style.transform = 'rotate(0deg)'; // 원래 아이콘
            }
        });
        
        	
	// 하트누르기 
    document.getElementById('heartIcon').addEventListener('click',
        function() {
            this.classList.toggle('far');
            this.classList.toggle('fas');
            this.classList.toggle('filled');
        });
});


	// 삭제 팝업창
//    document.addEventListener('DOMContentLoaded', function() {
//    // 팝업을 숨김
//    var popup = document.getElementById('deleteConfirmationPopup');
//    popup.style.display = 'none';
//
//    // "삭제" 버튼 클릭 이벤트 리스너
//    var deleteButtons = document.querySelectorAll('.review_delete');
//    deleteButtons.forEach(function(deleteButton) {
//        deleteButton.addEventListener('click', function(event) {
//            // 팝업의 위치를 계산
//            var buttonRect = deleteButton.getBoundingClientRect();
//            var top = window.scrollY + buttonRect.top + buttonRect.height; // 버튼 아래에 표시
//            var left = window.scrollX + buttonRect.left - popup.offsetWidth / 2 + deleteButton.offsetWidth / 2; // 버튼 가운데 정렬
//
//            // 팝업
//            popup.style.top = top + 'px';
//            popup.style.left = left + 'px';
//            popup.style.display = 'block';
//        });
//    });
//
//    // "네" 클릭 이벤트 리스너
//    var confirmDeleteButton = document.getElementById('confirmDelete');
//    confirmDeleteButton.addEventListener('click', function() {
//        // 삭제 로직
//        popup.style.display = 'none';
//        //삭제 서버 요청
//    });
//
//    // "아니오" 버튼 클릭이벤트
//    var cancelDeleteButton = document.getElementById('cancelDelete');
//    cancelDeleteButton.addEventListener('click', function() {
//        popup.style.display = 'none';
//    });
//});
