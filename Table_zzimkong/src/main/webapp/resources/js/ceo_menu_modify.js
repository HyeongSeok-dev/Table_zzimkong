$(document).ready(function() {
	
    $('.menuImage').on('change', function(e) {
        var file = e.target.files[0];

        if (file) {
            var reader = new FileReader(); // FileReader 객체 사용
            reader.onload = function(e) {
                $('.preview_image').attr('src', e.target.result); // 미리보기 이미지 경로 업데이트
            };
            reader.readAsDataURL(file); // 이미지 파일 읽기
        }
    });
    $('#button_delete').on('click', function() {
		if (confirm('메뉴를 삭제하시겠습니까?')) {
            window.location.href = "deletePro?menu_idx="+ $('#menu_idx').val() ;
        }
	});
});