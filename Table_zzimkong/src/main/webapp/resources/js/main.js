$(document).ready(function() {
	
//  $("#owl-example1").owlCarousel({
//    items: 4, // 한 화면에 보여줄 아이템 수 설정
//    loop: true, // 무한 반복 설정
//    margin: 10, // 아이템 간 간격 설정
//    nav: true, // 이전/다음 버튼 사용 설정
//    autoplay: true, // 자동 슬라이드 설정
//    autoplayTimeout: 3000, // 자동 슬라이드 시간 설정 (3초)
//    autoplayHoverPause: true // 마우스 오버시 자동 슬라이드 멈춤 설정
//  });


	$("#owl-example1").owlCarousel({
		// Most important owl features
		items: 4,
		pagination: true,
		paginationSpeed: 1000,
		navigation: true,
		navigationText: ["", "<i class='fa fa-angle-right'></i>"],
		slideSpeed: 800,
	});
	
	$("#owl-example2").owlCarousel({
		// Most important owl features
		items: 4,
		pagination: true,
		paginationSpeed: 1000,
		navigation: true,
		navigationText: ["", "<i class='fa fa-angle-right'></i>"],
		slideSpeed: 800,
	});
	$("#owl-example3").owlCarousel({
		// Most important owl features
		items: 4,
		pagination: true,
		paginationSpeed: 1000,
		navigation: true,
		navigationText: ["", "<i class='fa fa-angle-right'></i>"],
		slideSpeed: 800,
	});
	$("#owl-example4").owlCarousel({
		// Most important owl features
		items: 4,
		pagination: true,
		paginationSpeed: 1000,
		navigation: true,
		navigationText: ["", "<i class='fa fa-angle-right'></i>"],
		slideSpeed: 800,
	});
	$("#owl-example5").owlCarousel({
		// Most important owl features
		items: 4,
		pagination: true,
		paginationSpeed: 1000,
		navigation: true,
		navigationText: ["", "<i class='fa fa-angle-right'></i>"],
		slideSpeed: 800,
	});


    
    
	$("#navigation").sticky({
		topSpacing: 75,
	});

	$('#nav').onePageNav({
		currentClass: 'current',
		changeHash: false,
		scrollSpeed: 15000,
		scrollThreshold: 0.5,
		filter: '',
		easing: 'easeInOutExpo'
	});

	$('#top-nav').onePageNav({
		currentClass: 'active',
		changeHash: true,
		scrollSpeed: 1200
	});
	//Initiat WOW JS
	new WOW().init();




});
