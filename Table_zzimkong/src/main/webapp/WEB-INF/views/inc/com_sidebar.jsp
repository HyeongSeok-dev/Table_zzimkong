<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_sidebar.jsp</title>
<%-- 사이드바 css --%>
<link href="${pageContext.request.contextPath }/resources/css/com_sidebar.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <nav class="sidebar close">
        <header>
            <div class="image-text">
            	<%-- 찜콩 로고 넣을 위치 --%>
                <span class="image">
                    <a href="./"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt="찜콩"></a>
                </span>

                <div class="text logo-text">
                	<%-- 찜콩 사이트의 메인페이지로 (혹은 로고에 적용하기?) --%>
                    <span class="name">찜콩</span>
                    <span class="profession">맛집 예약 사이트</span>
                </div>
            </div>

            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">
            <div class="menu">

                <li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text" placeholder="Search...">
                </li>

                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="${pageContext.request.contextPath}/company/com_main.jsp">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">Dashboard</span>
                            <!-- 여기가 업주페이지 메인(판매관리페이지차트임) -->
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="${pageContext.request.contextPath}/company/com_company.jsp">
                            <i class='bx bx-store icon' ></i>
                            <span class="text nav-text">내업체관리</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="${pageContext.request.contextPath}/company/com_menu_form.jsp">
                            <i class='bx bx-comment-detail icon' ></i>
                            <span class="text nav-text">메뉴관리</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="${pageContext.request.contextPath}/company/com_reservation.jsp">
                            <i class='bx bx-comment-detail icon' ></i>
                            <span class="text nav-text">예약관리</span>
                        </a>
                    </li>
                    
                    <li class="nav-link">
                        <a href="${pageContext.request.contextPath}/company/com_black.jsp">
                            <i class='bx bx-user icon' ></i>
                            <span class="text nav-text">블랙회원관리</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-support icon' ></i>
                            <span class="text nav-text">고객센터</span>
                        </a>
                    </li>

                </ul>
            </div>

            <div class="bottom-content">
            	<%-- 로그아웃 설정하기 --%>
                <li class="">
                    <a href="#">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>

                <li class="mode">
                    <div class="sun-moon">
                        <i class='bx bx-moon icon moon'></i>
                        <i class='bx bx-sun icon sun'></i>
                    </div>
                    <span class="mode-text text">Dark mode</span>

                    <div class="toggle-switch">
                        <span class="switch"></span>
                    </div>
                </li>
            </div>
        </div>
    </nav>
    <script src="${pageContext.request.contextPath }/resources/js/sidebar.js"></script>
</body>
</html>