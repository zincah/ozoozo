<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="resources/css/admincss/fonts.css" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css" rel="stylesheet" />
    <link href="resources/css/admincss/membermanagement_dh.css" rel="stylesheet" />
    <link href="resources/css/admincss/insertProduct_dh.css?var=1" rel="stylesheet" />
    <link href="resources/css/admincss/seller-productManagement_dh.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
  </head>
 
 		<jsp:include page="header/header.jsp"></jsp:include>
        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <h1 class="mt-4 insert_title">회원 관리</h1>
            <ol class="breadcrumb mb-3 bottomline">
              <li class="breadcrumb-item active">Member Management</li>
            </ol>
            
            <div class="">
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">검색어</div>
                  <div class="col search-input">
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                      <select class="form-select selectState" id="large-select" aria-label="Default select example">
                        <option selected disabled>분류</option>
                        <option value="1">이름</option>
                        <option value="2">닉네임</option>
                        <option value="3">E-Mail</option>
                      </select>
                    </div>
                    <div class="search-input-box">
                        
                      <input type="text" class="form-control form-control-sm input-font" id="exampleFormControlInput1" placeholder="" />
                    </div>
                    
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">회원 구분</div>
                  <div class="col search-check-group">
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" />
                      <label class="form-check-label" for="flexCheckDefault1"> 전체 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault2" />
                      <label class="form-check-label" for="flexCheckDefault2"> 개인회원 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault3" />
                      <label class="form-check-label" for="flexCheckDefault3"> 사업자회원 </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">회원등급</div>
                  <div class="col search-input">
                    <div class="radio-productCode">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <select class="form-select selectState" id="large-select" aria-label="Default select example">
                          <option selected disabled>등급</option>
                          <option value="1">쪼다</option>
                          <option value="2">일반인</option>
                          <option value="3">흑우</option>
                          <option value="4">호갱</option>
                          <option value="5">돈줄</option>
                          <option value="6">직원 5명 월급</option>
                          <option value="7">회장님</option>
                        </select>
                      </div>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">가입 기간</div>
                  <div class="col search-input">
                    <div class="paddingLeft1">
                      <input class="startDate" type="date" id="date" value="" />
                      <input class="endDate" type="date" id="date" value="" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding">
                <div class="row optionGroup1">
                  <div class="col search-submitBtn">
                    <div class="d-grid gap-2">
                      <button class="btn btn-secondary submitBtn" type="button">검색</button>
                    </div>
                    <div class="d-grid gap-2">
                      <button class="btn btn-outline-secondary initBtn" type="button">초기화</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        <!-- content -->
        <div class="content-table">
          <table class="table table-hover table-box-style">
            <thead>
              <tr class="content-table-title">
                <td class="content-table-title-text option-line">
                  <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" />
                </td>
                <td class="content-table-title-text option-line">UID</td>
                <td class="content-table-title-text option-line">이름</td>
                <td class="content-table-title-text option-line">이메일</td>
                <td class="content-table-title-text option-line">닉네임</td>
                <td class="content-table-title-text option-line">구매건수</td>
                <td class="content-table-title-text option-line">성별</td>
                <td class="content-table-title-text option-line">회원가입일</td>
                <td class="content-table-title-text option-line">최종로그인</td>
                <td class="content-table-title-text option-line">Point</td>
                <td class="content-table-title-text ">현재 상태</td>
              </tr>
            </thead>
            <tbody>
              <!-- for -->
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line"><input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" /></td>
                <td class="content-table-content-text option-line state0">100000</td>
                <td class="content-table-content-text option-line">정머현</td>
                <td class="content-table-content-text option-line" >qweqwe@asdlf.com</td>
                <td class="content-table-content-text option-line">나니파비</td>
                <td class="content-table-content-text option-line">132</td>
                <td class="content-table-content-text option-line">남</td>
                <td class="content-table-content-text option-line">2022-04-12</td>
                <td class="content-table-content-text option-line">2022-04-12 16:44</td>
                <td class="content-table-content-text option-line">789</td>
                <td class="content-table-content-text option-line">정지</td>
              </tr>
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line"><input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" /></td>
                <td class="content-table-content-text option-line state1">100001</td>
                <td class="content-table-content-text option-line">20</td>
                <td class="content-table-content-text option-line">ajasdg.aldbkjsasl.asdlf</td>
                <td class="content-table-content-text option-line">중20병</td>
                <td class="content-table-content-text option-line">132</td>
                <td class="content-table-content-text option-line">여</td>
                <td class="content-table-content-text option-line">2022-04-12</td>
                <td class="content-table-content-text option-line">2022-04-12 16:44</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">활동중</td>
              </tr>
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line"><input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" /></td>
                <td class="content-table-content-text option-line state1">100002</td>
                <td class="content-table-content-text option-line">동동</td>
                <td class="content-table-content-text option-line">adfkafd.cvj</td>
                <td class="content-table-content-text option-line">개미햝기붥</td>
                <td class="content-table-content-text option-line">132</td>
                <td class="content-table-content-text option-line">남</td>
                <td class="content-table-content-text option-line">2022-04-12</td>
                <td class="content-table-content-text option-line">2022-04-12 16:37</td>
                <td class="content-table-content-text option-line">235</td>
                <td class="content-table-content-text option-line">똥싸는중</td>
              </tr>
            </tbody>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/admin-productManagement.js"></script>
  </body>
</html>
