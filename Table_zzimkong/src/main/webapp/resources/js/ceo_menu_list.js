var contextRoot = path.substring(0, path.indexOf('/', 1));
$(document).ready(function() {
	var initialCompanyId = $('#storeList option:first').val();
    fetchCompanyData(initialCompanyId); 

    // 셀렉트 박스가 변경될 때마다 AJAX 요청
    $('#storeList').change(function() {
        var selectedCompanyId = $(this).val();
        fetchCompanyData(selectedCompanyId); 
    });	
	
});
function menuRegistration() {
	/* 팝업창 중앙 정렬 */
	var companyId = $('#storeList').val();
	var popupW = 1100;
	var popupH = 850;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open(contextRoot+'ceo/menu/register?com_id='+companyId,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

function menuModify(menuIdx) {
	/* 팝업창 중앙 정렬 */
	var popupW = 1100;
	var popupH = 850;
	var left = Math.ceil((window.screen.width - popupW)/2);
	var top = Math.ceil((window.screen.height - popupH)/2);
	window.open(contextRoot +'ceo/menu/modify?menu_idx='+menuIdx,'','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
}

function fetchCompanyData(companyId) {
	var path = window.location.pathname;
	
	var fetchData ={com_id: companyId}
	
    $.ajax({
        url: 'listPro', // API 경로를 적절히 변경하세요.
        type: 'POST',
		contentType: 'application/json',
		dataType: 'json',
		data: JSON.stringify(fetchData),
        success: function(response) {
			var menuTable = $('#menuTable');
            menuTable.find("tr:gt(0)").remove();
            response.forEach(function(menu, index) {
               var row = `<tr>
                    <td>${menu.menu_idx}</td>
                    <td>${menu.menu_name}</td>
                    <td>${menu.menu_price }원</td>
                    <td>${menu.menu_describe}</td>
                    <td><img src="${contextRoot}/resources/upload/${menu.menu_img}" class="menu_img"></td>
                    <td>
                        <button type="button" class="button_olive" onclick="menuModify(${menu.menu_idx})">수정</button>
                    </td>
                </tr>`;
                menuTable.append(row);
            });
        },
        error: function(error) {
            // 에러가 발생했을 때 실행할 코드
            console.error("Error fetching data: ", error);
        }
    });
}