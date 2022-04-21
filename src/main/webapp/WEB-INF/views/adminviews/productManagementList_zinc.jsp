<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css" rel="stylesheet" />
    <link href="resources/css/admincss/productManagement.css?var=1" rel="stylesheet" />
    <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>
      $(document).ready(function(){

        /* 새 공지사항 jquery */
        $("#new_info").click(function(){

          $(".insert_btn").show();
          $(".reset_btn").show();
          $(".modi_btn").hide();
          $(".del_btn").hide();
          $(".stop_btn").hide();

          $("#info_newTitle").show();
          $("#info_title").hide();

          $("#info_content").text("");
          $("#info_content").removeAttr("disabled");
        });


      });
    
    </script>
  </head>
  
  		<jsp:include page="header/header.jsp"></jsp:include>

        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <div class="header_layer">
              <h1 class="mt-4 insert_title">판매 게시글 등록 관리</h1>
              
            </div>
            <ol class="breadcrumb mb-3 bottomline">
              <li class="breadcrumb-item active">Manage sales posts</li>
            </ol>
            <div class="container container-option bottomline">
              <div class="row optionGroup1">
                <div class="col-1 option-name">등록일</div>
                <div class="col option-line">
                  <div class="btn-group paddingLeft1" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check dateBtn-1" name="btnradio" id="btnradio1" autocomplete="off" checked />
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
                <div class="col-3">
                  
                </div>
              </div>
            </div>

            <div class="container container-option container-option-topPadding bottomline">
              <div class="row optionGroup1">
                <div class="col-1 option-name">분류</div>
                <div class="col-10">
                    <div class="radio-productCode paddingLeft1 align-custom">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <select class="form-select selectState" id="large-select" aria-label="Default select example" style="width: 200px;">
                          <option selected value="0">카테고리 전체</option>
                          <option value="1">가구</option>
                          <option value="2">패브릭</option>
                          <option value="3">조명</option>
                          <option value="4">가전</option>
                          <option value="5">주방용품</option>
                          <option value="6">데코/식물</option>
                          <option value="7">수납/정리</option>
                        </select>
                      </div>
                      <div class="radio_layer paddingLeft1">
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                          <label class="form-check-label" for="flexRadioDefault1"> 전체 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked="">
                          <label class="form-check-label" for="flexRadioDefault2"> 보류중 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked="">
                          <label class="form-check-label" for="flexRadioDefault3"> 승인대기 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked="">
                          <label class="form-check-label" for="flexRadioDefault3"> 승인완료 </label>
                        </div>

                      </div>

                    </div>

                </div>
                

            </div>
            </div>

            <div class="container container-option container-option-topPadding">
              <div class="row optionGroup1">
                <div class="col-1 option-name">검색</div>
                <div class="col-10 search-layer">
                    
                    <input class="form-control size-input" type="text">
                    
                    <div class="radio-productCode paddingLeft1 align-custom">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <select class="form-select selectState" id="large-select" aria-label="Default select example" style="width: 150px;">
                          <option selected value="0">검색 필터</option>
                          <option value="1">브랜드명</option>
                          <option value="2">판매 게시글 명</option>
                          <option value="3">종류</option>
                        </select>
                      </div>
                    </div>
                </div>
                

            </div>
            
        </main>
        <!-- content -->
        <div class="content-table">
          <div class="filter-layer text-end mb-2">
            <button type="button" class="btn btn-outline-secondary" style="width: 100px;" data-bs-toggle="modal" data-bs-target="#coupon_register">쿠폰 등록</button>
          </div>
          <div class="table_layer">
            <table class="table table-hover table-box-style">
              <thead>
                <tr class="content-table-title">
                  <td class="content-table-title-text option-line" style="width: 1rem;">
                    <input class="form-check-input form-check-input-margin" type="checkbox" id="flexCheckDefault" onclick="selectAll(this)"/>
                  </td>
                  <td class="content-table-title-text option-line" style="width: 4rem;">브랜드명</td>
                  <td class="content-table-title-text option-line" style="width: 15rem;">판매 게시글 명</td>
                  <td class="content-table-title-text option-line" style="width: 4rem;">카테고리</td>
                  <td class="content-table-title-text option-line" style="width: 1rem;">건</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">종류</td>
                  <td class="content-table-title-text option-line" style="width: 5rem;">쿠폰정보</td>
                  <td class="content-table-title-text option-line" style="width: 7rem;">신청일</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">상태</td>
                </tr>
              </thead>
              <tbody>
                <!-- for -->
                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">퀵슬립</td>
                  <td class="content-table-content-text option-line">
                    <a href="insertProductList.html">Q4 유로탑 롤팩 매트리스 2size</a>
                    </td>
                  <td class="content-table-content-text option-line">가구</td>
                  <td class="content-table-content-text option-line">2</td>
                  <td class="content-table-content-text option-line">매트리스</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line">승인완료</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">이노하우스</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">1+1 수압상승 3중 필터샤워기(+필터6개) 샤워기헤드</a>
                  </td>
                  <td class="content-table-content-text option-line">생활용품</td>
                  <td class="content-table-content-text option-line">1</td>
                  <td class="content-table-content-text option-line">샤워용품</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line state0">판매신청</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">스피아노</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">스프링 플로어 장스탠드_4colors</a>
                    </td>
                  <td class="content-table-content-text option-line">조명</td>
                  <td class="content-table-content-text option-line">4</td>
                  <td class="content-table-content-text option-line">스탠드</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line state0">판매신청</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">퀵슬립</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">Q4 유로탑 롤팩 매트리스 2size</a>
                    </td>
                  <td class="content-table-content-text option-line">가구</td>
                  <td class="content-table-content-text option-line">2</td>
                  <td class="content-table-content-text option-line">매트리스</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line state0">판매신청</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">이노하우스</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">1+1 수압상승 3중 필터샤워기(+필터6개) 샤워기헤드</a>
                  </td>
                  <td class="content-table-content-text option-line">생활용품</td>
                  <td class="content-table-content-text option-line">1</td>
                  <td class="content-table-content-text option-line">샤워용품</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line state0">판매신청</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">스피아노</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">스프링 플로어 장스탠드_4colors</a>
                    </td>
                  <td class="content-table-content-text option-line">조명</td>
                  <td class="content-table-content-text option-line">4</td>
                  <td class="content-table-content-text option-line">스탠드</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line state0">판매신청</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">퀵슬립</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">Q4 유로탑 롤팩 매트리스 2size</a>
                    </td>
                  <td class="content-table-content-text option-line">가구</td>
                  <td class="content-table-content-text option-line">2</td>
                  <td class="content-table-content-text option-line">매트리스</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line">보류중</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">이노하우스</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">1+1 수압상승 3중 필터샤워기(+필터6개) 샤워기헤드</a>
                  </td>
                  <td class="content-table-content-text option-line">생활용품</td>
                  <td class="content-table-content-text option-line">1</td>
                  <td class="content-table-content-text option-line">샤워용품</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line state0">판매신청</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">스피아노</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">스프링 플로어 장스탠드_4colors</a>
                    </td>
                  <td class="content-table-content-text option-line">조명</td>
                  <td class="content-table-content-text option-line">4</td>
                  <td class="content-table-content-text option-line">스탠드</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line state0">판매신청</td>
                </tr>

                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                  </td>
                  <td class="content-table-content-text option-line">이노하우스</td>
                  <td class="content-table-content-text option-line">
                    <a href="#">1+1 수압상승 3중 필터샤워기(+필터6개) 샤워기헤드</a>
                  </td>
                  <td class="content-table-content-text option-line">생활용품</td>
                  <td class="content-table-content-text option-line">1</td>
                  <td class="content-table-content-text option-line">샤워용품</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line">보류중</td>
                </tr>




              </tbody>
            </table>
          </div>

          <div class="pagi mt-3">
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>


          <div class="my-5"></div>

        <!--쿠폰등록modal-->

        <div class="modal fade" id="coupon_register" tabindex="-1" aria-labelledby="couponmodallabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="couponmodallabel" style="font-size: 13px;">쿠폰 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <form method="post" action="#">
                <div class="modal-body" style="background-color: #f5f5f5;">
                  <div class="container container-option container-option-topPadding">
                    <div class="row optionGroup1">
                      <div class="col-4 option-name">쿠폰명/사용 혜택</div>
                      <div class="col-8 search-layer">
                        <div class="radio-productCode paddingLeft1 align-custom">
                          <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <select class="form-select selectState" id="large-select" aria-label="Default select example" style="width: 250px;">
                              <option selected="" value="0">쿠폰 선택</option>
                              <option value="1">오픈 기념 이벤트 축하쿠폰/2000원 할인 (10,000원 이상 구매 시)</option>
                              <option value="2">가구 10% 할인쿠폰/30000원 이상 구매시 10% 할인</option>
                              <option value="3">신규가입 감사쿠폰/1000원 할인 (5000원 이상 구매시)</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      
      
                    </div>
                  
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-secondary">저장</button>
                </div>
              </form>
            </div>
          </div>
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
    <script src="resources/js/adminjs/admin-customerInquiry_ih.js"></script>
    <script src="resources/js/adminjs/checkbox.js"></script>
    
  </body>
</html>
