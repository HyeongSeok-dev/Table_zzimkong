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
				window.location.href = contextRoot + response.redirectURL; // Redirect to the reservation page
			},
			error: function(xhr) { // xhr은 XMLHttpRequest 객체입니다.
			    var response = xhr.responseJSON; // JSON 응답을 객체로 변환
			    if(response && response.error) {
			        alert(response.message);
			        window.location.href = response.redirectURL; // Redirect
			    }
			}
		});
	});

	// 두 위치 사이의 거리를 계산하는 함수
	function calculateDistance(lat1, lon1, lat2, lon2, callback) {
		var origin = new kakao.maps.LatLng(lat1, lon1);
		var destination = new kakao.maps.LatLng(lat2, lon2);

		// 선 객체를 생성합니다
		var polyline = new kakao.maps.Polyline({
			path: [origin, destination]
		});

		// 선의 총 거리를 계산합니다
		var distance = polyline.getLength();
		callback(distance);
	}

	// 사용자의 현재 위치를 얻는 함수
	function getCurrentLocation(callback) {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				callback(position.coords.latitude, position.coords.longitude);
			});
		} else {
			alert("지원하지 않는 브라우저입니다.");
		}
	}

	// 주소를 좌표로 변환하는 함수
	function getAddressCoordinates(address, callback) {
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch(address, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var coordinates = {
					lat: result[0].y,
					lon: result[0].x
				};
				callback(coordinates);
			} else {
				alert("주소를 좌표로 변환하는 데 실패했습니다: " + address);
			}
		});
	}

	// 가게의 주소 정보와 사용자의 현재 위치를 사용하여 거리 계산
	function calculateDistanceForRestaurants() {
		getCurrentLocation(function(userLat, userLon) {
			$('.basic-info').each(function() {
				var restaurant = $(this);
				var storeAddress = restaurant.find('input[name="storeAddress"]').val();
				getAddressCoordinates(storeAddress, function(coordinates) {
					calculateDistance(userLat, userLon, coordinates.lat, coordinates.lon, function(distance) {
						if (distance < 1000) { // 1000m 미만일 때는 m 단위로 정수 표시
							restaurant.find('.restaurant-distance').text(Math.round(distance) + ' m');
						} else { // 1000m 이상일 때는 km 단위로 소수 첫째자리까지 표시
							restaurant.find('.restaurant-distance').text((distance / 1000).toFixed(1) + ' km');
						}
					});
				});
			});
		});
	}

	function calculateDistanceForSimilarRestaurants() {
		getCurrentLocation(function(userLat, userLon) {
			$('.similar_rest_card').each(function() {
				var restaurant = $(this);
				var storeAddress = restaurant.find('input[name="storeAddress"]').val();
				getAddressCoordinates(storeAddress, function(coordinates) {
					calculateDistance(userLat, userLon, coordinates.lat, coordinates.lon, function(distance) {
						if (distance < 1000) { // 1000m 미만일 때는 m 단위로 정수 표시
							restaurant.find('.similar_rest_distance_number').text(Math.round(distance) + ' m');
						} else { // 1000m 이상일 때는 km 단위로 소수 첫째자리까지 표시
							restaurant.find('.similar_rest_distance_number').text((distance / 1000).toFixed(1) + ' km');
						}
					});
				});
			});
		});
	}

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
                <a href="detail?com_id=${restaurant.com_id}"&selectedTime=''>
                    <div class="similar_rest_card">
                        <div class="similar_rest_box">
                            <div class="similar_rest_distance">
                                <img class="similar_rest_distance_img"
                                    src="` + contextPath + `/resources/img/products_location_img.png"
                                    alt="추천 식당 거리 표시 아이콘"> <span
                                    class="similar_rest_distance_number"></span>
                            </div>
                            <img class="similar_rest_img"
                                 src="` + contextPath + `/resources/upload/${restaurant.com_img}">
                            <div class="similar_rest_average">
                                <img class="similar_rest_average_img"
                                     src="` + contextPath + `/resources/img/products_similar_star.png"
                                    alt=""> <span class="similar_rest_average_number">
                                    ${restaurant.avg_score}</span>
                            </div>
                        </div>
                        <span class="similar_rest_title">${restaurant.com_name}<br></span>
                        <input type="hidden" name="storeAddress" value="${restaurant.com_address}">
                    </div>
                    </a>
                `;
					similarContents.append(restaurantHtml);
					calculateDistanceForSimilarRestaurants();
				});
			},
			error: function(error) {
				console.error("에러 ", error);
			}
		});
	}

	kakao.maps.load(function() {
		calculateDistanceForRestaurants();
	});


	var scrollAmount =  180; // adjust multiplier based on visible images count

    $('.scroll-btn.left').click(function(){
        $('.review_container').animate({
            scrollLeft: '-=' + scrollAmount
        }, 'fast');
        console.log("왼쪽 클릭됨")
    });

    $('.scroll-btn.right').click(function(){
        $('.review_container').animate({
            scrollLeft: '+=' + scrollAmount
        }, 'fast');
        console.log("오른쪽 클릭됨")
    });
});

function mapPopup(address) {
	// 팝업창의 URL을 설정합니다. 적절한 URL로 변경해야 합니다.
	var encodedAddress = encodeURIComponent(address);
	var url = "map?address=" + encodedAddress;

	var windowName = "MapPopup";
	var windowSize = "width=1000,height=800,left=200,top=200";

	window.open(url, windowName, windowSize);
}

