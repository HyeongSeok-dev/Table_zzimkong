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

    document.getElementById('heartIcon').addEventListener('click',
        function() {
            this.classList.toggle('far');
            this.classList.toggle('fas');
            this.classList.toggle('filled');
        });
});
