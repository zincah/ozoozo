<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.jsp">Admin Page</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="logout.admin">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Main</div>
                        <a class="nav-link" href="index.admin">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            센터 홈
                        </a>

                        <div class="sb-sidenav-menu-heading">seller Management</div>


                        <a class="nav-link" href="information.admin">
                            <div class="sb-nav-link-icon"><i class="bi bi-megaphone-fill"></i></div>
                            공지사항
                        </a>
                        
                        <a class="nav-link collapsed" href="companyManagement.admin">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            업체관리

                        </a>
                        <a class="nav-link collapsed" href="productManagementList.admin">
                            <div class="sb-nav-link-icon"><i class="bi bi-plus-square-dotted"></i></div>
                            상품등록관리

                        </a>
                        <a class="nav-link collapsed" href="reviewManagement.admin">
                            <div class="sb-nav-link-icon"><i class="bi bi-exclamation-circle"></i></div>
                            리뷰신고관리

                        </a>


                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                                    aria-controls="pagesCollapseAuth">
                                    주문건수
                                    <div class="sb-sidenav-collapse-arrow"></div>
                                </a>



                                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="#"></a>
                                        <a class="nav-link" href="#">404 Page</a>
                                        <a class="nav-link" href="#">500 Page</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>



                        <div class="sb-sidenav-menu-heading">Sales Management</div>
                        <a class="nav-link" href="salesStatus.admin">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            매출현황
                        </a>

                        <div class="sb-sidenav-menu-heading">CS Management</div>
                        <a class="nav-link" href="clientInformation.admin">
                            <div class="sb-nav-link-icon"><i class="bi bi-info-square-fill"></i></div>
                            고객센터 공지사항
                        </a>
                        <a class="nav-link" href="memberManagement.admin">
                            <div class="sb-nav-link-icon">
                                <i class="bi bi-person-video2"></i>
                            </div>
                            회원관리
                        </a>
                        <a class="nav-link" href="couponManagement.admin">
                            <div class="sb-nav-link-icon"><i class="bi bi-ticket"></i>
                            </div>
                            쿠폰발급
                        </a>
                        <a class="nav-link" href="m_eventManagement.admin">
                            <div class="sb-nav-link-icon"><i class="bi bi-calendar3-event"></i></div>
                            이벤트관리
                        </a>
                    </div>
                </div>




                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    ${admincode}
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">