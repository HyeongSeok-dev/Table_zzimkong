<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b71f7bc975653acc7be99d324066bee&libraries=services"></script>
</head>
<body>
 	<div id="map" style="width:1000px;height:800px;"></div>
        <script>
        var mapContainer = document.getElementById('map'), 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 4 
            }; 

        var map = new kakao.maps.Map(mapContainer, mapOption);

        var address = decodeURIComponent(new URLSearchParams(window.location.search).get('address'));
        var name = decodeURIComponent(new URLSearchParams(window.location.search).get('name'));

        var geocoder = new kakao.maps.services.Geocoder();

        geocoder.addressSearch(address, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div><strong>' + name + '</strong><br>' + address + ' <a href="https://map.kakao.com/link/to/' + encodeURIComponent(address) + ',' + result[0].y + ',' + result[0].x + '" target="_blank" style="color:blue">길찾기</a></div>'
                });
                infowindow.open(map, marker);

                map.setCenter(coords);
            } else {
                alert("주소를 좌표로 변환하는 데 실패했습니다: " + address);
            }
        });
    </script>
</body>
</html>