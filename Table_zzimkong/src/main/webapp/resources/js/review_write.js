// 이 함수들은 전역 스코프에 있어야 하므로 DOMContentLoaded 바깥으로 이동
function updateCheckboxValue(checkbox) {
    var hiddenInput = document.getElementsByName(checkbox.id)[0];
    hiddenInput.value = checkbox.checked ? 1 : 0;
}

function toggleKeywords(checkbox) {
    var keywordCheckboxes = document.querySelectorAll('.keyword_category input[type="checkbox"]');
    keywordCheckboxes.forEach(function(item) {
        if (item !== checkbox) {
            item.checked = false;
            item.disabled = checkbox.checked;
            document.getElementsByName(item.id)[0].value = '0';
        }
    });
}
// ====================================
function updateCheckboxValue(checkbox) {
    var hiddenInput = document.getElementsByName(checkbox.id)[0];
    hiddenInput.value = checkbox.checked ? 1 : 0;
}

// ====================================
// 이미지 프리뷰 및 제거 기능을 위한 함수들
function handleImagePreview(event) {
    var file = event.target.files[0];
    var imagePreview = document.getElementById('imagePreview');
    var previewContainer = document.getElementById('previewContainer');
    if (file) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            imagePreview.src = e.target.result;
            previewContainer.style.display = 'block'; // 컨테이너 보이기
        };
        
        reader.readAsDataURL(file);
    }
}

function removePreview() {
    var photoInput = document.getElementById('photoInput');
    var imagePreview = document.getElementById('imagePreview');
    var previewContainer = document.getElementById('previewContainer');
    photoInput.value = ""; // input file 값 초기화
    imagePreview.src = ""; // 이미지 프리뷰 소스 초기화
    previewContainer.style.display = 'none'; // 컨테이너 숨기기
}
// ===========================================================================

document.addEventListener('DOMContentLoaded', function() {
// ==================================================================================	
//	 var photoInput = document.getElementById('photoInput');
//    photoInput.addEventListener('change', handleImagePreview);
// =========새로 한거=============================================================
//    var photoInput = document.getElementById('photoInput');
//    var imagePreview = document.getElementById('imagePreview');
//    var previewContainer = document.getElementById('previewContainer');
//    
//    // 이미지 프리뷰 함수
//    photoInput.addEventListener('change', function(event) {
//        var file = event.target.files[0];
//        if (file) {
//            var reader = new FileReader();
//            
//            reader.onload = function(e) {
//                imagePreview.src = e.target.result;
//                previewContainer.style.display = 'block'; // 컨테이너 보이기
//            };
//            
//            reader.readAsDataURL(file);
//        }
//    });
//    
//    // 이미지 프리뷰 삭제 함수
//    window.removePreview = function() {
//        photoInput.value = ""; // input file 값 초기화
//        previewContainer.style.display = 'none'; // 컨테이너 숨기기
//    }
// ======================================================================
//	var keywordButtons = document.querySelectorAll('.keyword_btn');
//	var noKeywordBtn = document.getElementById('noKeywordBtn');
//	var selectedCount = 0;
//
//	keywordButtons.forEach(function(button) {
//		button.addEventListener('click', function() {
//			if (noKeywordBtn.classList.contains('active') && this !== noKeywordBtn) {
//				alert('다른 키워드를 선택할 수 없습니다.'); /* 활성화가 되지 않음 */
//				return;
//			}
//
//			if (this.classList.contains('active')) {
//				this.classList.remove('active');
//				selectedCount--;
//			} else if (selectedCount < 5 || this === noKeywordBtn) {
//				this.classList.add('active');
//				selectedCount++;
//			} else {
//				alert('최대 5개까지만 선택할 수 있습니다.');
//			}
//		});
//	});
	// 별점

//	const ratingStars = [...document.getElementsByClassName("rating__star")];
//	const ratingResult = document.querySelector(".rating__result");

//	printRatingResult(ratingResult);

//	function executeRating(stars, result) {
//		const starClassActive = "rating__star fas fa-star";
//		const starClassUnactive = "rating__star far fa-star";
//		const starsLength = stars.length;
//		let i;
//		stars.map((star) => {
//			star.onclick = () => {
//				i = stars.indexOf(star);
//
//				if (star.className.indexOf(starClassUnactive) !== -1) {
//					printRatingResult(result, i + 1);
//					for (i; i >= 0; --i) stars[i].className = starClassActive;
//				} else {
//					printRatingResult(result, i);
//					for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
//				}
//			};
//		});
//	}

//	function printRatingResult(result, num = 0) {
//		result.textContent = `${num}/5`;
//	}

//	executeRating(ratingStars, ratingResult);

	// ------ 

//	noKeywordBtn.addEventListener('click', function() {
//		if (this.classList.contains('active')) {
//			keywordButtons.forEach(function(btn) {
//				if (btn !== noKeywordBtn) {
//					btn.classList.remove('active');
//					btn.disabled = true;
//				}
//			});
//			selectedCount = 1;
//		} else {
//			keywordButtons.forEach(function(btn) {
//				btn.disabled = false;
//			});
//			selectedCount = 0;
//		}
//	});
	
	
	// 팝업 열기
	window.openPopup = function() {
		document.getElementById('popup').style.display = 'block';
	}

	// 팝업 닫기
	window.closePopup = function() {
		document.getElementById('popup').style.display = 'none';
	}

// ==================================================================================
	// 사진추가 팝업창
//	document.getElementById('photoBtn').addEventListener('click', function() {
//		document.getElementById('photoInput').click();
//	});
//
//	// 사진 업로드 서버전송
//	document.getElementById('photoInput').addEventListener('change', function() {
//		var file = this.files[0];
//		var formData = new FormData();
//		formData.append('photo', file);
//
//		fetch('https://your-api-url.com/upload', {
//			method: 'POST',
//			body: formData
//		})
//			.then(response => response.json())
//			.then(data => console.log(data))
//			.catch(error => console.error(error));
//	});
	
// ==================================================================================
	var likeButton = document.getElementById('likeButton');
	var checkbox = likeButton.querySelector('input[type="checkbox"]');
	var toastMessage = document.getElementById('toastMessage');
	
	checkbox.addEventListener('change', function() {
	    likeButton.classList.toggle('active', this.checked);
	    toastMessage.textContent = this.checked ? '좋아요가 반영되었습니다' : '좋아요가 취소되었습니다';
	    toastMessage.classList.add('show');
	    setTimeout(function() {
	        toastMessage.classList.remove('show');
	    }, 2000);
	});
});
// ==================================================================================
        // updateCheckboxValue 함수를 전역 스코프로 이동
        function updateCheckboxValue(checkbox) {
            var hiddenInput = document.getElementsByName(checkbox.id)[0];
            hiddenInput.value = checkbox.checked ? 1 : 0;
        }

        // toggleKeywords 함수도 전역 스코프로 이동
        function toggleKeywords(checkbox) {
            var keywordCheckboxes = document.querySelectorAll('.keyword_category input[type="checkbox"]');
            keywordCheckboxes.forEach(function(item) {
                if (item !== checkbox) {
                    item.checked = false;
                    item.disabled = checkbox.checked;
                    document.getElementsByName(item.id)[0].value = '0';
                }
            });
        }

// ==================================================================================


// ==================================================================================
	// 좋아요 버튼 색 변경
//	var likeButton = document.getElementById('likeButton');
//	likeButton.addEventListener('click', function() {
//		this.classList.toggle('active');
//	});
//
//	// 좋아요 버튼 토스트 메세지 팝업
//	var likeButton = document.getElementById('likeButton');
//	var toastMessage = document.getElementById('toastMessage');
//	var isLiked = false; // '좋아요' 상태를 추적하는 변수
//
//	likeButton.addEventListener('click', function() {
//		// '좋아요' 상태 변경
//		isLiked = !isLiked;
//
//		// 토스트 메시지 내용 설정
//		toastMessage.textContent = isLiked ? '좋아요가 반영되었습니다' : '좋아요가 취소되었습니다';
//
//		// 토스트 메시지 표시
//		toastMessage.classList.add('show');
//
//		// 2초 후에 토스트 메시지 숨김
//		setTimeout(function() {
//			toastMessage.classList.remove('show');
//		}, 2000);
//	});

// ==================================================================================
// 이미지 프리뷰 함수
function handleImagePreview(event) {
    var file = event.target.files[0];
    var imagePreview = document.getElementById('imagePreview');
    var previewContainer = document.getElementById('previewContainer');
    if (file) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            imagePreview.src = e.target.result;
            imagePreview.style.display = 'block';
            previewContainer.style.display = 'block';
        };
        
        reader.readAsDataURL(file);
    }
}

// 이미지 프리뷰 삭제 함수
function removePreview() {
    var photoInput = document.getElementById('photoInput');
    var imagePreview = document.getElementById('imagePreview');
    var previewContainer = document.getElementById('previewContainer');
    photoInput.value = "";
    imagePreview.style.display = 'none';
    previewContainer.style.display = 'none';
}

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('photoBtn').addEventListener('click', function() {
        document.getElementById('photoInput').click();
    });
    
    document.getElementById('photoInput').addEventListener('change', handleImagePreview);
});

// ==================================================================================
