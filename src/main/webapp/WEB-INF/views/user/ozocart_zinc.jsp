<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="resources/css/user_css/zinc/ozocart.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>

        $(function(){

            $(".modal_close", this).click(function(){
                $(".modal_layer").hide();
            });

            $(".carted_product_edit_btn").click(function(){
                $(".modal_layer").show();
            });

        });

        

    </script>

</head>
<body>
	
    <div class="header">
        <jsp:include page="./header/OzoH.jsp"></jsp:include>
    </div>

    <div class="cart_wrap">
        <div class="container">
            <div class="row">

                <div class="cart_main_bar col-12 col-md-7 col-lg-8">
                    <div class="cart_main_content">
                        <div class="cart_main_content_header">
                            <span class="cart_main_content_header_left">
                                <div class="check_box_wrap">
                                    <input type="checkbox" class="check_input" value checked>
                                    <span class="check_input_deco">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg>
                                    </span>
                                </div>
                                <div class="header_left_title">
                                    모두선택
                                </div>
                            </span>
                            <span class="cart_main_content_header_right">
                                <button class="cart_product_delete">선택삭제</button>
                            </span>
                        </div>
                        <ul class="cart_main_content_list">
                            <!-- 다른 브랜드 for 문 : 장바구니 -->
                            <li class="cart_main_content_group">
                                <article class="content_group">
                                    <div class="cart_group_header">
                                        시디즈 배송
                                    </div>
                                    <ul class="cart_group_delivery_list">
                                        <!--같은 브랜드 for문-->
                                        <li class="cart_group_delivery_list_item">
                                            <article class="cart_group_delivery_list_item_wrap">
                                                <div class="carted_product">
                                                    <a href="#" class="carted_product_link">
                                                        <div class="product_image">
                                                            <img src="sources/product1.webp">
                                                        </div>
                                                        <div class="product_info">
                                                            <div class="product_info_title">
                                                                [시디즈] 
                                                                [2천원 쿠폰]에가 EGA 인테리어의자(팔걸이형)(T603FW) 4colors 
                                                            </div>
                                                            <p class="product_info_delivery">무료배송&nbsp;|&nbsp;화물택배</p>
                                                        </div>
                                                    </a>
                                                    <button class="delete_product" type="button">
                                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                    </button>
                                                    <ul class="carted_product_option_list">
                                                        <!--for문 : 한 상품판매페이지에서 여러 옵션-->
                                                        <li class="carted_product_option_list_item">
                                                            <article class="option_item">
                                                                <div class="option_item_name">라이트 그레이</div>
                                                                <button class="option_item_delete">
                                                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                                </button>
                                                                <div class="option_item_control">
                                                                    <div class="option_item_count">
                                                                        <select class="form_control">
                                                                            <option selected value="0">1</option>
                                                                            <option value="1">2</option>
                                                                            <option value="2">3</option>
                                                                            <option value="3">4</option>
                                                                            <option value="4">5</option>
                                                                            <option value="5">6</option>
                                                                            <option value="6">7</option>
                                                                            <option value="7">8</option>
                                                                            <option value="8">9</option>
                                                                            <option value="9">+10</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="option_item_price">
                                                                        <span class="option_item_price_here">189,000</span>
                                                                        원
                                                                    </div>
                                                                </div>
                                                            </article>
                                                        </li>
                                                        <li class="carted_product_option_list_item">
                                                            <article class="option_item">
                                                                <div class="option_item_name">그린</div>
                                                                <button class="option_item_delete">
                                                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                                </button>
                                                                <div class="option_item_control">
                                                                    <div class="option_item_count">
                                                                        <select class="form_control">
                                                                            <option selected value="0">1</option>
                                                                            <option value="1">2</option>
                                                                            <option value="2">3</option>
                                                                            <option value="3">4</option>
                                                                            <option value="4">5</option>
                                                                            <option value="5">6</option>
                                                                            <option value="6">7</option>
                                                                            <option value="7">8</option>
                                                                            <option value="8">9</option>
                                                                            <option value="9">+10</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="option_item_price">
                                                                        <span class="option_item_price_here">189,000</span>
                                                                        원
                                                                    </div>
                                                                </div>
                                                            </article>
                                                        </li>
                                                    </ul>
                                                    <div class="carted_product_footer">
                                                        <div class="carted_product_footer_left">
                                                            <button class="carted_product_edit_btn" type="button">옵션변경</button>
                                                            <button class="carted_product_order_only_btn" type="button">바로구매</button>
                                                        </div>
                                                        <div class="carted_product_footer_right">
                                                            <span class="carted_product_subtotal">179,000</span>
                                                            원
                                                        </div>

                                                    </div>
                                                </div>
                                                <footer class="delivery_group_footer">
                                                    <div class="delivery_group_footer_text">
                                                        배송비 무료
                                                    </div>
                                                </footer>
                                            </article>
                                        </li>
                                        <li class="cart_group_delivery_list_item">
                                            <article class="cart_group_delivery_list_item_wrap">
                                                <div class="carted_product">
                                                    <a href="#" class="carted_product_link">
                                                        <div class="product_image">
                                                            <img src="sources/product2.webp">
                                                        </div>
                                                        <div class="product_info">
                                                            <div class="product_info_title">
                                                                [시디즈] 
                                                                [2천원 쿠폰]T20 TAB+ TNA200HF 메쉬의자 2types
                                                            </div>
                                                            <p class="product_info_delivery">무료배송&nbsp;|&nbsp;화물택배</p>
                                                        </div>
                                                    </a>
                                                    <button class="delete_product" type="button">
                                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                    </button>
                                                    <ul class="carted_product_option_list">
                                                        <!--for문 : 한 상품판매페이지에서 여러 옵션-->
                                                        <li class="carted_product_option_list_item">
                                                            <article class="option_item">
                                                                <div class="option_item_name">선택: 블랙쉘(TNA200HF) / 색상: 미드나잇 블랙</div>
                                                                <button class="option_item_delete">
                                                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                                </button>
                                                                <div class="option_item_control">
                                                                    <div class="option_item_count">
                                                                        <select class="form_control">
                                                                            <option selected value="0">1</option>
                                                                            <option value="1">2</option>
                                                                            <option value="2">3</option>
                                                                            <option value="3">4</option>
                                                                            <option value="4">5</option>
                                                                            <option value="5">6</option>
                                                                            <option value="6">7</option>
                                                                            <option value="7">8</option>
                                                                            <option value="8">9</option>
                                                                            <option value="9">+10</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="option_item_price">
                                                                        <span class="option_item_price_here">179,000</span>
                                                                        원
                                                                    </div>
                                                                </div>
                                                            </article>
                                                        </li>
                                                    </ul>
                                                    <div class="carted_product_footer">
                                                        <div class="carted_product_footer_left">
                                                            <button class="carted_product_edit_btn" type="button">옵션변경</button>
                                                            <button class="carted_product_order_only_btn" type="button">바로구매</button>
                                                        </div>
                                                        <div class="carted_product_footer_right">
                                                            <span class="carted_product_subtotal">179,000</span>
                                                            원
                                                        </div>

                                                    </div>
                                                </div>
                                                <footer class="delivery_group_footer">
                                                    <div class="delivery_group_footer_text">
                                                        배송비 무료
                                                    </div>
                                                </footer>
                                            </article>
                                        </li>
                                        
                                        
                                    </ul>
                                </article>
                            </li>
                            <!--다른브랜드-->
                            <li class="cart_main_content_group">
                                <article class="content_group">
                                    <div class="cart_group_header">
                                        구르미애 배송
                                    </div>
                                    <ul class="cart_group_delivery_list">
                                        <!--같은 브랜드 for문-->
                                        <li class="cart_group_delivery_list_item">
                                            <article class="cart_group_delivery_list_item_wrap">
                                                <div class="carted_product">
                                                    <a href="#" class="carted_product_link">
                                                        <div class="product_image">
                                                            <img src="sources/product3.webp">
                                                        </div>
                                                        <div class="product_info">
                                                            <div class="product_info_title">
                                                                [베이직톤] 
                                                                [10%쿠폰]클래식 고밀도 순면80수 광폭 호텔식 차렵이불(세트) 8colors 
                                                            </div>
                                                            <p class="product_info_delivery">무료배송&nbsp;|&nbsp;일반택배</p>
                                                        </div>
                                                    </a>
                                                    <button class="delete_product" type="button">
                                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                    </button>
                                                    <ul class="carted_product_option_list">
                                                        <!--for문 : 한 상품판매페이지에서 여러 옵션-->
                                                        <li class="carted_product_option_list_item">
                                                            <article class="option_item">
                                                                <div class="option_item_name">컬러: 클래식 순면 80수 차렵이불(버터크림) / 사이즈: Q풀세트(이불+패드+베개커버2)</div>
                                                                <button class="option_item_delete">
                                                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                                </button>
                                                                <div class="option_item_control">
                                                                    <div class="option_item_count">
                                                                        <select class="form_control">
                                                                            <option selected value="0">1</option>
                                                                            <option value="1">2</option>
                                                                            <option value="2">3</option>
                                                                            <option value="3">4</option>
                                                                            <option value="4">5</option>
                                                                            <option value="5">6</option>
                                                                            <option value="6">7</option>
                                                                            <option value="7">8</option>
                                                                            <option value="8">9</option>
                                                                            <option value="9">+10</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="option_item_price">
                                                                        <span class="option_item_price_here">167,600</span>
                                                                        원
                                                                    </div>
                                                                </div>
                                                            </article>
                                                        </li>
                                                        
                                                    </ul>
                                                    <div class="carted_product_footer">
                                                        <div class="carted_product_footer_left">
                                                            <button class="carted_product_edit_btn" type="button">옵션변경</button>
                                                            <button class="carted_product_order_only_btn" type="button">바로구매</button>
                                                        </div>
                                                        <div class="carted_product_footer_right">
                                                            <span class="carted_product_subtotal">167,600</span>
                                                            원
                                                        </div>

                                                    </div>
                                                </div>
                                                <footer class="delivery_group_footer">
                                                    <div class="delivery_group_footer_text">
                                                        배송비 무료
                                                    </div>
                                                </footer>
                                            </article>
                                        </li>
                                    </ul>
                                </article>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- side bar -->
                <div class="cart_side_bar col-12 col-md-5 col-lg-4">
                    <div class="sticky_container_wrap" style="position: sticky; top: 81px; transition: top 0.1s ease 0s;">
                        <div id="sidebar_hei" class="sticky_container" style="position: relative;">
                            <div class="cart_summary">
                                <div class="cart_summary_row">
                                    <dt>총상품금액</dt>
                                    <dd>
                                        <span class="number">892,800</span>
                                        원
                                    </dd>
                                </div>
                                <div class="cart_summary_row">
                                    <dt>총배송비</dt>
                                    <dd>
                                        +
                                        <span class="number">0</span>
                                        원
                                    </dd>
                                </div>
                                <div class="cart_summary_row">
                                    <dt>총할인금액</dt>
                                    <dd>
                                        -
                                        <span class="number">535,300</span>
                                        원
                                    </dd>
                                </div>
                                <div class="cart_summary_row cart_summary_row_total">
                                    <dt>결제금액</dt>
                                    <dd>
                                        <span class="number">357.500</span>
                                        원
                                    </dd>
                                </div>
                            </div>
                            
                            <div class="cart_order">
                                <button class="cart_order_btn btn_layer">
                                    2개 상품 구매 하기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 하단 skicky -->
    <div class="sm_footer" style="position: sticky; bottom: 0px; transition: bottom 0.1s ease 0s;">
        <div class="cart_footer" style="position: relative;">
            <div class="cart_footer_total">3개 735,500원</div>
            <button class="cart_footer_btn btn_layer">바로 구매</button>
        </div>

    </div>

    
	<footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>

    
    <!--modal-->
    <div class="modal_layer">
        <div class="option_modal modal_background">
            <div class="modal_content_wrap">
                <div class="carted_option_change_content modal_content">
                    <span class="modal_handle"></span>
                    <button class="modal_close">
                        <svg class="icon-md" width="20" height="20" viewBox="0 0 20 20" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M11.6 10l7.1 7.1-1.6 1.6-7.1-7.1-7.1 7.1-1.6-1.6L8.4 10 1.3 2.9l1.6-1.6L10 8.4l7.1-7.1 1.6 1.6z"></path></svg>
                    </button>
                    <form class="carted_product_edit_form">
                        <div class="product_modal_item">
                            <div class="product_modal_img">
                                <img src="sources/product1.webp">
                            </div>
                            <div class="product_modal_content">
                                <div class="product_info">
                                    <div class="product_modal_title">
                                        [시디즈] 
                                        [2천원 쿠폰]에가 EGA 인테리어의자(팔걸이형)(T603FW) 4colors 
                                    </div>
                                    <p class="product_info_delivery">무료배송&nbsp;|&nbsp;화물택배</p>
                                </div>
                                
                            </div>
                        </div>
                        <section class="modal_option_layer">
                            <div class="select_input_layer">
                                <select class="form_control empty">
                                    <option value disabled selected>색상</option>
                                    <option value="0">라이트그레이(189,000원)</option>
                                    <option value="1">블루(189,000원)</option>
                                    <option value="2">그린(189,000원)</option>
                                    <option value="3">다크그레이(189,000원)</option>
                                    <option value="4">블랙(189,000원)</option>
                                </select>
                            </div>

                            <!--js리스트-->
                            <ul class="carted_product_option_list">
                                <!--for문 : 한 상품판매페이지에서 여러 옵션-->
                                <!--js 써야하니까 클래스 추가하거나 바꿔야 할 수도-->
                                <li class="carted_product_option_list_item">
                                    <article class="option_item">
                                        <div class="option_item_name">라이트 그레이</div>
                                        <button class="option_item_delete" type="button">
                                            <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                        </button>
                                        <div class="option_item_control">
                                            <div class="option_item_count">
                                                <select class="form_control">
                                                    <option selected value="0">1</option>
                                                    <option value="1">2</option>
                                                    <option value="2">3</option>
                                                    <option value="3">4</option>
                                                    <option value="4">5</option>
                                                    <option value="5">6</option>
                                                    <option value="6">7</option>
                                                    <option value="7">8</option>
                                                    <option value="8">9</option>
                                                    <option value="9">+10</option>
                                                </select>
                                            </div>
                                            <div class="option_item_price">
                                                <span class="option_item_price_here">189,000</span>
                                                원
                                            </div>
                                        </div>
                                    </article>
                                </li>
                                <li class="carted_product_option_list_item">
                                    <article class="option_item">
                                        <div class="option_item_name">그린</div>
                                        <button class="option_item_delete" type="button">
                                            <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                        </button>
                                        <div class="option_item_control">
                                            <div class="option_item_count">
                                                <select class="form_control">
                                                    <option selected value="0">1</option>
                                                    <option value="1">2</option>
                                                    <option value="2">3</option>
                                                    <option value="3">4</option>
                                                    <option value="4">5</option>
                                                    <option value="5">6</option>
                                                    <option value="6">7</option>
                                                    <option value="7">8</option>
                                                    <option value="8">9</option>
                                                    <option value="9">+10</option>
                                                </select>
                                            </div>
                                            <div class="option_item_price">
                                                <span class="option_item_price_here">189,000</span>
                                                원
                                            </div>
                                        </div>
                                    </article>
                                </li>
                            </ul>
                        </section>


                        <p class="modal_total_price_layer">
                            <span class="modal_price_layer_text">주문금액</span>
                            <span class="modal_price_layer_price">378,000원</span>
                        </p>

                        <div class="modal_footer">
                            <button class="item_option_edit_delete btn_layer">취소</button>
                            <button class="item_option_edit_save btn_layer">확인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    
</body>
</html>