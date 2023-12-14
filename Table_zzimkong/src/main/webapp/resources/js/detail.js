$(document).ready(function() {
    fetchRestaurants('rest_near');

    $('input[name="menu"]').each(function() {
        $(this).change(function() {
            var isAnyCheckboxChecked = $('input[name="menu"]').is(':checked');

            if (isAnyCheckboxChecked) {
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
});

function fetchRestaurants(sortValue) {
    $.ajax({
        url: '/getRestaurants',
        data: { sort: sortValue },
        type: 'GET',
        dataType: 'json',
        success: function(restaurants) {
            var similarContents = $('#similar-contents');
            similarContents.html('');

            $.each(restaurants, function(i, restaurant) {
                similarContents.append(`
                    <div class="similar_rest_card">
                        <div class="similar_rest_box">
                            <img class="similar_rest_distance_img"
                                src="${pageContext.request.contextPath}/resources/img/products_location_img.png"
                                alt="추천 식당 거리 표시 아이콘"> <span
                                class="similar_rest_distance_number"> </span>
                        </div>
                        <img class="similar_rest_img" src="">
                        <div class="similar_rest_average">
                            <img class="similar_rest_average_img"
                                src="${pageContext.request.contextPath}/resources/img/products_similar_star.png" alt=""> <span
                                class="similar_rest_average_number"> </span> 
                        </div>
                    </div>
                    <span class="similar_rest_title">가나다라<br></span>
                </div>
                `);
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
        }
    });
}
