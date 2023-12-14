
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

	// 좋아요 버튼 색 변경
	var likeButton = document.getElementById('likeButton');
	likeButton.addEventListener('click', function() {
		this.classList.toggle('active');
	});

	// 좋아요 버튼 토스트 메세지 팝업
	var likeButton = document.getElementById('likeButton');
	var toastMessage = document.getElementById('toastMessage');
	var isLiked = false; // '좋아요' 상태를 추적하는 변수

	likeButton.addEventListener('click', function() {
		// '좋아요' 상태 변경
		isLiked = !isLiked;

		// 토스트 메시지 내용 설정
		toastMessage.textContent = isLiked ? '좋아요가 반영되었습니다' : '좋아요가 취소되었습니다';

		// 토스트 메시지 표시
		toastMessage.classList.add('show');

		// 2초 후에 토스트 메시지 숨김
		setTimeout(function() {
			toastMessage.classList.remove('show');
		}, 2000);
	});
});


