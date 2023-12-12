document.addEventListener('DOMContentLoaded', function() {

    // 팝업 열기
    window.openPopup = function() {
        document.getElementById('popup').style.display = 'block';
    }

    // 팝업 닫기
    window.closePopup = function() {
        document.getElementById('popup').style.display = 'none';
    }

    // 사진추가 팝업창
    document.getElementById('photoBtn').addEventListener('click', function() {
        document.getElementById('photoInput').click();
    });

    // 사진 업로드 서버전송
    document.getElementById('photoInput').addEventListener('change', function() {
        var file = this.files[0];
        var formData = new FormData();
        formData.append('photo', file);

        fetch('https://your-api-url.com/upload', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => console.log(data))
            .catch(error => console.error(error));
    });

    // 이런 곳 좋아요 버튼 효과 
    var likeButton = document.getElementById('likeButton');
    likeButton.addEventListener('click', function() {
        this.classList.toggle('active');
    });

});

