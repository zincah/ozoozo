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
    <title>Admin - Report Management</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="resources/css/admincss/insertProduct_02.css?var=1" rel="stylesheet" />
    <link href="resources/css/admincss/reviewManagement_02.css?after" rel="stylesheet" />
    <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>

		<jsp:include page="header/header.jsp"></jsp:include>

            <main style="background-color: #f5f5f5">
                <div class="container-fluid px-4">
                    <h1 class="mt-4 insert_title">리뷰 신고 관리</h1>
                    <ol class="breadcrumb mb-4 bottomline">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active">Report Management</li>
                    </ol>
                    <div class="container container-option bottomline">
                        <div class="row optionGroup1">
                            <div class="col-1 option-name">신고 접수일</div>
                            <div class="col-5 option-line">
                                <div class="btn-group paddingLeft1" role="group"
                                    aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check dateBtn-1" name="btnradio" id="btnradio1"
                                        autocomplete="off" checked />
                                    <label class="btn btn-outline-secondary dateBtn" for="btnradio1">오늘</label>

                                    <input type="radio" class="btn-check dateBtn-2" name="btnradio" id="btnradio2"
                                        autocomplete="off" />
                                    <label class="btn btn-outline-secondary dateBtn" for="btnradio2">1주일</label>

                                    <input type="radio" class="btn-check dateBtn-3" name="btnradio" id="btnradio3"
                                        autocomplete="off" />
                                    <label class="btn btn-outline-secondary dateBtn" for="btnradio3">1개월</label>

                                    <input type="radio" class="btn-check dateBtn-4" name="btnradio" id="btnradio4"
                                        autocomplete="off" />
                                    <label class="btn btn-outline-secondary dateBtn" for="btnradio4">3개월</label>

                                    <input type="radio" class="btn-check dateBtn-5" name="btnradio" id="btnradio5"
                                        autocomplete="off" />
                                    <label class="btn btn-outline-secondary dateBtn" for="btnradio5">6개월</label>

                                    <input type="radio" class="btn-check dateBtn-6" name="btnradio" id="btnradio6"
                                        autocomplete="off" />
                                    <label class="btn btn-outline-secondary dateBtn" for="btnradio5">전체</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="paddingLeft1">
                                    <input class="startDate" type="date" id="date" value="" />
                                    <input class="endDate" type="date" id="date" value="" />
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="container container-option container-option-topPadding bottomline">
                        <div class="row optionGroup1">
                            <div class="col-1 option-name">리뷰타입
                            </div>
                            <div class="col-5 option-line">
                                <div class="btn-group paddingLeft1" role="group"
                                    aria-label="Basic radio toggle button group">
                                    <select class="form-select selectState" aria-label="Default select example">
                                        <!--<option selected>리뷰타입</option>-->
                                        <option value="1">전체</option>
                                        <option value="2">사진리뷰</option>
                                        <option value="3">일반리뷰</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-1 option-name">신고사유</div>
                            <div class="col">
                                <div class="btn-group paddingLeft1" role="group"
                                    aria-label="Basic radio toggle button group">
                                    <select class="form-select selectState" id="large-select"
                                        aria-label="Default select example">
                                        <!--<option selected>1차옵션</option>-->
                                        <option value="1">전체</option>
                                        <option value="2">영리적 목적</option>
                                        <option value="3">반복적 리뷰게시</option>
                                        <option value="4">허위/과장 관련없음</option>

                                        <option value="5">욕설/음란물</option>
                                        <option value="6">타인 권리 침해</option>
                                        <option value="7">악성코드/데이터</option>
                                        <option value="8">사기성 판촉</option>
                                        <option value="9">기타</option>



                                    </select>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container container-option container-option-topPadding bottomline">
                        <div class="row optionGroup1">
                            <div class="col-1 option-name">구매자 별점
                            </div>
                            <div class="col-5 option-line">
                                <div class="btn-group paddingLeft1" role="group"
                                    aria-label="Basic radio toggle button group">
                                    <select class="form-select selectState" aria-label="Default select example">
                                        <!--<option selected>미답변</option>-->
                                        <option value="1">전체</option>
                                        <option value="2">1점</option>
                                        <option value="3">2점</option>
                                        <option value="4">3점</option>
                                        <option value="5">4점</option>
                                        <option value="6">5점</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-1 option-name">처리유무</div>
                            <div class="col">
                                <div class="btn-group paddingLeft1" role="group"
                                    aria-label="Basic radio toggle button group">
                                    <select class="form-select selectState" aria-label="Default select example">
                                        <!--<option selected>1차옵션</option>-->
                                        <option value="1">전체</option>
                                        <option value="2">완료됨</option>


                                    </select>

                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="container container-option container-option-topPadding bottomline">
                        <div class="row optionGroup1">
                            <div class="col-1 option-name">상세검색
                            </div>
                            <div class="col-11">
                                <div class="btn-group paddingLeft1" role="group"
                                    aria-label="Basic radio toggle button group">
                                    <select class="form-select selectState" aria-label="Default select example">
                                        <!--<option selected>리뷰타입</option>-->
                                        <option value="1">내용</option>
                                        <option value="2">판매자</option>
                                        <option value="3">작성자</option>
                                    </select>

                                    <div>
                                        <input type="text" class="form-control searchform">
                                    </div>




                                </div>

                            </div>

                        </div>

                    </div>
                    <div class="container container-option container-option-topPadding">
                        <div class="row optionGroup1">
                            <div class="col search-submitBtn">
                                <div class=" d-grid gap-2">
                                    <button class="btn btn-secondary submitBtn" type="button">검색</button>
                                </div>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-outline-secondary initBtn" type="button">초기화</button>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>



            </main>
            <div class="content-table">
                <table class="table table-hover table-box-style">
                    <thead>
                        <tr class="content-table-title">
                            <td class="content-table-title-text option-line">판매자</td>
                            <td class="content-table-title-text option-line">신고사유</td>
                            <td class="content-table-title-text option-line">상품명</td>
                            <td class="content-table-title-text option-line">별점</td>
                            <td class="content-table-title-text option-line">사진</td>
                            <td class="content-table-title-text option-line">내용</td>
                            <td class="content-table-title-text option-line">작성자</td>
                            <td class="content-table-title-text option-line">도움이돼요</td>
                            <td class="content-table-title-text">접수일</td>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- for -->
                        <tr class="content-table-content content-hover">
                            <td class="content-table-content-text option-line">오트밀하우스</td>
                            <td class="content-table-content-text option-line">사기성 판촉</td>
                            <td class="content-table-content-text option-line">엘리 라운드 스탠드 전신거울 2size</td>
                            <td class="content-table-content-text option-line">5점</td>
                            <td class="content-table-content-text option-line"><img
                                    src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-snapshots-164727335042395397.jpeg/640/none"
                                    class="img-thumbnail">
                            </td>
                            <td class="content-table-content-text option-line">제가 딱 찼던 디자인이에요! 너무 좋아요 ^^</td>
                            <td class="content-table-content-text option-line">이영</td>
                            <td class="content-table-content-text option-line">7</td>
                            <td class="content-table-content-text option-line">2022-04-14 20:34</td>
                        </tr>
                        <tr class="content-table-content content-hover">
                            <td class="content-table-content-text option-line">오트밀하우스</td>
                            <td class="content-table-content-text option-line">악성코드/데이터</td>
                            <td class="content-table-content-text option-line">엘리 라운드 스탠드 전신거울 2size</td>
                            <td class="content-table-content-text option-line">4점</td>
                            <td class="content-table-content-text option-line">-</td>
                            <td class="content-table-content-text option-line">가성비 좋은편이네요.</td>
                            <td class="content-table-content-text option-line">이일영</td>
                            <td class="content-table-content-text option-line">0</td>
                            <td class="content-table-content-text option-line">2022-04-12 16:44</td>
                        </tr>
                        <tr class="content-table-content content-hover">
                            <td class="content-table-content-text option-line">오트밀하우스</td>
                            <td class="content-table-content-text option-line">허위/과장 관련없음</td>
                            <td class="content-table-content-text option-line">엘리 라운드 스탠드 전신거울 2size</td>
                            <td class="content-table-content-text option-line">1점</td>
                            <td class="content-table-content-text option-line"><img
                                    src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-snapshots-164216984090434361.jpeg/640/none"
                                    class="img-thumbnail">
                            </td>
                            <td class="content-table-content-text option-line">저는 왜 모서리가 이러죠..</td>
                            <td class="content-table-content-text option-line">이인삼</td>
                            <td class="content-table-content-text option-line">21</td>
                            <td class="content-table-content-text option-line">2022-04-12 16:37</td>
                        </tr>


                    </tbody>


                </table>
                <nav aria-label="Page navigation example" style="font-size: 11px; margin-top: 1.5em;">
                    <ul class="pagination justify-content-end">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous" style="color:black">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#" style="color:black">1</a></li>
                        <li class="page-item"><a class="page-link" href="#" style="color:black">2</a></li>
                        <li class="page-item"><a class="page-link" href="#" style="color:black">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true" style="color:black">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row answer-area">
                <div class="col">
                    <div class="content-table" style="padding-right: 0">
                        <div class="content-view-title"><span class="content-view-title-text">리뷰 상세보기</span></div>
                        <table class="table table-box-style content-view-table">
                            <tbody>
                                <tr class="content-table-content">
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">작성일</td>
                                    <td class="content-table-content-text option-line">2022-04-13 18:40</td>
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">별점</td>
                                    <td class="content-table-content-text option-line">1점</td>
                                </tr>
                                <tr class="content-table-content">
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">작성자</td>
                                    <td class="content-table-content-text option-line">이인삼</td>
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">도움이돼요
                                    </td>
                                    <td class="content-table-content-text option-line">21
                                    </td>
                                </tr>
                                <tr class="content-table-content">
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">판매자</td>
                                    <td class="content-table-content-text option-line">오트밀하우스</td>
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">상품명</td>
                                    <td class="content-table-content-text option-line">엘리 라운드 스탠드 전신거울 2size</td>
                                </tr>
                                <tr class="content-table-content">
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">신고사유</td>
                                    <td colspan="3" class="content-table-content-text option-line">허위/과장 관련없음</td>
                                </tr>
                                <tr class="content-table-content">
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">내용</td>
                                    <td colspan="3" class="content-table-content-text option-line">
                                        저는 왜 모서리가 이러죠..
                                </tr>

                                <tr class="content-table-content">
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">사진 <br>상세보기</td>
                                    <td colspan="3" class="content-table-content-text option-line">
                                        <a href="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-snapshots-164216984090434361.jpeg/640/none"
                                            target="_blank"><img
                                                src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-snapshots-164216984090434361.jpeg/640/none"
                                                class="img-thumbnail" size="200px 200px"></a>

                                    </td>
                                </tr>





                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col reply-write">
                    <div class="content-table" style="padding-left: 0">
                        <div class="content-view-title"><span class="content-view-title-text">처리하기</span></div>
                        <table class="table table-box-style content-view-table">
                            <tbody>
                                <tr class="content-table-content">
                                    <td class="content-table-content-text option-line content-table-title"
                                        style="background-color: #f5f5f5">처리내용</td>

                                    <td class="content-table-content-text">
                                        <div class="list-group">
                                            <label class="list-group-item">
                                                <input class="form-check-input me-1" type="checkbox" value="1">

                                                게시글 블라인드 처리 및 포인트 회수
                                            </label>
                                            <label class="list-group-item">
                                                <input class="form-check-input me-1" type="checkbox" value="2">
                                                신고사유에 해당되지 않는 게시물
                                            </label>
                                            <label class="list-group-item">
                                                <input class="form-check-input me-1" type="checkbox" value="3">
                                                수사기관에 도움 요청
                                            </label>

                                        </div>





                    </div>


                    </td>

                    </tr>


                    </tbody>

                    </table>


                    <button type="button" class="btn btn btn-secondary send btn-primary" id="toastbtn"
                        style=" margin-top: 0.5em; text-align:center; width: 100%;">확인</button>

                    <div class="toast">
                        <div class="toast-header">
                            <div class="me-auto" style="font-size: 12px;">Admin</div>
                            <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
                        </div>
                        <div class="toast-body" style="font-size: 11px;">
                            <p>처리가 완료되었습니다. </p>

                        </div>

                    </div>


                </div>

            </div>

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
    
     <script>
     document.getElementById("toastbtn").onclick = function () {
         var toastElList = [].slice.call(document.querySelectorAll('.toast'))
         var toastList = toastElList.map(function (toastEl) {
             return new bootstrap.Toast(toastEl)
         })
         toastList.forEach(toast => toast.show())
     }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/admin-customerInquiry_ih.js"></script>
    <script src="resources/js/adminjs/admin-productManagement_ih.js"></script>
    <script src="resources/js/adminjs/reviewManagement_02.js"></script>


</body>

</html>