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
    <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
    <link href="resources/css/admincss/information.css?after" rel="stylesheet" />
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
              <h1 class="mt-4 insert_title">고객센터 공지관리</h1>
              
            </div>
            <ol class="breadcrumb mb-3 bottomline">
              <li class="breadcrumb-item active">Customer Service Announcement</li>
            </ol>
            <div class="container container-option">
              <div class="row optionGroup1">
                <div class="col-2 option-name">등록일</div>
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

            <div class="container container-option">
              <div class="row optionGroup1">
                <div class="col-2 option-name">분류</div>
                <div class="col-10">
                    <div class="radio-productCode paddingLeft1 align-custom">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <select class="form-select selectState" id="large-select" aria-label="Default select example" style="width: 200px;">
                          <option selected value="0">전체</option>
                          <option value="1">주문/결제</option>
                          <option value="2">배송관련</option>
                          <option value="3">취소/환불</option>
                          <option value="4">반품/교환</option>
                          <option value="5">증빙서류발급</option>
                          <option value="6">로그인/회원정보</option>
                          <option value="7">서비스/기타</option>
                        </select>
                      </div>
                      <div class="radio_layer paddingLeft1">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                          <label class="form-check-label" for="flexRadioDefault1"> 전체 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked="">
                          <label class="form-check-label" for="flexRadioDefault2"> 게시 상태</label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked="">
                          <label class="form-check-label" for="flexRadioDefault3"> 중지 상태</label>
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
                <td class="content-table-title-text option-line">등록일</td>
                <td class="content-table-title-text option-line">상태</td>
                <td class="content-table-title-text option-line">공지유형</td>
                <td class="content-table-title-text option-line">제목</td>
                <td class="content-table-title-text option-line">담당자</td>
                <td class="content-table-title-text"></td>
              </tr>
            </thead>
            <tbody>
              <!-- for -->
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">2022-04-13 18:40</td>
                <td class="content-table-content-text option-line state0">중지</td>
                <td class="content-table-content-text option-line">배송관련</td>
                <td class="content-table-content-text option-line"><a href="#">배송비는 얼마인가요?</a></td>
                <td class="content-table-content-text option-line">정대현</td>
                <td class="content-table-content-text option-line">
                  <button class="btn btn-outline-secondary" style="width: 60px;">재게시</button>
                </td>
              </tr>
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">2022-04-12 13:11</td>
                <td class="content-table-content-text option-line state1">게시</td>
                <td class="content-table-content-text option-line">취소/환불</td>
                <td class="content-table-content-text option-line"><a href="#">주문 취소는 어떻게 하나요?</a></td>
                <td class="content-table-content-text option-line">이인하</td>
                <td class="content-table-content-text option-line">
                  <button class="btn btn-secondary" style="width: 60px;">중지</button>
                </td>
              </tr>
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">2022-04-11 17:35</td>
                <td class="content-table-content-text option-line state1">게시</td>
                <td class="content-table-content-text option-line">증빙서류발급</td>
                <td class="content-table-content-text option-line"><a href="#">세금계산서 발급은 어떻게 하나요?</a></td>
                <td class="content-table-content-text option-line">황동준</td>
                <td class="content-table-content-text option-line">
                  <button class="btn btn-secondary" style="width: 60px;">중지</button>
                </td>
              </tr>
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">2022-04-10 13:35</td>
                <td class="content-table-content-text option-line state1">게시</td>
                <td class="content-table-content-text option-line">주문/결제</td>
                <td class="content-table-content-text option-line"><a href="#">결제방법은 어떤 게 있나요?</a></td>
                <td class="content-table-content-text option-line">정대현</td>
                <td class="content-table-content-text option-line">
                  <button class="btn btn-secondary" style="width: 60px;">중지</button>
                </td>
              </tr>
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">2022-04-10 10:05</td>
                <td class="content-table-content-text option-line state0">중지</td>
                <td class="content-table-content-text option-line">주문/결제</td>
                <td class="content-table-content-text option-line"><a href="#">신용카드 무이자 할부 되나요?</a></td>
                <td class="content-table-content-text option-line">이아연</td>
                <td class="content-table-content-text option-line">
                  <button class="btn btn-outline-secondary" style="width: 60px;">재게시</button>
                </td>
              </tr>
            </tbody>
          </table>

          <div class="pagi mt-2">
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
        <div class="">
          <div class="">
            <div class="content-table">
              <div class="content-view-title content-header">
                <span class="content-view-title-text">공지 내용 보기</span>
                <button class="btn btn-outline-secondary" id="new_info">새 공지사항 등록</button>
              </div>
              <form method="post" action="#">
                <table class="table table-box-style content-view-table">
                  <tbody>
                    <tr class="content-table-content">
                      <td class="content-table-content-text option-line content-table-title" style="background-color: #f5f5f5">등록일</td>
                      <td class="content-table-content-text option-line" id="info_date">2022-04-11 17:35</td>
                      <td class="content-table-content-text option-line content-table-title" style="background-color: #f5f5f5">담당자</td>
                      <td class="content-table-content-text option-line" id="info_charge">황동준</td>
                    </tr>
                    <tr class="content-table-content">
                      <td class="content-table-content-text option-line content-table-title" style="background-color: #f5f5f5">제목</td>
                      <td colspan="3" class="content-table-content-text option-line">
                        <p id="info_title">세금계산서 발급은 어떻게 하나요?</p>
                        <input class="form-control info_text" id="info_newTitle">
                      </td>
                    </tr>
                    <tr class="content-table-content">
                      <td class="content-table-content-text option-line content-table-title" style="background-color: #f5f5f5">내용</td>
                      <td colspan="3" class="content-table-content-text option-line">
                        <div class="form-floating">
                          <textarea id="info_content" class="form-control answer-textarea" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 10rem" disabled>세금계산서 발급은 어려우며, 결제 시 지출증빙 또는 현금영수증 발행은 가능합니다.
                          </textarea>
                        </div>
                      </td>
                    </tr>
                    <tr class="content-table-content text-end">
                      <td colspan="4">
                        <button type="button" class="btn btn-secondary modi_btn">수정</button>
                        <button type="button" class="btn btn-secondary stop_btn">중지</button>
                        <button type="button" class="btn btn-danger del_btn">삭제</button>
                        <button class="btn btn-success insert_btn">등록</button>
                        <button type="reset" class="btn btn-secondary reset_btn">취소</button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </form>

              
            </div>
          </div>

          <div class="my-5"></div>
          

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
  </body>
</html>
