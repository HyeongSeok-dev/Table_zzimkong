document.addEventListener('DOMContentLoaded', function() {
	var keywordButtons = document.querySelectorAll('.keyword_btn');
	var noKeywordBtn = document.getElementById('noKeywordBtn');
	var selectedCount = 0;

	keywordButtons.forEach(function(button) {
		button.addEventListener('click', function() {
			if (noKeywordBtn.classList.contains('active') && this !== noKeywordBtn) {
				alert('다른 키워드를 선택할 수 없습니다.'); /* 활성화가 되지 않음 */
				return;
			}

			if (this.classList.contains('active')) {
				this.classList.remove('active');
				selectedCount--;
			} else if (selectedCount < 5 || this === noKeywordBtn) {
				this.classList.add('active');
				selectedCount++;
			} else {
				alert('최대 5개까지만 선택할 수 있습니다.');
			}
		});
	});
	// 별점

	const ratingStars = [...document.getElementsByClassName("rating__star")];
	const ratingResult = document.querySelector(".rating__result");

	printRatingResult(ratingResult);

	function executeRating(stars, result) {
		const starClassActive = "rating__star fas fa-star";
		const starClassUnactive = "rating__star far fa-star";
		const starsLength = stars.length;
		let i;
		stars.map((star) => {
			star.onclick = () => {
				i = stars.indexOf(star);

				if (star.className.indexOf(starClassUnactive) !== -1) {
					printRatingResult(result, i + 1);
					for (i; i >= 0; --i) stars[i].className = starClassActive;
				} else {
					printRatingResult(result, i);
					for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
				}
			};
		});
	}

	function printRatingResult(result, num = 0) {
		result.textContent = `${num}/5`;
	}

	executeRating(ratingStars, ratingResult);

	// ------ 



	noKeywordBtn.addEventListener('click', function() {
		if (this.classList.contains('active')) {
			keywordButtons.forEach(function(btn) {
				if (btn !== noKeywordBtn) {
					btn.classList.remove('active');
					btn.disabled = true;
				}
			});
			selectedCount = 1;
		} else {
			keywordButtons.forEach(function(btn) {
				btn.disabled = false;
			});
			selectedCount = 0;
		}
	});
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