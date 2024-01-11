// 관리자 페이지 대시보드 :admin_main.jsp

// 페이지 로딩 시 차트 표시
document.addEventListener('DOMContentLoaded', (event) => {
    // myChart1();
    // myChart3();

	// 클릭 이벤트(toggleButton1(), toggleButton2()) 때문에 페이지 로딩 시
	// 일단 chartButton2, chartButton4 누르고
    document.getElementById('chartButton2').click();
    document.getElementById('chartButton4').click();
	// 바로 chartButton1, chartButton3 버튼 눌러서 해당 버튼들이 체크 표시가 되도록 함
    document.getElementById('chartButton1').click();
    document.getElementById('chartButton3').click();
});

var activeButton1 = 'chartButton1';
var activeButton2 = 'chartButton3';

function toggleButton1(id) {
    var buttons = ['chartButton1', 'chartButton2'];
    buttons.forEach(function(buttonId) {
        document.getElementById(buttonId).style.backgroundColor = "";
    });
    if (activeButton1 !== id) {
        document.getElementById(id).style.backgroundColor = "#3FAFFC";
        activeButton1 = id;
    } else {
        activeButton1 = '';
    }
}
function toggleButton2(id) {
    var buttons = ['chartButton3', 'chartButton4'];
    buttons.forEach(function(buttonId) {
        document.getElementById(buttonId).style.backgroundColor = "";
    });
    if (activeButton2 !== id) {
        document.getElementById(id).style.backgroundColor = "#3FAFFC";
        activeButton2 = id;
    } else {
        activeButton2 = '';
    }
}


var myChart; // 차트를 저장할 전역 변수 선언

// 방문&가입자 현황 : 시간별
function countInTimeRange(range, data_join_times) {
    // range를 "시작시간~종료시간" 형식으로 분리
    var rangeTimes = range.split('~');
    var startTime = convertToMinutes(rangeTimes[0]);
    var endTime = convertToMinutes(rangeTimes[1]);

    // 시간 데이터를 올바른 형식으로 변환
    var formatJoinTimes = data_join_times.map(time => {
        var [hour, minute] = time.split(':');
        return convertToMinutes(`${hour.padStart(2, '0')}:${minute.padStart(2, '0')}`);
    });

    // 회원 가입 시간이 range 내에 있는지 확인
    var count = formatJoinTimes.filter(time => {
        if (startTime < endTime) {
            return time >= startTime && time < endTime;
        } else {
            // 시작 시간이 종료 시간보다 큰 경우 (예: 23:00~00:00)
            return time >= startTime || time < endTime;
        }
    }).length;

    return count;
}
function generateTimes() {
    var join_times = [];
    for (var i=0; i<24; i++) {
        var join_hour = i < 10 ? "0" + i : i.toString();
        var next_hour = (i+1) < 10 ? "0" + (i+1) : (i+1).toString();
        join_times.push(join_hour + ":00~" + next_hour + ":00");
    }
    return join_times;
}
function convertToMinutes(time) {
    var time_parts = time.split(":");
    var hours = parseInt(time_parts[0]);
    var minutes = parseInt(time_parts[1]);
    return hours * 60 + minutes;
}
function myChart1() {
    var content1 = document.getElementById("content1");
    var content2 = document.getElementById("content2");


    if (content1.style.display === "none") {
        content1.style.display = "block";
        content2.style.display = "none";  // content2을 숨김
    
		$.ajax({
            type: "GET",
            url: "/zzimkong/admin/mainDataJoinTimeCount",
            dataType: "json",
            success: function(data) {
				
			    console.log("data : " + data);
			    console.log(JSON.stringify(data));
			    
			    var join_times = generateTimes(); // 모든 시간대 생성
			    var join_time_counts = [];
			
			    var data_join_times = data.join_times || []; // data.join_times 값이 null이면 빈 배열을 사용
				
				var join_times = [];
				var current_hour = new Date().getHours();  // 현재 시간을 얻음
				for (var i=0; i<12; i++) {  // 12시간 동안의 데이터만 필요하므로 범위를 12로 조정
				    var hour = (current_hour - 12 + i + 24) % 24;  // 12시간 전부터 시작해서 시간이 24를 넘어가면 0으로 돌아가도록
				    hour = hour < 10 ? '0' + hour : hour.toString();  // 시간이 한 자릿수라면 앞에 0을 붙임
				    var next_hour = (current_hour - 12 + i + 1 + 24) % 24;  // 다음 시간을 계산
				    next_hour = next_hour < 10 ? '0' + next_hour : next_hour.toString();  // 시간이 한 자릿수라면 앞에 0을 붙임
				    join_times.push(hour + ':00~' + next_hour + ':00');  // 시간 범위를 나타내는 문자열을 생성
				}

				var min_time = convertToMinutes("00:00");
				var max_time = convertToMinutes("23:59");
				
				var ranges = [];
				for (var i = min_time; i < max_time; i += 30) {  // 30분 단위로 시간 범위 설정
				    var range_start = i;
				    var range_end = i + 29;  // 범위의 끝은 시작 시간 + 29분
				    ranges.push(range_start + "~" + range_end);
				}
				console.log("data_join_times: " + data_join_times);
				
				// data_join_times의 길이 확인
				console.log("data_join_times length: " + data_join_times.length);
				
				for (var i=0; i<join_times.length; i++) {
				    console.log("join_times[" + i + "]: " + join_times[i]);  // 추가된 로그
				    if(join_times[i] !== undefined) {
				        var count = countInTimeRange(join_times[i], data_join_times);
				        console.log("count for " + join_times[i] + ": " + count);  // count 값 로그에 추가
				        join_time_counts.push(count);
				    } else {
				        console.log('join_times[' + i + '] is undefined.');
				    }
				}
				
				var maxCount = Math.max.apply(null, join_time_counts); // counts2 배열에서 최대값 찾기
                var ctx = document.getElementById('myChart1').getContext('2d'); // 새로운 canvas 요소의 id
				let barData = join_time_counts.map(count => count + 15); // 'line' 데이터보다 항상 15 큰 'bar' 데이터 생성
                myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: join_times,
                        datasets: [{
                            label: '시간당 회원가입 건수 (지난 12시간)',
                            data: join_time_counts,
                            backgroundColor: '#0095FB',
                            borderColor: '#0095FB',
                            borderWidth: 1
                        },
						{
							type: 'bar',
				            label: '시간당 방문자 수 (지난 12시간) : 안함!',
				            data: barData,
				            backgroundColor: '#eff7fe',
				            borderColor: '#eff7fe',
				            borderWidth: 1
						}]
                    },
                    options: {
                        scales: {
							y: {
								suggestedMax: maxCount * 1.1, // 최대값의 110%
								stacked: true
							}
                        }
                    }
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
			     console.log('AJAX 요청 실패!');
			     console.log('HTTP status:', jqXHR.status);
			     console.log('textStatus:', textStatus);
			     console.log('errorThrown:', errorThrown);
			}
        });
    } else {
        content1.style.display = "none";
    }
}


// 방문&가입자 현황 : 날짜별
function myChart2() {
    var content1 = document.getElementById("content1");
    var content2 = document.getElementById("content2");
    
    if (content2.style.display === "none") {
        content2.style.display = "block";
        content1.style.display = "none";  // content1을 숨김
    
		$.ajax({
            type: "GET",
            url: "/zzimkong/admin/mainDataJoinDateCount",
            dataType: "json",
            success: function(data) {
                var join_dates = data.join_dates;
                var join_date_counts = data.join_date_counts;
				
				var maxCount = Math.max.apply(null, join_date_counts); // join_date_counts 배열에서 최대값 찾기
                var ctx = document.getElementById('myChart2').getContext('2d'); // 새로운 canvas 요소의 id
                let barData = join_date_counts.map(count => count + 15); // 'line' 데이터보다 항상 15 큰 'bar' 데이터 생성
                myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: join_dates,
                        datasets: [{
                            label: '일일 회원가입 건수 (지난 7일)',
                            data: join_date_counts,
                            backgroundColor: '#0095FB',
                            borderColor: '#0095FB',
                            borderWidth: 1
                        },
						{
							type: 'bar',
				            label: '일일 방문자 수 (지난 7일) : 안함!',
				            data: barData,
				            backgroundColor: '#eff7fe',
				            borderColor: '#eff7fe',
				            borderWidth: 1
						}]
                    },
                    options: {
                        scales: {
							y: {
								suggestedMax: maxCount * 2.0, // 최대값의 110%
								stacked: true
							}
                        }
                    }
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
			     console.log('AJAX 요청 실패!');
			     console.log('HTTP status:', jqXHR.status);
			     console.log('textStatus:', textStatus);
			     console.log('errorThrown:', errorThrown);
			}
        });
    } else {
        content2.style.display = "none";
    }
}


// 예약자 현황 : 시간별
function countInTimeRange(range, data_res_times) {
    // range를 "시작시간~종료시간" 형식으로 분리
    var rangeTimes = range.split('~');
    var startTime = convertToMinutes(rangeTimes[0]);
    var endTime = convertToMinutes(rangeTimes[1]);

    // 시간 데이터를 올바른 형식으로 변환
    var formatResTimes = data_res_times.map(time => {
        var [hour, minute] = time.split(':');
        return convertToMinutes(`${hour.padStart(2, '0')}:${minute.padStart(2, '0')}`);
    });

    // 회원 가입 시간이 range 내에 있는지 확인
    var count = formatResTimes.filter(time => {
        if (startTime < endTime) {
            return time >= startTime && time < endTime;
        } else {
            // 시작 시간이 종료 시간보다 큰 경우 (예: 23:00~00:00)
            return time >= startTime || time < endTime;
        }
    }).length;

    return count;
}
function generateTimes() {
    var res_times = [];
    for (var i=0; i<24; i++) {
        var res_hour = i < 10 ? "0" + i : i.toString();
        var next_hour = (i+1) < 10 ? "0" + (i+1) : (i+1).toString();
        res_times.push(res_hour + ":00~" + next_hour + ":00");
    }
    return res_times;
}
function convertToMinutes(time) {
    var time_parts = time.split(":");
    var hours = parseInt(time_parts[0]);
    var minutes = parseInt(time_parts[1]);
    return hours * 60 + minutes;
}
function myChart3() {
    var content3 = document.getElementById("content3");
    var content4 = document.getElementById("content4");

    if (content3.style.display === "none") {
        content3.style.display = "block";
        content4.style.display = "none";  

		$.ajax({
            type: "GET",
            url: "/zzimkong/admin/mainDataResTimeCount",
            dataType: "json",
            success: function(data) {
			    console.log("data : " + data);
			    console.log(JSON.stringify(data));
			    
		    	var res_times = generateTimes(); // 모든 시간대 생성
			    var res_time_counts = [];
			
			    var data_res_times = data.res_times || []; // data.res_times 값이 null이면 빈 배열을 사용
				
				var res_times = [];
				var current_hour = new Date().getHours();  // 현재 시간을 얻음
				for (var i=0; i<12; i++) {  // 12시간 동안의 데이터만 필요하므로 범위를 12로 조정
				    var hour = (current_hour - 12 + i + 24) % 24;  // 12시간 전부터 시작해서 시간이 24를 넘어가면 0으로 돌아가도록
				    hour = hour < 10 ? '0' + hour : hour.toString();  // 시간이 한 자릿수라면 앞에 0을 붙임
				    var next_hour = (current_hour - 12 + i + 1 + 24) % 24;  // 다음 시간을 계산
				    next_hour = next_hour < 10 ? '0' + next_hour : next_hour.toString();  // 시간이 한 자릿수라면 앞에 0을 붙임
				    res_times.push(hour + ':00~' + next_hour + ':00');  // 시간 범위를 나타내는 문자열을 생성
				}

				var min_time = convertToMinutes("00:00");
				var max_time = convertToMinutes("23:59");
				
				var ranges = [];
				for (var i = min_time; i < max_time; i += 30) {  // 30분 단위로 시간 범위 설정
				    var range_start = i;
				    var range_end = i + 29;  // 범위의 끝은 시작 시간 + 29분
				    ranges.push(range_start + "~" + range_end);
				}
				console.log("data_res_times: " + data_res_times);
				
				// data_res_times의 길이 확인
				console.log("data_res_times length: " + data_res_times.length);
				
				for (var i=0; i<res_times.length; i++) {
				    console.log("res_times[" + i + "]: " + res_times[i]);  // 추가된 로그
				    if(res_times[i] !== undefined) {
				        var count = countInTimeRange(res_times[i], data_res_times);
				        console.log("count for " + res_times[i] + ": " + count);  // count 값 로그에 추가
				        res_time_counts.push(count);
				    } else {
				        console.log('res_times[' + i + '] is undefined.');
				    }
				}
			    
	            var maxCount = Math.max.apply(null, res_time_counts);
	            var ctx = document.getElementById('myChart3').getContext('2d');
	            myChart = new Chart(ctx, {
	                type: 'line',
	                data: {
	                    labels: res_times,
	                    datasets: [{
	                        label: '시간당 예약 건수 (지난 12시간)',
	                        data: res_time_counts,
	                        backgroundColor: '#0095FB',
	                        borderColor: '#0095FB',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
							y: { // 여러 데이터 세트를 y축에 누적하여 표시
								suggestedMax: maxCount * 1.1, // 최대값의 110%
								stacked: true,
								beginAtZero: true // y축의 시작점을 0으로
							}
                        }
                    }
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
			     console.log('AJAX 요청 실패!');
			     console.log('HTTP status:', jqXHR.status);
			     console.log('textStatus:', textStatus);
			     console.log('errorThrown:', errorThrown);
			}
        });
    } else {
        content3.style.display = "none";
    }
}


// 예약자 현황 : 날짜별
function myChart4() {
    var content3 = document.getElementById("content3");
    var content4 = document.getElementById("content4");
    
    if (content4.style.display === "none") {
        content4.style.display = "block";
        content3.style.display = "none";  // content3을 숨김

        $.ajax({
            type: "GET",
            url: "/zzimkong/admin/mainDataResDateCount",
            dataType: "json",
            success: function(data) {
                var res_dates = data.res_dates;
                var res_date_counts = data.res_date_counts;

				var maxCount = Math.max.apply(null, res_date_counts); // res_date_counts 배열에서 최대값 찾기
                var ctx = document.getElementById('myChart4').getContext('2d');
                myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: res_dates,
                        datasets: [{
                            label: '일일 예약 건수 (지난 7일)',
                            data: res_date_counts,
                            backgroundColor: '#0095FB',
                            borderColor: '#0095FB',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
							y: { // 여러 데이터 세트를 y축에 누적하여 표시
								suggestedMax: maxCount * 1.1, // 최대값의 110%
								stacked: true,
								beginAtZero: true // y축의 시작점을 0으로
							}
                        }
                    }
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
			     console.log('AJAX 요청 실패!');
			     console.log('HTTP status:', jqXHR.status);
			     console.log('textStatus:', textStatus);
			     console.log('errorThrown:', errorThrown);
			}
        });
    } else {
        content4.style.display = "none";
    }
}
