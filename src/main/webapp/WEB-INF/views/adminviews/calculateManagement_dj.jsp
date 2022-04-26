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
  <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
  <link href="resources/css/admincss/styles.css" rel="stylesheet" />
  <link href="resources/css/admincss/insertProduct_dh.css?var=123" rel="stylesheet" />
  <link href="resources/css/admincss/calculateManagement_dj.css?after" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
  <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

	<jsp:include page="header/header.jsp"></jsp:include>
      <main style="background-color: #f5f5f5">
        <div class="container-fluid px-4">
          <h1 class="mt-4 insert_title">관리자 정산내역</h1>
          <ol class="breadcrumb mb-3 bottomline">
            <li class="breadcrumb-item active">Manager settlement details</li>
          </ol>
          <div class="container container-option bottomline">
          <div class="col-12 category-header-content">
                  <a href="#">정산예정 내역</a><span>0</span>
                </div>
                <div class="col-12 category-header-content">
                  <a href="#">정산완료 내역</a><span>0</span>
                </div>
                <div class="col-12 category-header-content">
                  <a href="#">나의 수수료</a><span>0</span>
                </div>
              </div>
              <div class="row optionGroup1">
                
          </div>
          <div class="container container-option bottomline container-option-topPadding">

            <div class="row optionGroup1">
            


              <div class="col-1 option-name">기간</div>
              <div class="col-5 option-line">
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
              <div class="col-6">
                <div class="paddingLeft1">
                  <input class="startDate" type="date" id="date" value="" />
                  <input class="endDate" type="date" id="date" value="" />
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
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
              <td class="content-table-title-text option-line">업체명</td>
              <td class="content-table-title-text option-line">총주문(상품수)</td>
              <td class="content-table-title-text option-line">실결제금액</td>
              <td class="content-table-title-text option-line">상품금액</td>
              <td class="content-table-title-text option-line">할인금액</td>
              <td class="content-table-title-text option-line">입점수수료</td>
              <td class="content-table-title-text option-line">배송비</td>
              <td class="content-table-title-text option-line">정산금액</td>
              <td class="content-table-title-text">비고</td>
            </tr>
          </thead>
          <tbody>
            <!-- for -->
            <tr class="content-table-content content-hover">
              <td class="content-table-content-text option-line">
                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
              </td>
              <td class="content-table-content-text option-line">자개자개</td>
              <td class="content-table-content-text option-line">3건(7개)</td>
              <td class="content-table-content-text option-line">130,000</td>
              <td class="content-table-content-text option-line">150,000</td>
              <td class="content-table-content-text option-line">0</td>
              <td class="content-table-content-text option-line">4,000</td>
              <td class="content-table-content-text option-line">6,000</td>
              <td class="content-table-content-text option-line">120,000</td>
              <td class="content-table-content-text option-line"></td>
            </tr>

            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">인트리</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">180,000</td>
                <td class="content-table-content-text option-line">250,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">8,000</td>
                <td class="content-table-content-text option-line">5,000</td>
                <td class="content-table-content-text option-line">53,000</td>
                <td class="content-table-content-text option-line"></td>
              
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">인트리</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">180,000</td>
                <td class="content-table-content-text option-line">250,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">8,000</td>
                <td class="content-table-content-text option-line">5,000</td>
                <td class="content-table-content-text option-line">53,000</td>
                <td class="content-table-content-text option-line"></td>

            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">인트리</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">180,000</td>
                <td class="content-table-content-text option-line">250,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">8,000</td>
                <td class="content-table-content-text option-line">5,000</td>
                <td class="content-table-content-text option-line">53,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">인트리</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">180,000</td>
                <td class="content-table-content-text option-line">250,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">8,000</td>
                <td class="content-table-content-text option-line">5,000</td>
                <td class="content-table-content-text option-line">53,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  </td>
                <td class="content-table-content-text option-line">자개자개</td>
                <td class="content-table-content-text option-line">3건(7개)</td>
                <td class="content-table-content-text option-line">130,000</td>
                <td class="content-table-content-text option-line">150,000</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">4,000</td>
                <td class="content-table-content-text option-line">6,000</td>
                <td class="content-table-content-text option-line">120,000</td>
                <td class="content-table-content-text option-line"></td>
            </tr>
            


          </tbody>
          <tfoot>

          </tfoot>
        </table>
        <!-- pagi -->
        <div class="pagi mt-3">
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">«</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">»</span>
                  </a>
                </li>
              </ul>
            </nav>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="resources/js/adminjs/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
  <script src="resources/js/adminjs/admin-customerInquiry_ih.js"></script>
</body>

</html>