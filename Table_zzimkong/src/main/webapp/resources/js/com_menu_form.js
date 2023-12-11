//메뉴추가
$(function(){
    var menuCount = 0;

    $('#addMenuButton').on('click', function(){
        menuCount++;
        var menuRow = `
            <div class="menuRow">
                <div class="menuInput">
                    <input type="text" name="menuList[${menuCount}].menu_name" class="menuName" placeholder="메뉴 이름">
                    <input type="number" name="menuList[${menuCount}].menu_price" class="menuPrice" placeholder="메뉴 가격">
                    <textarea name="menuList[${menuCount}].menu_describe" class="menuDesc" placeholder="메뉴 설명"></textarea>
                    <input type="file" name="menuImages[${menuCount}].menu_img" class="menuImage" accept="image/*">
                </div>
                <div class="previewContainer">
                    <img class="previewImage" src="" alt="이미지 미리보기">
                </div>
            </div>
        `;

        $('#menuContainer').append(menuRow);
    });
//이미지 미리보기
    $('#menuContainer').on('change', '.menuImage', function(e) {
        var previewImage = $(this).parent().next().find('.previewImage');
        previewImage.attr('src', URL.createObjectURL(e.target.files[0]));
        previewImage.on('load', function() {
            URL.revokeObjectURL(previewImage.attr('src'));
        });
    });
});
