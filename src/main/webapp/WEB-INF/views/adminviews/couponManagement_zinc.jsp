<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>관리자 - 쿠폰관리</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css?after" rel="stylesheet" />
        <link href="resources/css/admincss/makeCoupon.css?var=444eeee" rel="stylesheet" />
    <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>
      $(document).ready(function(){

        console.log(${couponList.size()})

        /* 새 공지사항 jquery */
        $("#new_info").click(function(){
          $(".newcoupon").show()
          $(".couponbody").hide()

          $(".table-input").val("");


        });

        $("#couponInsert").click(function () {
          var coupon_title = $("#newcoupon_title").val()
          var coupon_subtitle = $("#newcoupon_content").val()
          var coupon_more = $("#newcoupon_more").val()
          var coupon_discount = $("#newcoupon_discount").val()
          var coupon_create = $("#newinfo_date").val()
          var coupon_startdate = $("#newnow_date1").val()
          var coupon_enddate = $("#newnow_date2").val()


          var couponInfo = {
            "coupon_title": coupon_title,
            "coupon_subtitle": coupon_subtitle,
            "coupon_more": coupon_more,
            "coupon_discount": coupon_discount,
            "coupon_create": coupon_create,
            "coupon_startdate": coupon_startdate,
            "coupon_enddate": coupon_enddate
          }

          $.ajax({
            url: 'couponInsert.admin',
            method: 'post',
            data: JSON.stringify(couponInfo),
            contentType: 'application/json; charset=UTF-8',
            dataType: 'html',
            success: function (resp) {
              $(".newcoupon").hide()
              $(".couponListLayer").html(resp)
              $(".couponbody").show()

              console.log($(".couponid:nth-last-child(1)").val());


            }
          });

          $(".couponListLayer .insert_btn").on("click", function(e){
            e.preventDefault();
            $(".couponListLayer li").last().addClass("cLine");
          });

          $(".couponListLayer").last().html();

          console.log(couponInfo);


          $("#couponUpdate").click(function (){






            })




        })



          $(".clickbtn").click(function () {

            var coupon = $(this).val()
            makeView(coupon);


          });
        });

      function makeView(coupon){
        $.ajax({
          url: 'couponView.admin',
          method: 'post',
          data: JSON.stringify(coupon),
          contentType: 'application/json; charset=UTF-8',
          dataType: 'html',
          success: function (resp) {
            $(".newcoupon").hide()
            $(".couponbody").html(resp)
            $(".couponbody").show()
          }
        })


      }

      // 동적요소 새롭게 이벤트 넣을 때
      $(document).on('click', '.clickbtn', function(){

        var coupon = $(this).val()
        makeView(coupon)


      });

      // 쿠폰 상태 변경(상세내용)
      function couponUpdate(coupon) {

        var coupon_id = coupon
        var coupon_title = $("#coupon_title").val()
        var coupon_subtitle = $("#coupon_content").val()
        var coupon_more = $("#coupon_more").val()
        var coupon_discount = $("#coupon_discount").val()


        var couponUpdate = {
          "coupon_id" : coupon_id,
          "coupon_title" : coupon_title,
          "coupon_subtitle" : coupon_subtitle,
          "coupon_more" : coupon_more,
          "coupon_discount" : coupon_discount
        }

        $.ajax({
          url : 'couponUpdate.admin',
          method : 'post',
          data : JSON.stringify(couponUpdate),
          contentType : 'application/json; charset=UTF-8',
          dataType : 'html',
          success :function (resp){
            console.log(resp);
            $(".couponbody").hide()
            $(".couponListLayer").html(resp)
            $(".newcoupon").show()
          }

        });
      }

      $(document).on('click', '.modi_btn', function (){

        var coupon = $(this).val()
        couponUpdate(coupon);

      });

      // 쿠폰 상태 변경(모달)
      function couponStatus(){

        var couponNumList = []

        $("input:checkbox[name=couponcheckbox]:checked").each(function () {
          var checkit = $(this).prev().val();
          couponNumList.push(checkit);
        });

        couponNumList.push($("#findPage").val());
        couponNumList.push($("#couponStatusOption").val());

        $.ajax({
          url:'updateCouponStatus.admin',
          method : 'post',
          data : JSON.stringify(couponNumList),
          contentType : 'application/json; charset=UTF-8',
          dataType : 'html',
          success : function (resp){

            $(".modal").modal('hide');
            $(".modal-status-select-option option:eq(0)").prop("selected", true);
            $("#select-num").text("0");

            printTable(resp);
            setPage($("#findPage").val());
            clickReset();
          }
        });

      }

      // 선택된 쿠폰 개수에 따른 숫자값 변경
      function checkfunction() {

        if ($(".check:checked").length == $(".check").length && $(".check").length != 0){

          $("#allCheck").prop("checkd", true);
          $(".select-num").text($(".check:checked").length);

        } else {
          $("#allCheck").prop("checkd", false);
          $(".select-num").text($(".check:checked").length);

        }
      }




    </script>
  </head>
  		<jsp:include page="header/header.jsp"></jsp:include>
        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <div class="header_layer">
              <h1 class="mt-4 insert_title">쿠폰 관리</h1>
              
            </div>
            <ol class="breadcrumb mb-3 bottomline">
              <li class="breadcrumb-item active">Manage coupons</li>
            </ol>
            <div class="container container-option bottomline">

              <div class="row optionGroup1">
                <div class="col-1 category-header-content" >
                  <span>전체</span><span class="status-value" style="color:#ff778e"><fmt:formatNumber value="${fn:length(couponList)}" pattern="#,###"/></span>
                </div>
                <div class="col-1 category-header-content">
                  <span>대기</span><span class="status-value" style="color:#ff778e"><fmt:formatNumber value="${couponStatus0}" pattern="#,###"/> </span>
                </div>
                <div class="col-1 category-header-content">
                  <span>진행중</span><span class="status-value" style="color:#ff778e"><fmt:formatNumber value="${couponStatus1}" pattern="#,###" /> </span>
                </div>
                <div class="col-1 category-header-content">
                  <span>종료</span><span class="status-value" style="color:#ff778e"><fmt:formatNumber value="${couponStatus2}" pattern="#,###"/></span>
                </div>
              </div>
            </div>
            <div class="container container-option bottomline container-option-topPadding">
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
                    <input class="startDate" type="date" id="stdate" value="" />
                    <input class="endDate" type="date" id="eddate" value="" />
                  </div>
                </div>
                <div class="col-3">
                  
                </div>
              </div>
            </div>


            <div class="container container-option container-option-topPadding">
              <div class="row optionGroup1">
                <div class="col-2 option-name">검색</div>
                <div class="col-10 search-layer">
                    
                    <input class="form-control size-input" type="text" placeholder="쿠폰 검색">
                    
                    <div class="radio_layer paddingLeft1">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1"> 전체 </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked="">
                        <label class="form-check-label" for="flexRadioDefault2"> 대기  </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked="">
                        <label class="form-check-label" for="flexRadioDefault3"> 진행중  </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4" checked="">
                        <label class="form-check-label" for="flexRadioDefault3"> 종료  </label>
                      </div>

                    </div>
                </div>
                

            </div>
            </div>
          </div>
        </main>
        <!-- content -->

  <style>
    .settingBtn {
      background-color: transparent;
      border: 0px;
    }
  </style>

  <div class="dropdown setting-button text-end">
    <button class="settingBtn" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
        <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"></path>
      </svg>
    </button>
    <ul class="dropdown-menu settingBtnDropdown" aria-labelledby="dropdownMenuButton1" style="">
      <li><h6 class="dropdown-header">쿠폰 관리</h6></li>
      <li>
        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#modal-status-select" id="couponStatusChange">쿠폰상태변경</a>

      </li>
    </ul>
  </div>


          <div class="table_layer">
            <table class="table table-hover table-box-style table-bordered">
              <thead>
                <tr class="content-table-title">
                  <td class="content-table-title-text" style="width: 1rem;">
                    <input class="form-check-input form-check-input-margin" type="checkbox" id="flexCheckDefault0" onclick="selectAll(this)"/>
                  </td>
                  <td class="content-table-title-text" style="width: 20rem;">쿠폰명/사용 혜택</td>
                  <td class="content-table-title-text" style="width: 8rem;">쿠폰 형식</td>
                  <!--<td class="content-table-title-text" style="width: 5rem;">사용/발행</td>-->
                  <td class="content-table-title-text" style="width: 15rem;">사용기간</td>
                  <td class="content-table-title-text" style="width: 7rem;">등록일</td>
                  <td class="content-table-title-text" style="width: 7rem;">쿠폰코드</td>
                  <td class="content-table-title-text" style="width: 5rem;">상태</td>
                </tr>
              </thead>
              <tbody class="couponListLayer">
                <!-- for -->

                <c:forEach items="${couponList}" var="coupon">
                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault"  name="couponcheckbox" onchange="couponStatus()"/>
                  </td>
                  <td class="content-table-content-text">


                      <div class="coupon_title"><button class="btn clickbtn" value="${coupon.coupon_id}">${coupon.coupon_title}</button>

                      </div>
                      <div class="coupon_sub_title">${coupon.coupon_subtitle}</div>

                  </td>
                  <td class="content-table-content-text">${coupon.coupon_type}</td>
                  <!--<td class="content-table-content-text">0회</td>-->
                  <td class="content-table-content-text"><fmt:formatDate value="${coupon.coupon_startdate}" pattern="yyyy-MM-dd " /><span>~</span><fmt:formatDate value="${coupon.coupon_enddate}" pattern="yyyy-MM-dd "/> </td>
                  <td class="content-table-content-text"><fmt:formatDate value="${coupon.coupon_create}" pattern="yyyy-MM-dd "/> </td>
                  <td class="content-table-content-text couponid">${coupon.coupon_id}</td>
                  <td class="content-table-content-text state0">${coupon.coupon_status}</td>
                </tr>
                </c:forEach>



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


        <div class="content-table">
          <div class="content-view-title content-header">
            <span class="content-view-title-text">쿠폰 내용 보기</span>
            <button class="btn btn-outline-secondary" id="new_info">새 쿠폰 등록</button>
          </div>
          <form method="post" action="#">
            <table class="table table-box-style content-view-table table-bordered">

              <!-- 원래 formdata -->

              <tbody class="couponbody" style="display: none;">

                <tr class="content-table-content">
                  <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">등록일</td>
                  <td colspan="2" class="content-table-content-text" id="info_date"></td>
                  <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">담당자</td>
                  <td colspan="2" class="content-table-content-text" id="info_charge"></td>
                </tr>

                <tr class="content-table-content">
                  <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">시작일</td>
                  <td colspan="2" class="content-table-content-text">
                      <input class="startDate" type="date" id="now_date1" value="">

                  </td>
                  <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">종료일</td>
                  <td colspan="2" class="content-table-content-text">
                    <input class="startDate" type="date" id="now_date2" value="">

                  </td>

                    

                  <!--coupon date-->
                  <script>
                    document.getElementById('now_date1').valueAsDate = new Date();
                    document.getElementById('now_date2').valueAsDate = new Date();
                  </script>
                      
                  </td>
                </tr>

                <tr>
                  <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">쿠폰 사용조건</td>
                  <td colspan="2" class="content-table-content-text">
                    <input type="text" class="form-control table-input" id="coupon_more" style="display: inline-block;">
                  </td>

                  <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">할인 금액(할인율)</td>
                  <td colspan="2" class="content-table-content-text">
                    <input type="text" class="form-control table-input" id="coupon_discount" style="display: inline-block;">
                  </td>
                </tr>

                <tr class="content-table-content">
                  <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5">쿠폰 제목</td>
                  <td colspan="5" class="content-table-content-text">
                    <div id="coupon_title_select">쿠폰이름</div>
                    <input type="text" class="form-control table-input" id="coupon_title">
                  </td>
                </tr>
                <tr class="content-table-content">
                  <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5">쿠폰 내용</td>
                  <td colspan="5" class="content-table-content-text">
                    <textarea class="form-control table-input" id="coupon_content" disabled></textarea>
                  </td>
                </tr>
                
                <tr class="content-table-content text-end">
                  <td colspan="6">
                    <button type="button" class="btn btn-secondary modi_btn" id="couponUpdate">수정</button>
                    <button type="button" class="btn btn-secondary stop_btn">중지</button>
                    <button type="button" class="btn btn-danger del_btn">삭제</button>
                    <button class="btn btn-success insert_btn">등록</button>
                    <button type="reset" class="btn btn-secondary reset_btn">취소</button>
                  </td>
                </tr>
              </tbody>



              <!-- newcoupon formdata -->

              <tbody class="newcoupon">
              <jsp:useBean id="newinfo_date" class="java.util.Date"/>

              <tr class="content-table-content">
                <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">등록일</td>
                <td colspan="2" class="content-table-content-text" id="newinfo_date"><fmt:formatDate value="${newinfo_date}" pattern="yyyy-MM-dd" />
                </td>
                <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">담당자</td>
                <td colspan="2" class="content-table-content-text" id="newinfo_charge">이인하</td>
              </tr>

              <tr class="content-table-content">
                <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">시작일</td>
                <td colspan="2" class="content-table-content-text">
                  <input class="startDate" type="date" id="newnow_date1" value="">

                </td>
                <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">종료일</td>
                <td colspan="2" class="content-table-content-text">
                  <input class="startDate" type="date" id="newnow_date2" value="">

                </td>



                <!--coupon date-->
                <script>
                  document.getElementById('now_date1').valueAsDate = new Date();
                  document.getElementById('now_date2').valueAsDate = new Date();
                </script>

                </td>
              </tr>

              <tr>
                <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">쿠폰 사용조건</td>
                <td colspan="2" class="content-table-content-text">
                  <input type="text" class="form-control table-input" id="newcoupon_more" style="display: inline-block;">
                </td>

                <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">할인 금액(할인율)</td>
                <td colspan="2" class="content-table-content-text">
                  <input type="text" class="form-control table-input" id="newcoupon_discount" style="display: inline-block;">
                </td>
              </tr>

              <tr class="content-table-content">
                <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5">쿠폰 제목</td>
                <td colspan="5" class="content-table-content-text">
                  <div id="newcoupon_title_select"></div>
                  <input type="text" class="form-control table-input" id="newcoupon_title">
                </td>
              </tr>
              <tr class="content-table-content">
                <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5">쿠폰 내용</td>
                <td colspan="5" class="content-table-content-text">
                  <textarea class="form-control table-input" id="newcoupon_content" ></textarea>
                </td>
              </tr>

              <tr class="content-table-content text-end">
                <td colspan="6">

                  <button type="button" class="btn btn-success insert_btn" id="couponInsert">등록</button>
                  <button type="reset" class="btn btn-secondary reset_btn">취소</button>
                </td>
              </tr>
              </tbody>
            </table>
          </form>
        </div>












        <div class="my-5"></div>
          <!-- 쿠폰 상태변경 modal -->
          <div class="modal fade" id="modal-status-select" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-modal="true" role="dialog" style="/*display: block; */">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <p class="modal-title" id="">쿠폰 상태변경</p>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body modal-status-select-coupon">
                  <div class="modal-status-select-coupon-num">
                    <span>선택된 쿠폰 수 : </span>
                    <span class="modal-status-select-coupon-num-value couponNum select-num">0</span>
                    <span>개</span>
                  </div>
                  <div class="modal-status-select">
                    <div class="btn-group modal-status-select-btn-group" role="group" aria-label="Basic radio toggle button group">
                      <select class="form-select modal-status-select-option" aria-label="Default select example" id="couponStatusOption">
                        <option value="대기">대기</option>
                        <option value="사용중">사용중</option>
                        <option value="종료">종료</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="button" class="btn modal-status-select-submit-button" onclick="updatePostStatus()">변경</button>
                </div>
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
