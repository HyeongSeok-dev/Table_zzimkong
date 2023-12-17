document.addEventListener('DOMContentLoaded', function() {
	/* 보기 버튼 눌렀을때 제일 우선으로 만드는 js */
    var infoLink = document.querySelector('.info-content'); // Ensure this matches the class of your link
    var infoPopup = document.getElementById('infoPopup'); // Ensure this is the ID of your popup
    var closeButton = document.getElementById('closePopup'); // Ensure this is the ID of your close button
    var headerLeft = document.querySelector('.header-left'); // Select the header-left div
    var bottomButtons = document.querySelector('.sticky_bottom_btns');

    // Show the popup when the link is clicked
    infoLink.addEventListener('click', function(event) {
        event.preventDefault();
        infoPopup.style.display = 'block';
        header.classList.add('hide-element');
        bottomButtons.classList.add('hide-element');

    });

    closeButton.addEventListener('click', function() {
        infoPopup.style.display = 'none';
        header.classList.remove('hide-element');
        bottomButtons.classList.remove('hide-element');
    });

    // Additional button functionalities
    document.getElementById('cancelButton').addEventListener('click', function() {
        window.close();
    });

    document.getElementById('reportButton').addEventListener('click', function() {
        alert('신고가 완료되었습니다.');
        window.close();
    });
});
