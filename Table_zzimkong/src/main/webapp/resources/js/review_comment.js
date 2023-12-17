document.addEventListener('DOMContentLoaded', function() {
    var submitCommentButton = document.querySelector('.submit-comment');
    var closeButton = document.getElementById('closeButton');

    submitCommentButton.addEventListener('click', function() {
        alert('댓글 작성이 완료되었습니다.');
        // 댓글을 서버에 저장하는 로직 추가
    });

//    closeButton.addEventListener('click', function() {
//        window.close(); // 현재 창을 닫습니다.
//    });
});
