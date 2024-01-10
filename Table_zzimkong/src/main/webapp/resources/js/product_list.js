$(document).ready(function() {
    $('.reservation-time').each(function() {
        var openTime = $(this).data('start-time'); // Get the opening time for the company
        createTimeButtons($(this), openTime, 30, 4); // Generate buttons for each company
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
    function error(err) {
	  console.log('Error : ' + err.code + err.message);
	}
    const options = {
	  enableHighAccuracy: true,
	  timeout: 5000,
	  maximumAge: 0,
	};
	
	function success(pos) {
	  const crd = pos.coords;
	
	  console.log("Your current position is:");
	  console.log("Latitude : " + crd.latitude);
	  console.log("Longitude: " + crd.longitude);
	  console.log("More or less " + crd.accuracy + " meters.");
	}
    function getCurrentLocation(callback) {
		console.log("getCurrentLocation 호출됨 - " + navigator.geolocation.getCurrentPosition);
		
        if (navigator.geolocation) {
					console.log("getCurrentLocation 이프문 안 호출됨");
            navigator.geolocation.getCurrentPosition(function(position) {
				console.log("현재위치 로그" + position +position.coords.latitude +  position.coords.longitude );
                callback(position.coords.latitude, position.coords.longitude);
                
            });
			navigator.geolocation.getCurrentPosition(success, error, options);
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
		console.log(" calculateDistanceForRestaurants 호출됨");
        getCurrentLocation(function(userLat, userLon) {
			console.log("getCurrentLocation 호출됨" + userLat + userLon);
            $('.restaurant-list').each(function() {
                var restaurant = $(this);
                var storeAddress = restaurant.find('input[name="storeAddress"]').val();
                getAddressCoordinates(storeAddress, function(coordinates) {
                    calculateDistance(userLat, userLon, coordinates.lat, coordinates.lon, function(distance) {
                        console.log(distance);
                        restaurant.find('.distance').val(distance) 
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

    function loadKakaoMaps(callback) {
		console.log("loadKakaoMaps ")
        var script = document.createElement('script');
        script.src = 'http://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js';
        script.onload = function() {
            kakao.maps.load(callback);
        };
        document.head.appendChild(script);
    }

    // 스크립트 로드 후 거리 계산 함수 호출
    loadKakaoMaps(function() {
		console.log(" loadKakaoMaps 호출됨");

        calculateDistanceForRestaurants();
    });
    
    $('#sort').change(function() {
	console.log("거리순 정렬 호출됨")
    var selectedSort = $(this).val();
    if (selectedSort === 'distance') {
        sortRestaurantsByDistance(); // 거리순으로 정렬하는 함수 호출
	 }
	});
	
	
});



function createTimeButtons($container, baseTime, increment, count) {
    let base = moment(baseTime, "HH:mm");
    for (let i = 0; i < count; i++) {
        let time = i === 0 ? base.clone() : base.add(increment, 'minutes');
        let formattedTime = time.format("HH:mm");
        let remainingPeople = getRemainingPeople($container, i + 1);

        if (remainingPeople >= $container.data('persons')) {
            $("<button/>", {
                text: formattedTime,
                class: "time-button",
                click: function() {
                    $('.selectedTime').val(formattedTime);
                    $(this).closest('form').submit(); 
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

function sortRestaurantsByDistance() {
    var restaurantList = $('.restaurant-list').get();

    restaurantList.sort(function(a, b) {
        var distanceA = parseFloat($(a).find('.distance').val());
        var distanceB = parseFloat($(b).find('.distance').val());
        return distanceA - distanceB;
    });

    $('.rowgroup').empty().append(restaurantList);
}

