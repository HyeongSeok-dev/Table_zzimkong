


var likeButton = document.getElementById('likeButton');
	likeButton.addEventListener('click', function() {
		this.classList.toggle('active');
	});
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
	
	

/* 예약 취소 모달창 */
function cancelReservation(){
		confirm("예약을 취소하시겠습니까?");
		if(true) {
			alert("예약이 취소되었습니다.");
		}
	}
