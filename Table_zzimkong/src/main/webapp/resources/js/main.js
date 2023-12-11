$(document).ready(function() {

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
