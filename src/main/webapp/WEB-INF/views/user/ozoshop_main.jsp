<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="resources/css/user_css/zinc/ozoshop_main.css" rel="stylesheet"/>
    <link href="resources/css/user_css/zinc/ozoper_photo_cate.css" rel="stylesheet"/>
   <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>

        $(document).ready(function(){

            $(".filter_btn").on('click', function(){
                console.log(this.value);
                $(".category_filter_output_wrap").show(); 
                
                $(".category_filter_control_tag_item button div").text(this.value);
            });

            /* 카테고리 토글 */
            $(".category_tree_child_layer").hide();
            $(".category_entry_expand", this).click(function(){
                var open = $(this).parents("div").siblings("div");
                console.log(open[0]);
                $(open[0]).slideToggle();
            });

            $(".reset_btn").click(function(){
                $(".category_filter_output_wrap").hide();
            });

            /* modal */
            $(".brand_info_modal_close", this).click(function(){
                $(".modal_layer").hide();
            });

            $(".info_action").click(function(){
                $(".modal_layer").show();
            });


        });



       
        
    
    </script>

</head>
<body>
    <header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="category_container container">
        <div class="category_wrap">
            <div class="category row">
                <div class="category_side_bar col-12 col-md-3">
                    <article class="brand_profile">
                        <div class="brand_profile_image">
                            <img src="sources/brand.webp">
                        </div>
                        <div class="brand_profile_content">
                            <p class="brand_profile_content_title">리바트</p>
                            <p class="brand_profile_overview">
                                <span class="brand-profile__stars" aria-label="별점 4.8점"><svg fill="#ff778e" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg><svg fill="#ff778e" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg><svg fill="#ff778e" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg><svg fill="#ff778e" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg><svg fill="#ff778e" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-0.752" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-0.752"><rect x="0" y="0" width="18.054293709343312" height="24"></rect></clipPath></defs><use xlink:href="#star-path-0.752" fill="#DBDBDB"></use><use clip-path="url(#star-clip-0.752)" xlink:href="#star-path-0.752"></use></svg></span><span class="brand-profile__count">4.8 (27,517)</span>
                            </p>
                            <p class="brand_profile_action_list">
                                <a href="#" class="brand_profile_action move_review">
                                    모든리뷰보기
                                </a>
                                <button class="brand_profile_action info_action">
                                    브랜드정보보기
                                </button>
                            </p>
                        </div>
                    </article>
                    <section class="category_list">
                        <div class="category_list_title">
                            <a href="#">가구</a>
                         </div>
                        <ul class="category_tree">
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">침대</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div class="category_tree_child_layer" style="overflow: hidden;">
                                    <ul class="category_tree_children">
                                        <li class="category_tree_children_entry">
                                            <a href="#">침대프레임</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">침대+매트리스</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">침대부속기구</a>
                                        </li>
                                    </ul>
                                </div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">매트리스.토퍼</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                
                                <div class="category_tree_child_layer" style="overflow: hidden;">
                                    <ul class="category_tree_children">
                                        <li class="category_tree_children_entry">
                                            <a href="#">매트리스</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">토퍼</a>
                                        </li>
                                    </ul>
                                </div> 
                                 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">소파</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div class="category_tree_child_layer" style="overflow: hidden;">
                                    <ul class="category_tree_children">
                                        <li class="category_tree_children_entry">
                                            <a href="#">일반소파</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">리클라이너</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">소파베드</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">좌식소파</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">소파스톨</a>
                                        </li>
                                    </ul>
                                </div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">테이블.책상</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div class="category_tree_child_layer" style="overflow: hidden;">
                                    <ul class="category_tree_children">
                                        <li class="category_tree_children_entry">
                                            <a href="#">거실.소파테이블</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">사이드테이블</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">식탁</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">책상</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">좌식테이블</a>
                                        </li>
                                    </ul>
                                </div>  
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">거실장.tv장</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div class="category_tree_child_layer" style="overflow: hidden;">
                                    <ul class="category_tree_children">
                                        <li class="category_tree_children_entry">
                                            <a href="#">일반거실장</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">높은거실장.사이드보드</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">tv스탠드</a>
                                        </li>
                                </div>   
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">서랍.수납장</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div class="category_tree_child_layer" style="overflow: hidden;">
                                    <ul class="category_tree_children">
                                        <li class="category_tree_children_entry">
                                            <a href="#">서랍장</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">수납장</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">캐비닛</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">주납수납장</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">협탁</a>
                                        </li>
                                </div>
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">진열장.책장</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div class="category_tree_child_layer" style="overflow: hidden;">
                                    <ul class="category_tree_children">
                                        <li class="category_tree_children_entry">
                                            <a href="#">진열장.장식장</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">책장</a>
                                        </li>
                                        <li class="category_tree_children_entry">
                                            <a href="#">매거진랙</a>
                                        </li>
                                </div>
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">선반</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">행거.옷장</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">의자</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">화장대.콘솔</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">거울</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">가벽.파티션</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">야외가구</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">유아동가구</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                            <li class="category_entry">
                                <div class="category_entry_header">
                                    <a href="#" class="category_entry_move">공간별가구</a>
                                    <button class="category_entry_expand">
                                        <svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
                                    </button>
                                </div>
                                <!--버튼 누르면 밑에 토글다운 생기게-->
                                <div style="overflow: hidden;"></div> 
                            </li>
                        </ul>
                        <ul class="category_list_others">
                            <li class="category_list_others_item">
                                <a href="#">패브릭</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">조명</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">가전</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">주방용품</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">데코.식물</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">수납.정리</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">생활용품</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">생필품</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">공구.DIY</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">인테리어시공</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">반려동물</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">캠핑용품</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">실내운동</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">유아.아동</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">렌탈</a>
                            </li>
                            <li class="category_list_others_item">
                                <a href="#">식품</a>
                            </li>
                        </ul>
                    </section>
                </div>

                <div class="category_content col-12 col-md-9">
                    <div class="category_header">
                        <div class="category_header_title">
                            <p>모든 상품</p>
                        </div>
                    </div>

                    <div class="brand_header_wrap">
                        <div class="brand_header">
                            <nav>
                                <ol class="brand_header_tree">
                                    <li class="brand_header_node">
                                        <a href="#" class="link">리바트</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>

                        <nav class="brand_header_menu_wrap">
                            <ul class="brand_header_menu_list">
                                <!--for문-->
                                <li class="brand_header_menu_list_item_wrap">
                                    <div class="brand_header_menu_list_item">
                                        <a href="#">
                                            <div class="brand_header_menu_list_item_name">
                                                가구
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="brand_header_menu_list_item_wrap">
                                    <div class="brand_header_menu_list_item">
                                        <a href="#">
                                            <div class="brand_header_menu_list_item_name">
                                                패브릭
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="brand_header_menu_list_item_wrap">
                                    <div class="brand_header_menu_list_item">
                                        <a href="#">
                                            <div class="brand_header_menu_list_item_name">
                                                조명
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="brand_header_menu_list_item_wrap">
                                    <div class="brand_header_menu_list_item">
                                        <a href="#">
                                            <div class="brand_header_menu_list_item_name">
                                                데코.식물
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="brand_header_menu_list_item_wrap">
                                    <div class="brand_header_menu_list_item">
                                        <a href="#">
                                            <div class="brand_header_menu_list_item_name">
                                                수납.정리
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="brand_header_menu_list_item_wrap">
                                    <div class="brand_header_menu_list_item">
                                        <a href="#">
                                            <div class="brand_header_menu_list_item_name">
                                                생활용품
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="brand_header_menu_list_item_wrap">
                                    <div class="brand_header_menu_list_item">
                                        <a href="#">
                                            <div class="brand_header_menu_list_item_name">
                                                공구.DIY
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="brand_header_menu_list_item_wrap">
                                    <div class="brand_header_menu_list_item">
                                        <a href="#">
                                            <div class="brand_header_menu_list_item_name">
                                                유아.아동
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </nav>

                    </div>



                    <section class="brand_product_section">
                        
                        <div class="filter">

                            <!--filter-->
                            <div class="filter_bar_control_layer">
                                <ul class="filter_bar_control_list">
                                    <li class="filter_bar_control_list_item">
                                        <div class="drop_down">
                                            <button class="filter_bar_control_btn">
                                                가격
                                                <svg class="icon" width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z"></path></svg>
                                            </button>
                                        </div>
                                    </li>

                                    <li class="filter_bar_control_list_item">
                                        <div class="drop_down">
                                            <button class="filter_bar_control_btn">
                                                배송
                                                <svg class="icon" width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z"></path></svg>
                                            </button>
                                        </div>
                                    </li>

                                    <li class="filter_bar_control_list_item">
                                        <div class="drop_down">
                                            <button class="filter_bar_control_btn">
                                                판매여부
                                                <svg class="icon" width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z"></path></svg>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="item_count_layer">
                                <div class="item_count">전체 1,163</div>
                                <button class="item_filter_btn" id="item_filter_btn">인기순
                                    <svg class="caret" width="8" height="8" viewBox="0 0 8 8" preserveAspectRatio="xMidYMid meet"><path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path></svg>
                                </button>

                                <!-- dropdown -->
                                <div class="dropdown_wrap" id="dropdown">
                                    <ul class="dropdown_list">
                                        <li>
                                            <button class="dropdown_btn">판매순</button>
                                        </li>
                                        <li>
                                            <button class="dropdown_btn">인기순</button>
                                        </li>
                                        <li>
                                            <button class="dropdown_btn">많은 리뷰순</button>
                                        </li>
                                        <li>
                                            <button class="dropdown_btn">유저사진 많은순</button>
                                        </li>
                                        <li>
                                            <button class="dropdown_btn">높은 가격순</button>
                                        </li>
                                        <li>
                                            <button class="dropdown_btn">낮은 가격순</button>
                                        </li>
                                        <li>
                                            <button class="dropdown_btn">최신순</button>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!-- dropdown js -->
                            <script>
                                var filter_btn = document.getElementById("item_filter_btn");
                                var dropdown = document.getElementById("dropdown");
                
                                filter_btn.addEventListener('mouseenter', function(){
                                    dropdown.style.display = 'block';
                                });
                
                                dropdown.addEventListener('mouseleave', function(){
                                    dropdown.style.display = 'none';
                                });
                
                            </script>

                        </div>

                    
                    </section>

                    <div class="photos row">
                        <div class="deals_list_wrap col-6 col-lg-4">
                            <article class="deals_item">
                                <a href="#" style="text-decoration: none;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="sources/best1.jpg">
                                                </div>
                                            </div>
                                            <button class="item_bookmark">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon"><defs><path id="scrap-icon-3-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-3-a)" href="#scrap-icon-3-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use><use fill="#000" filter="url(#scrap-icon-3-c)" href="#scrap-icon-3-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                                            </button>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">브랜드</span>
                                                <span class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구 블라블라 안녕 안녕</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">50%</span>
                                                <span class="price">10,000</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">4.6</div>
                                                <div class="review_count">리뷰 3,641</div>
                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </div>
                        <div class="deals_list_wrap col-6 col-lg-4">
                            <article class="deals_item">
                                <a href="#" style="text-decoration: none;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="sources/best2.webp">
                                                </div>
                                            </div>
                                            <button class="item_bookmark">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon"><defs><path id="scrap-icon-3-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-3-a)" href="#scrap-icon-3-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use><use fill="#000" filter="url(#scrap-icon-3-c)" href="#scrap-icon-3-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                                            </button>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">브랜드</span>
                                                <span class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구 블라블라 안녕 안녕</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">50%</span>
                                                <span class="price">10,000</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">4.6</div>
                                                <div class="review_count">리뷰 3,641</div>
                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </div>
                        <div class="deals_list_wrap col-6 col-lg-4">
                            <article class="deals_item">
                                <a href="#" style="text-decoration: none;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="sources/best3.webp">
                                                </div>
                                            </div>
                                            <button class="item_bookmark">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon"><defs><path id="scrap-icon-3-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-3-a)" href="#scrap-icon-3-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use><use fill="#000" filter="url(#scrap-icon-3-c)" href="#scrap-icon-3-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                                            </button>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">브랜드</span>
                                                <span class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구 블라블라 안녕 안녕</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">50%</span>
                                                <span class="price">10,000</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">4.6</div>
                                                <div class="review_count">리뷰 3,641</div>
                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </div>
                        <div class="deals_list_wrap col-6 col-lg-4">
                            <article class="deals_item">
                                <a href="#" style="text-decoration: none;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="sources/best4.webp">
                                                </div>
                                            </div>
                                            <button class="item_bookmark">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon"><defs><path id="scrap-icon-3-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-3-a)" href="#scrap-icon-3-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use><use fill="#000" filter="url(#scrap-icon-3-c)" href="#scrap-icon-3-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                                            </button>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">브랜드</span>
                                                <span class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구 블라블라 안녕 안녕</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">50%</span>
                                                <span class="price">10,000</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">4.6</div>
                                                <div class="review_count">리뷰 3,641</div>
                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </div>
                        <div class="deals_list_wrap col-6 col-lg-4">
                            <article class="deals_item">
                                <a href="#" style="text-decoration: none;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="sources/best5.webp">
                                                </div>
                                            </div>
                                            <button class="item_bookmark">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon"><defs><path id="scrap-icon-3-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-3-a)" href="#scrap-icon-3-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use><use fill="#000" filter="url(#scrap-icon-3-c)" href="#scrap-icon-3-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                                            </button>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">브랜드</span>
                                                <span class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구 블라블라 안녕 안녕</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">50%</span>
                                                <span class="price">10,000</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">4.6</div>
                                                <div class="review_count">리뷰 3,641</div>
                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </div>
                        <div class="deals_list_wrap col-6 col-lg-4">
                            <article class="deals_item">
                                <a href="#" style="text-decoration: none;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="sources/best6.webp">
                                                </div>
                                            </div>
                                            <button class="item_bookmark">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon"><defs><path id="scrap-icon-3-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-3-a)" href="#scrap-icon-3-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use><use fill="#000" filter="url(#scrap-icon-3-c)" href="#scrap-icon-3-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                                            </button>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">브랜드</span>
                                                <span class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구 블라블라 안녕 안녕</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">50%</span>
                                                <span class="price">10,000</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">4.6</div>
                                                <div class="review_count">리뷰 3,641</div>
                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </div>
                        <div class="deals_list_wrap col-6 col-lg-4">
                            <article class="deals_item">
                                <a href="#" style="text-decoration: none;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="sources/best7.webp">
                                                </div>
                                            </div>
                                            <button class="item_bookmark">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon"><defs><path id="scrap-icon-3-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-3-a)" href="#scrap-icon-3-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use><use fill="#000" filter="url(#scrap-icon-3-c)" href="#scrap-icon-3-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                                            </button>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">브랜드</span>
                                                <span class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구 블라블라 안녕 안녕</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">50%</span>
                                                <span class="price">10,000</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">4.6</div>
                                                <div class="review_count">리뷰 3,641</div>
                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </div>
                        <div class="deals_list_wrap col-6 col-lg-4">
                            <article class="deals_item">
                                <a href="#" style="text-decoration: none;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="sources/best8.webp">
                                                </div>
                                            </div>
                                            <button class="item_bookmark">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon"><defs><path id="scrap-icon-3-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-3-a)" href="#scrap-icon-3-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use><use fill="#000" filter="url(#scrap-icon-3-c)" href="#scrap-icon-3-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                                            </button>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">브랜드</span>
                                                <span class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구 블라블라 안녕 안녕</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">50%</span>
                                                <span class="price">10,000</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">4.6</div>
                                                <div class="review_count">리뷰 3,641</div>
                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <!--modal-->
        <div class="modal_layer">
            <div class="option_modal modal_background">
                <div class="modal_content_wrap">
                    <button class="brand_info_modal_close btn_position">
                        <svg class="icon-md" width="20" height="20" viewBox="0 0 20 20" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M11.6 10l7.1 7.1-1.6 1.6-7.1-7.1-7.1 7.1-1.6-1.6L8.4 10 1.3 2.9l1.6-1.6L10 8.4l7.1-7.1 1.6 1.6z"></path></svg>
                    </button>
                    <div class="carted_option_change_content modal_content">
                        <article class="brand_modal_info">
                            <h1>리바트</h1>
                        </article>
                        <ul class="brand_info_content_list">
                            <!--for문-->
                            <li class="brand_info_content_list_item">
                                <img src="sources/brandinfo1.webp">
                            </li>
                            <li class="brand_info_content_list_item">
                                <img src="sources/brandinfo2.webp">
                            </li>
                            <li class="brand_info_content_list_item">
                                <img src="sources/brandinfo3.webp">
                            </li>
                        </ul>

                       
                    </div>
                </div>
            </div>
        </div>
    <footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>

</body>
</html>


