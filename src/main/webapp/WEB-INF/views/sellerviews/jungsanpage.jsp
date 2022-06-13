<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Dashboard - SB Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="resources/css/sellercss/styles.css?var=1" rel="stylesheet" />
  <link rel="stylesheet" href="resources/css/sellercss/jungsan.css?var=1">
  <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
  <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
  <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="indexSeller.html">Seller Page</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
        class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
      <div class="input-group">
        <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
          aria-describedby="btnNavbarSearch" />
        <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
      </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
          aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
          <li><a class="dropdown-item" href="#!">Settings</a></li>
          <li><a class="dropdown-item" href="#!">Activity Log</a></li>
          <li>
            <hr class="dropdown-divider" />
          </li>
          <li><a class="dropdown-item" href="#!">Logout</a></li>
        </ul>
      </li>
    </ul>
  </nav>
  <div id="layoutSidenav">
    <div id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
          <div class="nav">
            <div class="sb-sidenav-menu-heading">Core</div>
            <a class="nav-link" href="indexSeller.html">
              <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
              Dashboard
            </a>
            <div class="sb-sidenav-menu-heading">Interface</div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
              aria-expanded="false" aria-controls="collapseLayouts">
              <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
              매출관리
              <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
            </a>
            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="layout-static.html">Static Navigation</a>
                <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
              </nav>
            </div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages"
              aria-expanded="false" aria-controls="collapsePages">
              <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
              주문관리
              <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
            </a>
            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
              <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth"
                  aria-expanded="false" aria-controls="pagesCollapseAuth">
                  Authentication
                  <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordionPages">
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="login.html">Login</a>
                    <a class="nav-link" href="register.html">Register</a>
                    <a class="nav-link" href="password.html">Forgot Password</a>
                  </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError"
                  aria-expanded="false" aria-controls="pagesCollapseError">
                  Error
                  <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordionPages">
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="401.html">401 Page</a>
                    <a class="nav-link" href="404.html">404 Page</a>
                    <a class="nav-link" href="500.html">500 Page</a>
                  </nav>
                </div>
              </nav>
            </div>
            <div class="sb-sidenav-menu-heading">Addons</div>
            <a class="nav-link" href="charts.html">
              <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
              댓글관리
            </a>
            <a class="nav-link" href="tables.html">
              <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
              고객문의
            </a>
          </div>
        </div>
        <div class="sb-sidenav-footer">
          <div class="small">Logged in as:</div>
          Start Bootstrap
        </div>
      </nav>
    </div>
    <div id="layoutSidenav_content">
      <main style="background-color: #f5f5f5">
        <div class="container-fluid px-4">
          <h1 class="mt-4 insert_title">판매자 정산내역</h1>
          <ol class="breadcrumb mb-3 bottomline">
            
            <li class="breadcrumb-item active"></li>
          </ol>
          <div class="category-box">
          <div class="col-2 category-header-content">
            <a href="#">정산예정 내역 </a><span>0</span>
          </div>
          <div class="paddingLeft1"></div>
          <div class="col-2 category-header-content">
            <a href="#">정산완료 내역 </a><span>0</span>
        </div>
        <div class="paddingLeft1"></div>
          <div class="col-2 category-header-content">
            <a href="#">나의 수수료 </a><span>0</span>
          </div>
        </div>
          <ol class="breadcrumb mb-3 bottomline">
          
        </ol>
          <div class="container container-option bottomline">
            
            <div class="row optionGroup1">
              

              <div class="col-2 option-name">기간</div>
              <div class="col option-line">
                <div class="btn-group paddingLeft1" role="group" aria-label="Basic radio toggle button group">
                  <input type="radio" class="btn-check dateBtn-1" name="btnradio" id="btnradio1" autocomplete="off"
                    checked />
                  <label class="btn btn-outline-secondary dateBtn" for="btnradio1">오늘</label>

                  <input type="radio" class="btn-check dateBtn-2" name="btnradio" id="btnradio2" autocomplete="off" />
                  <label class="btn btn-outline-secondary dateBtn" for="btnradio2">3일</label>

                  <input type="radio" class="btn-check dateBtn-3" name="btnradio" id="btnradio3" autocomplete="off" />
                  <label class="btn btn-outline-secondary dateBtn" for="btnradio3">1주일</label>

                  <input type="radio" class="btn-check dateBtn-4" name="btnradio" id="btnradio4" autocomplete="off" />
                  <label class="btn btn-outline-secondary dateBtn" for="btnradio4">1개월</label>

                  <input type="radio" class="btn-check dateBtn-5" name="btnradio" id="btnradio5" autocomplete="off" />
                  <label class="btn btn-outline-secondary dateBtn" for="btnradio5">3개월</label>
                </div>
              </div>
              <div class="col">
                <div class="paddingLeft1">
                  <input class="startDate" type="date" id="date" value="" />
                  <input class="endDate" type="date" id="date" value="" />
                </div>
              </div>
              <div class="col-3"></div>
            </div>
          </div>

        </div>
        
      </main>
      
    
      
      <!-- content -->
      <div class="content-table">
        <table class="table table-hover table-box-style">
          <thead>
            <tr class="content-table-title">
              <td class="content-table-title-text option-line">주문번호</td>
              <td class="content-table-title-text option-line">정산완료</td>
              <td class="content-table-title-text option-line">판매금액</td>
              <td class="content-table-title-text option-line">배송비</td>
              <td class="content-table-title-text option-line">쿠폰할인</td>
              <td class="content-table-title-text option-line">입점수수료</td>
              <td class="content-table-title-text option-line">결제방법</td>
              <td class="content-table-title-text option-line">정산금액</td>
              <td class="content-table-title-text option-line">비고</td>
              
            </tr>
          </thead>
          <tbody>
            <!-- for -->
            <tr class="content-table-content content-hover">
              
              
              <td class="content-table-content-text option-line">7539517</td>
              <td class="content-table-content-text option-line">2022-04-01</td>
              <td class="content-table-content-text option-line">20,000</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">1,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
            </tr>

            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">9638558</td>
              <td class="content-table-content-text option-line">2022-04-05</td>
              <td class="content-table-content-text option-line">30,000</td>
              <td class="content-table-content-text option-line">5,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
              
            </tr>
            <tr class="content-table-content content-hover">
              
              
              <td class="content-table-content-text option-line">7539517</td>
              <td class="content-table-content-text option-line">2022-04-01</td>
              <td class="content-table-content-text option-line">20,000</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">1,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
            </tr>
            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">9638558</td>
              <td class="content-table-content-text option-line">2022-04-05</td>
              <td class="content-table-content-text option-line">30,000</td>
              <td class="content-table-content-text option-line">5,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
              
            </tr>
            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">7539517</td>
              <td class="content-table-content-text option-line">2022-04-01</td>
              <td class="content-table-content-text option-line">20,000</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">1,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
            </tr>
            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">9638558</td>
              <td class="content-table-content-text option-line">2022-04-05</td>
              <td class="content-table-content-text option-line">30,000</td>
              <td class="content-table-content-text option-line">5,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
              
            </tr>
            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">9638558</td>
              <td class="content-table-content-text option-line">2022-04-05</td>
              <td class="content-table-content-text option-line">30,000</td>
              <td class="content-table-content-text option-line">5,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
              
            </tr>
            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">9638558</td>
              <td class="content-table-content-text option-line">2022-04-05</td>
              <td class="content-table-content-text option-line">30,000</td>
              <td class="content-table-content-text option-line">5,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
              
            </tr>
            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">9638558</td>
              <td class="content-table-content-text option-line">2022-04-05</td>
              <td class="content-table-content-text option-line">30,000</td>
              <td class="content-table-content-text option-line">5,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
              
            </tr>
            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">9638558</td>
              <td class="content-table-content-text option-line">2022-04-05</td>
              <td class="content-table-content-text option-line">30,000</td>
              <td class="content-table-content-text option-line">5,000원</td>
              <td class="content-table-content-text option-line">4,000point</td>
              <td class="content-table-content-text option-line">3,000원</td>
              <td class="content-table-content-text option-line">카드</td>
              <td class="content-table-content-text option-line">12,000원</td>
              <td class="content-table-content-text option-line">정산완료</td>
              
            </tr>

          </tbody>
          <tfoot>

          </tfoot>
        </table>
      </div>
      
      <!-- footer -->
      <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid px-4">
          <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted">Copyright &copy; Your Website 2022</div>
            <div>
              <a href="#">Privacy Policy</a>
              &middot;
              <a href="#">Terms &amp; Conditions</a>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="js/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
  <script src="assets/demo/chart-area-demo.js"></script>
  <script src="assets/demo/chart-bar-demo.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
  <script src="js/datatables-simple-demo.js"></script>
  <script src="./js/seller-customerInquiry.js"></script>
</body>

</html>