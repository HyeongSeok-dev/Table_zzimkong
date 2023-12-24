$(document).ready(function() {
    // Loop through each .reservation-time
    $('.reservation-time').each(function() {
        var openTime = $(this).data('start-time'); // Get the opening time for the company
        createTimeButtons($(this), openTime, 30, 4); // Generate buttons for each company
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
                click: function() { reserve(formattedTime); }
            }).appendTo($container);
        }
    }
}

function getRemainingPeople($container, index) {
    return parseInt($container.data('remaining' + index));
}

function reserve(time) {
    // Reservation logic here
    console.log("Reserve at: " + time);
}