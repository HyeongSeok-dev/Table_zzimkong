$(document).ready(function() {
	var contextRoot = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
	
	fetchRestaurants('near');

	$('input[name="menu_idx"]').each(function() {
		$(this).change(function() {
			if ($('input[name="menu_idx"]').is(':checked')) {
				$('#reservation-confirm-button').text('선택한 메뉴와 예약하기');
			} else {
				$('#reservation-confirm-button').text('선주문없이 바로 예약하기');
			}
		});
	});

	$('.sort-option-div').each(function() {
		$(this).click(function() {
			var sortValue = $(this).attr('data-sort-value');

			if ($('.sort-option-selected')) {
				$('.sort-option-selected').removeClass('sort-option-selected');
			}

			$(this).addClass('sort-option-selected');

			fetchRestaurants(sortValue);
		});
	});



	$('#reservation-confirm-button').click(function() {

		var selectedMenus = [];
		
	    $('input.menu_check:checked').each(function() {
	        var menuCard = $(this).closest('.menu_card');
	        selectedMenus.push({
	            menu_idx: menuCard.data('menu-id'),
	            menu_name: menuCard.data('menu-name'),
	            menu_price: menuCard.data('menu-price'),
	            order_amount: menuCard.find('input[name="order_amount"]').val()
	        });
	    });
	
	    // formData 기본 구조 설정
	    var formData = {
	        com_id: $('#com_id').val()
	    };
	
	    if (selectedMenus.length > 0) {
	        formData.menus = selectedMenus;
	    }
		
		$.ajax({
			url: contextRoot + '/product/detailPro',
			type: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify(formData),
			success: function(response) {
				// 성공적으로 데이터를 받으면 실행할 코드
				console.log("Response: ", response);
				if(response.error) {
			        alert(response.message); // Show the error message to the user
			    } else {
			        window.location.href = contextRoot + response.redirectURL; // Redirect to the reservation page
			    }
			},
			error: function(error) {
				// 에러가 발생했을 때 실행할 코드
				console.log("Error: ", error);
			}
		});
	});
});

function fetchRestaurants(sortValue) {
	var fetchData = { similarSort: sortValue, com_id: $('#com_id').val() }
	var contextPath = "/zzimkong/";
	$.ajax({
		url: 'similarList',	
		type: 'POST',
		contentType: 'application/json',
		dataType: 'json',
		data: JSON.stringify(fetchData),
		success: function(response) {
			var similarContents = $('#similar-contents');
			similarContents.html('');
			
			 response.forEach(function(restaurant) {
                var restaurantHtml = `
                    <div class="similar_rest_card">
                        <div class="similar_rest_box">
                            <div class="similar_rest_distance">
                                <img class="similar_rest_distance_img"
                                    src="` + contextPath + `/resources/img/products_location_img.png"
                                    alt="추천 식당 거리 표시 아이콘"> <span
                                    class="similar_rest_distance_number">${restaurant.distance}m</span>
                            </div>
                            <img class="similar_rest_img"
                                 src="` + contextPath + `/resources/img/${restaurant.com_img}">
                            <div class="similar_rest_average">
                                <img class="similar_rest_average_img"
                                     src="` + contextPath + `/resources/img/products_similar_star.png"
                                    alt=""> <span class="similar_rest_average_number">
                                    ${restaurant.avg_score}</span>
                            </div>
                        </div>
                        <span class="similar_rest_title">${restaurant.com_name}<br></span>
                    </div>
                `;
                similarContents.append(restaurantHtml);
            });
        },
         error: function(error) {
            console.error("에러 ", error);
        }
	});
}

function mapPopup(com_id) {
	// 팝업창의 URL을 설정합니다. 적절한 URL로 변경해야 합니다.
	var url = "map?com_id=" + com_id;

	var windowName = "MapPopup";
	var windowSize = "width=1000 ,height=800, left=200 ,top=200"

	window.open(url, windowName, windowSize);
}