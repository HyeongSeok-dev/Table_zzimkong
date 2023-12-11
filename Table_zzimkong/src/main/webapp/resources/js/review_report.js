document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('cancelButton').addEventListener('click', function() {
        window.close();
    });

    document.getElementById('reportButton').addEventListener('click', function() {
        alert('신고가 완료되었습니다.');
        window.close();
    });
});
