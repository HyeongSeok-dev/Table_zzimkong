$(document).ready(function() {
	
	//광고슬라이드
$(document).ready(function() {
  var totalSlides = $('#hero-area .slide').length;
  var currentSlide = 1;

  function updateSlide() {
    $('#hero-area .slide').removeClass('active');
    $('#slide' + currentSlide).addClass('active');
    $('#currentSlide').text(currentSlide + ' / ' + totalSlides);
  }

  setInterval(function() {
    currentSlide++;
    if (currentSlide > totalSlides) {
      currentSlide = 1;
    }
    updateSlide();
  }, 5000); // 5초마다 슬라이드를 변경합니다.

  $('#prev').click(function() {
    currentSlide--;
    if (currentSlide < 1) {
      currentSlide = totalSlides;
    }
    updateSlide();
  });

  $('#next').click(function() {
    currentSlide++;
    if (currentSlide > totalSlides) {
      currentSlide = 1;
    }
    updateSlide();
  });

  updateSlide();
});

	//==============================
	
	//정렬 출력 10개로 제한
    var limitItems = function(carouselId) {
        var carousel = $(carouselId);
        var items = carousel.children();

        if (items.length > 10) {
            items.slice(10).remove();
        }

        carousel.owlCarousel({
            items: 4,
            pagination: true,
            paginationSpeed: 1000,
            navigation: true,
            navigationText: ["", "<i class='fa fa-angle-right'></i>"],
            slideSpeed: 800,
        });
    };

    limitItems("#owl-example1");
    limitItems("#owl-example2");
    limitItems("#owl-example3");
	 
	
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

//지역 선택에 따른 정렬 
//$(document).ready(function() {
//    $('input[name=location]').change(function() {
//        var selectedValue = $(this).val();
//
//        $.ajax({
//            url: 'selectArea',  
//            type: 'POST',  
//            data: { value: selectedValue },  // 전송할 데이터
//            success: function(response) { //요청성공
//                console.log(response);
//            },
//            error: function(error) { //요청실패
//                console.error(error);
//            }
//        });
//    });
//});



});
