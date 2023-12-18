function myChart0() {
	// 차트를 그럴 영역을 dom요소로 가져온다.
	var chartArea = document.getElementById('myChart').getContext('2d');
	// 차트를 생성한다. 
	var myChart = new Chart(chartArea, {
	    // ①차트의 종류(String)
	    type: 'line',
	    // ②차트의 데이터(Object)
	    data: {
	        // ③x축에 들어갈 이름들(Array)
	        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
	        datasets: [{
	            // ⑤dataset의 이름(String)
	            label: '# of Votes',
	            // ⑥dataset값(Array)
	            data: [12, 19, 3, 5, 2, 3],
	            // ⑦dataset의 배경색(rgba값을 String으로 표현)
	            backgroundColor: 'rgba(255, 99, 132, 0.2)',
	            // ⑧dataset의 선 색(rgba값을 String으로 표현)
	            borderColor: 'rgba(255, 99, 132, 1)',
	            // ⑨dataset의 선 두께(Number)
	            borderWidth: 1
	        }]
	    },
	    // ⑩차트의 설정(Object)
	    options: {
	        // ⑪축에 관한 설정(Object)
	        scales: {
	            // ⑫y축에 대한 설정(Object)
	            y: {
	                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
	                beginAtZero: true
	            }
	        }
	    }
	});
}

function myChart1() {
    var content1 = document.getElementById("content1");
    var content2 = document.getElementById("content2");
    
    if (content1.style.display === "none") {
        content1.style.display = "block";
        content2.style.display = "none";  // content2를 숨김
        
        var chartArea = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(chartArea, {
		    type: 'line',
		    data: {
		        labels: ['00:00', '01:00', '02:00', '03:00', '04:00', '05:00', '06:00'],
		        datasets: [{
		            label: '가입자',
		            data: [10, 22, 11, 34, 24, 13, 20],
		            backgroundColor: '#0095FB',
		            borderColor: '#0095FB',
		            borderWidth: 1,
		            paddding: 10
		        },
		        {
					type: 'bar',
		            label: '방문자',
		            data: [20, 80, 23, 55, 52, 43, 99],
		            backgroundColor: '#eff7fe',
		            borderColor: '#eff7fe',
		            borderWidth: 1
		        },
		        ]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
    } else {
        content1.style.display = "none";
    }
}

function myChart2() {
    var content1 = document.getElementById("content1");
    var content2 = document.getElementById("content2");
    
    if (content2.style.display === "none") {
        content2.style.display = "block";
        content1.style.display = "none";  // content1을 숨김
        
        var chartArea = document.getElementById('myChart2').getContext('2d');
		var myChart = new Chart(chartArea, {
		    type: 'line',
		    data: {
		        labels: ['12/02', '12/03', '12/04', '12/05', '12/06', '12/07', '12/08'],
		        datasets: [{
		            label: '가입자',
		            data: [120, 32, 11, 25, 22, 23, 90],
		            backgroundColor: '#0095FB',
		            borderColor: '#0095FB',
		            borderWidth: 1,
		            paddding: 10
		        },
		        {
					type: 'bar',
		            label: '방문자',
		            data: [220, 100, 123, 155, 152, 93, 299],
		            backgroundColor: '#eff7fe',
		            borderColor: '#eff7fe',
		            borderWidth: 1
		        },
		        ]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
    } else {
        content2.style.display = "none";
    }
}

function myChart3() {
    var content3 = document.getElementById("content3");
    var content4 = document.getElementById("content4");
    
    if (content3.style.display === "none") {
        content3.style.display = "block";
        content4.style.display = "none";  // content4을 숨김
        
        var chartArea = document.getElementById('myChart3').getContext('2d');
		var myChart = new Chart(chartArea, {
		    type: 'line',
		    data: {
		        labels: ['00:00', '01:00', '02:00', '03:00', '04:00', '05:00', '06:00'],
		        datasets: [{
		            label: '예약자',
		            data: [42, 62, 12, 75, 122, 23, 52],
		            backgroundColor: '#0095FB',
		            borderColor: '#0095FB',
		            borderWidth: 1,
		            paddding: 10
		        }
		        ]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
    } else {
        content3.style.display = "none";
    }
}

function myChart4() {
    var content3 = document.getElementById("content3");
    var content4 = document.getElementById("content4");
    
    if (content4.style.display === "none") {
        content4.style.display = "block";
        content3.style.display = "none";  // content3을 숨김
        
        var chartArea = document.getElementById('myChart4').getContext('2d');
		var myChart = new Chart(chartArea, {
		    type: 'line',
		    data: {
		        labels: ['12/02', '12/03', '12/04', '12/05', '12/06', '12/07', '12/08'],
		        datasets: [{
		            label: '예약자',
		            data: [14, 30, 31, 15, 12, 63, 37],
		            backgroundColor: '#0095FB',
		            borderColor: '#0095FB',
		            borderWidth: 1,
		            padddin: 10
		        }
		        ]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
    } else {
        content4.style.display = "none";
    }
}

