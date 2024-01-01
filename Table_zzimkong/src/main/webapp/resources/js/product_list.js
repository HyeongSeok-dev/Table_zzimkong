$(document).ready(function() {
    $('.reservation-time').each(function() {
        var openTime = $(this).data('start-time'); // Get the opening time for the company
        createTimeButtons($(this), openTime, 30, 4); // Generate buttons for each company
    });
    kakao.maps.load(function() {
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
	        // 카카오 맵 API 주소-좌표 변환 객체 생성
	        var geocoder = new kakao.maps.services.Geocoder();
	
	        geocoder.addressSearch(address, function(result, status) {
	            if (status === kakao.maps.services.Status.OK) {
	                var coordinates = {
	                    lat: result[0].y,
	                    lon: result[0].x
	                };
	                callback(coordinates);
	            } else {
	                alert("주소를 좌표로 변환하는 데 실패했습니다.");
	            }
	        });
	    }
	
	    // 가게의 주소 정보와 사용자의 현재 위치를 사용하여 거리 계산
	    getCurrentLocation(function(userLat, userLon) {
	        $('.restaurant-list').each(function() {
	            var restaurant = $(this);
	            var storeAddress = restaurant.find('input[name="storeAddress"]').val();  // 각 가게의 주소
				
	            // 주소를 좌표로 변환하고, 거리 계산
	            getAddressCoordinates(storeAddress, function(coordinates) {
	                calculateDistance(userLat, userLon, coordinates.lat, coordinates.lon, function(distance) {
	                    restaurant.find('.restaurant-distance').text(distance.toFixed(2) + ' m');
	                });
	            });
	        });
	    });
	
	    // 두 위치 사이의 거리를 계산하는 함수
	    function calculateDistance(lat1, lon1, lat2, lon2, callback) {
	        var origin = new kakao.maps.LatLng(lat1, lon1);
	        var destination = new kakao.maps.LatLng(lat2, lon2);
	        var distance = kakao.maps.services.geometry.computeDistanceBetween(origin, destination);
	        callback(distance);
	    }
    });
});



function createTimeButtons($container, baseTime, increment, count) {
    let base = moment(baseTime, "HH:mm");

    for (let i = 0; i < count; i++) {
        let time = i === 0 ? base : base.add(increment, 'minutes');
        let formattedTime = time.format("HH:mm");
        let remainingPeople = getRemainingPeople($container, i + 1); // 인덱스에 1을 더하여 1부터 시작하도록
		
        if (remainingPeople >= $container.data('persons')) {
            $("<button/>", {
                text: formattedTime,
                class: "time-button",
                click: function() { 
					$('#selectedTime').val(formattedTime); 
					$button.closest('form').submit();
				}
            }).appendTo($container);
        }
    }
}

function getRemainingPeople($container, index) {
    return parseInt($container.data('remaining' + index));
}

function submitForm(element) {
        element.closest('form').submit();
    }