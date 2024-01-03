document.addEventListener('DOMContentLoaded', function() {
    function updateCheckboxValue(checkbox) {
        if (checkbox.id === 'review_like') {
            // 좋아요 체크박스는 별도의 로직을 사용
            return;
        }

        var hiddenInput = document.querySelector('input[type="hidden"][name="' + checkbox.id.replace("_checkbox", "") + '"]');
        if (!hiddenInput) {
            console.error('Hidden input not found for checkbox: ' + checkbox.id);
            return;
        }

        hiddenInput.value = checkbox.checked ? "1" : "0";
        var label = document.querySelector('label[for="' + checkbox.id + '"]');
        if (checkbox.checked) {
            label.classList.add('active');
        } else {
            label.classList.remove('active');
        }
    }

    // 체크박스 초기화 및 이벤트 리스너 설정
    document.querySelectorAll('.keyword_section input[type="checkbox"]').forEach(function(checkbox) {
        updateCheckboxValue(checkbox);
        checkbox.addEventListener('change', function() {
            updateCheckboxValue(this);
        });
    });

    // 좋아요 버튼 설정
    var likeButton = document.getElementById('likeButton');
    var toastMessage = document.getElementById('toastMessage'); // 토스트 메시지 요소

    if (likeButton && toastMessage) {
        var checkbox = likeButton.querySelector('input[type="checkbox"]');
        if (checkbox) {
            checkbox.addEventListener('change', function() {
                likeButton.classList.toggle('active', this.checked);

                // 토스트 메시지 표시
                toastMessage.textContent = this.checked ? '좋아요가 반영되었습니다' : '좋아요가 취소되었습니다';
                toastMessage.classList.add('show');
                setTimeout(function() {
                    toastMessage.classList.remove('show');
                }, 2000); // 2초 후에 토스트 메시지 숨김
            });

            // 페이지 로드 시 좋아요 버튼의 초기 상태 설정
            likeButton.classList.toggle('active', checkbox.checked);
        }
    }


    // 이미지 관련 로직
    var photoBtn = document.getElementById('photoBtn');
    var photoInput = document.getElementById('photoInput');
    if (photoBtn && photoInput) {
        photoBtn.addEventListener('click', function() {
            photoInput.click();
        });

        photoInput.addEventListener('change', handleImagePreview);
    }

    function handleImagePreview(event) {
        var file = event.target.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var imagePreview = document.getElementById('imagePreview');
                var previewContainer = document.getElementById('previewContainer');
                imagePreview.src = e.target.result;
                previewContainer.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    }

    function removePreview(review_img_id) {
        var photoInput = $("#photoInput" + review_img_id);
        var imagePreview = $("#imagePreview" + review_img_id);
        var previewContainer = $("#previewContainer" + review_img_id);
        if (photoInput.length && imagePreview.length && previewContainer.length) {
            photoInput.val('');
            imagePreview.attr('src', '');
            previewContainer.hide();
        }
    }

    // 팝업 로직
    window.openPopup = function() {
        document.getElementById('popup').style.display = 'block';
    }

    window.closePopup = function() {
        document.getElementById('popup').style.display = 'none';
    }
});
