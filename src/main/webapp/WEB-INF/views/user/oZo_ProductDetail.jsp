<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="resources/js/userjs/productDetail.js?var=1"></script>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/Detail/public.css'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/Detail/overview.css?var=21'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/Detail/inform.css?var=12'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/Detail/review.css?var=12'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/Detail/addInform.css?var=1'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/Detail/smallOption.css?var=1'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/Detail/detailScript.css?var=2'>
   <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript" src="resources/js/userjs/detailbookmark.js?var=1"></script>

    <script>
    var select = false
    </script>

    <script>
      
    	$(document).ready(function(){

    		
    		$(".production-review-item__help__btn").click(function(){

    			let reviewid = $(this).val();
    			console.log(reviewid);
    			
    			$.ajax({
    		  		url:'likedReview.com',
    		  		method:'post',
    		  		data: JSON.stringify(reviewid),
    		  		contentType : 'application/json; charset=UTF-8',
    		  		dataType : 'json',
    		  		success : function(resp){
    		  			
    		  			if(resp.fail == 'fail'){
    		  				alert("???????????? ???????????? :)");
    						return;
    		  			}
    		  			
    		  			$("#s_"+resp.review_id).text(''+resp.liked+'');
    		  			$(".production-review-item__help__btn__check").show();
    		  			$(".production-review-item__help__btn").hide();
    		  			
    		  		},
    		  		error : function(request, status, error) {
    					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    				}
    		  		});

    		})
    		
    	})

    </script>
    
</head>
<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
<div class="layout">
    <!-- Header -->
	
    <!-- Main -->
    <div class="productDetail">
        <div class="product-selling-overview container">
            <nav class="commerce-category-breadcrumb-wrap production-selling-overview__category">
                <ol class="commerce-category-breadcrumb">
                    <li class="commerce-category-breadcrumb__entry">
                        <a class="link" href="">${product[0].cate_name }</a>
                        <svg class="icon" width="8" height="8" viewBox="0 0 8 8" fill="currentColor" preserveAspectRatio="xMidYMid meet">
                            <path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path>
                        </svg>
                    </li>
                    <li class="commerce-category-breadcrumb__entry">
                        <a class="link" href="">${product[0].subcate_name }</a>
                    </li>
                   <!--  <li class="commerce-category-breadcrumb__entry">
                        <a class="link" href="">????????????</a>
                        <svg class="icon" width="8" height="8" viewBox="0 0 8 8" fill="currentColor" preserveAspectRatio="xMidYMid meet">
                            <path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path>
                        </svg>
                    </li>
                    <li class="commerce-category-breadcrumb__entry">
                        <a class="link" href="">?????????????????????</a>
                    </li> -->
                </ol>
<!--             </nav> -->
            <div class="product-selling-container row">
                <div class="product-selling-cover-image-wrap if-1-cover-image if-2-cover-image if-3-cover-image">
                    <div class="product-selling-cover-image-container">
                        <div class="carousel product-selling-cover-image product-selling-overview-image" role="region" aria-roledescription="carousel">
                            <div class="carousel_list-wrap product-selling-cover-image_carousel-wrap">
                                <div class="carousel_list" aria-live="polite" style="transform: translateX(0%); transition: transform 0s ease 0s;">
                                <c:forEach var="i"  begin="0" end="${fn:length(img_true)-1 }">
                                    	<div class="carousel__list__entry production-selling-cover-image__entry" role="group" aria-roledescription="slide" aria-label="${i } of ${fn:length(img_true)-1 }" style="width: 100%;">
                                        	<img class="production-selling-cover-image__entry__image" tabindex="0" src="${img_true[i].photo_url }">
                                   		 </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <ul class="production-selling-cover-image__list">
                           		 <c:forEach var="i" begin="0" end="${fn:length(img_true)-1 }">
                                <li class="production-selling-cover-image__list__item">
                                    <button class="production-selling-cover-image__list__btn" type="button" aria-label="${i+1}">
                                        <img class="image" src="${img_true[i].photo_url }">
                                    </button>
                                </li>
                                </c:forEach>
                            </ul>
                            <div class="production-selling-cover-image__paginator">
                                <ul class="carousel-paginator">
                                    <li>
                                        <span class="carousel-paginator__page" data-key="1"></span>
                                    </li>
                                    <li>
                                        <span class="carousel-paginator__page" data-key="2"></span>
                                    </li>
                                    <li>
                                        <span class="carousel-paginator__page" data-key="3"></span>
                                    </li>
                                    <li>
                                        <span class="carousel-paginator__page" data-key="4"></span>
                                    </li>
                                    <li>
                                        <span class="carousel-paginator__page selected" data-key="5"></span>
                                    </li>
                                </ul>
                            </div>
                            <div class="production-selling-cover-image__timer--mobile"></div>
                        </div> 
                    </div>
                </div>
                <!-- ????????? ?????? overview ??????-->
                    <div class="production-selling-overview_content if-1-content if-2-content if-3-content">
                        <div class="production-selling-header">
                            <h1 class="production-selling-header__title">
                                <p class="production-selling-header__title__brand-wrap">
                                    <!-- ?????? ??? -->
                                    <a class="production-selling-header__title__brand" href="/house/brandshop.com?brandcode=${product[0].seller_id }">${product[0].company_name } </a>
                                </p>
                                <div class="production-selling-header__title__name-wrap">
                                    <!-- ?????? ?????? -->
                                    <span class="production-selling-header__title__name"> ${product[0].post_name}</span>
                                    <!-- ????????????, ????????? -->
                                    <div class="production-selling-header__action">
                                     <c:choose>
	                                    <c:when test="${product[0].checkit eq true}">
	                                    <div id="s_${product[0].product_postid }"></div>
                                     	<button id="${product[0].product_postid }"  class="production-selling-header__action__button production-selling-header__action__button-scrap b_none" type="button">
                                            <svg class="icon--stroke" aria-label="?????????" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" style="fill: rgb(255, 119, 142); stroke: rgb(255, 119, 142);">
                                                <path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path>
                                            </svg>
                                            
                                        </button>
                                        </c:when>
                                        <c:when test="${product[0].checkit ne true}">
                                        <div id="s_${product[0].product_postid }"></div>
                                        <button id="${product[0].product_postid }" class="production-selling-header__action__button production-selling-header__action__button-scrap b_blue" type="button">
                                            <svg class="icon--stroke" aria-label="?????????" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                                <path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path>
                                            </svg>
                                          
                                        </button>
                                        </c:when>
                                      </c:choose>
                                       
                                    </div>
                                </div>
                            </h1>
                            <!-- ??????, ?????????, ?????? -->
                            <div class="production-selling-header__content">
                                <p class="production-selling-header__review-wrap">
                                    <a class="production-selling-header__review" href="#">
                                        <span class="production-selling-header__review__icon" aria-label="?????? ${totalRating }???">
                                            <c:choose>
													<c:when test="${totalRating > 4}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:when test="${totalRating > 3}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:when test="${totalRating > 2}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:when test="${totalRating > 1}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:when test="${totalRating > 0}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:when>
											</c:choose>
                                        </span>
                                        <c:choose>
                                        <c:when test="${totalRating > 0 }">
                                        <span class="production-selling-header__review__text">
                                            <span class="number">
                                                <span class="mobile-wrapper">(</span>${reviewList.size() }
                                                <span class="mobile-wrapper">)</span>
                                            </span>
                                            <span class="postfix">??? ??????</span>
                                        </span>
                                        </c:when>
                                        <c:otherwise>
                                        	<span class="production-selling-header__review__text">
                                            	<span class="postfix" style="margin-left: -0.5rem;">????????? ?????? ????????????:)</span>
                                        	</span>
                                        </c:otherwise>
                                        </c:choose>
                                    </a>
                                </p>
                                <div class="production-selling-header__price">
                                    <span class="production-selling-header__price__price-wrap">
                                        <span class="production-selling-header__price__discount">
                                            <span class="number">${product[0].sale_ratio}</span>
                                            <span class="percent">%</span>
                                        </span>
                                        <del class="production-selling-header__price__original">
                                            <span class="number">${price}</span>
                                            <span class="won">???</span>
                                        </del>
                                        <span class="production-selling-header__price__separator"></span>
                                        <span class="production-selling-header__price__price">
                                            <span class="number">${price_sale}</span>
                                            <span class="won">???<!-- ${product[0].post_couponid} --></span>
                                            <span class="production-selling-header__price__badge">
                                                <svg class="icons" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet">
                                                    <rect width="30" height="20" fill="#F77" rx="4"></rect>
                                                    <path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path>
                                                </svg>
                                            </span>
                                        </span>
                                    </span>
                                </div>
                                
                                <!-- ?????? ?????? -->
                                <c:forEach  var="i" begin="0" end="0">
                                 <c:if test="${product[0].post_couponid ne ''}" var="coupon_bln">
                                <div class="css-72tjgz e1gkvgq70">
                                    <button type="button" class="css-vs55nv emhbdh42" id="couponOn" onclick="openCoupon()" >
                                        <div class="css-px0sae emhbdh41">
                                            <span>${coupon.coupon_title }</span>
                                        </div>
                                        <svg width="28" height="46" fill="none" preserveAspectRatio="xMidYMid meet">
                                            <g>
                                                <path d="M0 1h7.468c.592 0 1.191.215 1.864.595.452.255.857.534 1.294.834l.004.003c.251.173.514.353.801.54.88.572 1.937.903 3.069.903s2.19-.331 3.069-.903c.287-.187.548-.367.8-.54l.005-.003c.437-.3.842-.579 1.294-.834.673-.38 1.273-.595 1.864-.595H29V0h-7.468c-1.386 0-2.603.835-3.777 1.64a35.96 35.96 0 01-.732.494 4.617 4.617 0 01-2.523.741 4.617 4.617 0 01-2.524-.741 35.92 35.92 0 01-.731-.494C10.07.835 8.854 0 7.468 0H0v1zM7.468 45H0v1h7.468c1.386 0 2.603-.835 3.777-1.64l.002-.002c.245-.168.488-.334.73-.492a4.617 4.617 0 012.523-.741c.935 0 1.804.273 2.523.741.243.158.485.324.73.492l.002.002c1.174.805 2.391 1.64 3.777 1.64H29v-1h-7.468c-.591 0-1.191-.215-1.864-.595a17.204 17.204 0 01-1.294-.834 37.248 37.248 0 00-.805-.543 5.618 5.618 0 00-3.069-.903c-1.132 0-2.19.331-3.069.903-.289.188-.552.37-.805.543-.437.3-.842.579-1.294.834-.673.38-1.272.595-1.864.595z" fill="#6CD5F4"></path>
                                                <path d="M14.5 4v38" stroke="#DADCE0" stroke-dasharray="5 3"></path>
                                            </g>
                                        </svg>
                                        <div class="css-ggq6e8 emhbdh40">
                                            <svg aria-label="????????????" width="30" height="30" fill="none" preserveAspectRatio="xMidYMid meet">
                                                <path d="M30 15c0 8.284-6.716 15-15 15-8.284 0-15-6.716-15-15C0 6.716 6.716 0 15 0c8.284 0 15 6.716 15 15z" fill="#E5F9FF"></path>
                                                <path d="M17.5 13.5h3.333L15 19.333 9.167 13.5H12.5v-5h5v5zM9.167 22.667V21h11.666v1.667H9.167z" fill="#35C5F0"></path>
                                            </svg>
                                        </div>
                                    </button>
                                </div>
                                </c:if>
                                </c:forEach>
                            </div>
                            
                                
                            </script>
                            <!-- ?????? ?????? -->
                            <div class="production-selling-header__info-wrap">
                                <div class="production-selling-header__promotion">
                                    <div class="production-selling-header__promotion__title-wrap">
                                        <span>??????</span>
                                    </div>
                                    <div class="production-selling-header__promotion__content-wrap">
                                        <p class="production-selling-header__promotion__entry">
                                            <b class="point_"></b> ?????? (<!-- -->WELCOME <!-- -->0.3<!-- -->% ??????)
                                        </p>
                                        <p class="production-selling-header__promotion__entry">
                                            <button class="production-selling-header__promotion__entry__button" type="button" onclick="openCard()">
                                                <script>
                                                window.onload = function() {
                                                	$(".point_").text(Math.floor(${int_price_sale}*0.003) + "P");
                                                	MIP_price = int_comma(Math.floor(${int_price_sale}/7));
                                                	$('.production-selling-header__promotion__entry__button').text("??? " + MIP_price + "??? (7??????) ???????????????");
                                                }
                                                </script>
                                                <svg class="icon" width="10" height="10" viewBox="0 0 10 10" fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                                    <path d="M2.5 8.2L5.63 5 2.5 1.8l.94-.97L7.5 5 3.44 9.17z"></path>
                                                </svg>
                                            </button>
                                        </p>
                                    </div>
                                </div>
                                <div class="production-selling-header__delivery">
                                    <div class="production-selling-header__delivery__title-wrap">
                                        <span>??????</span>
                                    </div>
                                    <div class="production-selling-header__delivery__content-wrap">
                                        <span class="production-selling-header__delivery__fee">
                                            <span>
                                                <b>1?????? <!-- -->22,000??? </b>
                                                ????????? 
                                            </span>
                                        </span>
                                        <span class="production-selling-header__delivery__type">
                                            <span>${table.shiptable_info}</span>
                                        </span>
                                        <span class="production-selling-header__delivery__disclaimer-wrap">
                                            <span class="production-selling-header__delivery__disclaimer">
                                                <svg class="check-icon" width="10" height="9" fill="none" preserveAspectRatio="xMidYMid meet">
                                                    <path d="M1 3.83l2.153 3.03a1 1 0 001.627.005L9 1" stroke="#BDBDBD" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                                <span>????????? 55,000???</span>
                                            </span>
                                            <span class="production-selling-header__delivery__disclaimer">
                                                <svg class="check-icon" width="10" height="9" fill="none" preserveAspectRatio="xMidYMid meet">
                                                    <path d="M1 3.83l2.153 3.03a1 1 0 001.627.005L9 1" stroke="#BDBDBD" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                                <span>???????????? ?????? ?????? ??????</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <!-- ????????? ??? -->
                            <a class="css-1jw8uh0 e3xbt9p7" href="/house/brandshop.com?brandcode=${product[0].seller_id }">
                                <div class="css-gshsra e3xbt9p6">
                                    <svg width="24" height="24" fill="none" preserveAspectRatio="xMidYMid meet">
                                        <path d="M3.972 8.694c0-.26.212-.472.472-.472h12.278a.472.472 0 010 .945H4.444a.472.472 0 01-.472-.473z" fill="#35C5F0"></path>
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M17.51 5.5H6.492a1 1 0 00-.93.632l-.99 2.5A1 1 0 005.498 10h13.004a1 1 0 00.927-1.368l-.99-2.5a1 1 0 00-.93-.632zM3.642 8.263a2.002 2.002 0 001.397 2.684V17.5a2.5 2.5 0 002.5 2.5H16.474a2.5 2.5 0 002.487-2.5v-6.553a2.002 2.002 0 001.398-2.684l-.99-2.5a2 2 0 00-1.86-1.263H6.493a2 2 0 00-1.86 1.263l-.99 2.5zM6.04 17.5V11h11.921v6.5a1.5 1.5 0 01-1.487 1.5v-4a2 2 0 00-2-2h-.97a2 2 0 00-2 2v4H7.54a1.5 1.5 0 01-1.5-1.5zm6.464 1.5h2.97v-4a1 1 0 00-1-1h-.97a1 1 0 00-1 1v1h.847a.5.5 0 110 1h-.847v2zM8 13h1.5v1.5H8V13zm-1 0a1 1 0 011-1h1.5a1 1 0 011 1v1.5a1 1 0 01-1 1H8a1 1 0 01-1-1V13z" fill="#3F474D"></path>
                                    </svg>
                                    <div class="css-158icaa e3xbt9p5">
                                        <span class="css-16kia55 e3xbt9p4">${product[0].company_name }</span>
                                    </div>
                                </div>
                                <div class="css-xq185e e3xbt9p0">
                                    <span>????????????</span>
                                    <svg width="14" height="14" fill="none" preserveAspectRatio="xMidYMid meet">
                                        <path d="M4.083 11.375L8.312 7 4.083 2.625l.803-.875L9.916 7l-5.03 5.25-.803-.875z" fill="#828C94"></path>
                                    </svg>
                                </div>
                            </a>
                        </div>
                        <!-- ?????? ?????? -->
                        <div class="production-selling-option-form production-selling-overview__option-form">
                            <section class="selling-option-form-content production-selling-option-form__form">
                                <div class="selling-option-form-content__form">
                                    <div class="selling-option-select-input">
                                        <div class="input-group select-input selling-option-select-input__option selling-option-select-input__option-1">
                                            <select class="form-control empty selectOne_ dh_S" onchange="selected_fun(this)" id="selectOne">
                                                <option selected="" value="" disabled="" >${product[0].option1_name }</option>
                                                <c:forEach  var="i" begin="0" end="${fn:length(product)-1}">
                                                <option>${product[i].option1 }</option>
                                                </c:forEach>
                                            </select><span class="select-input__icon">
                                                <svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet">
                                                    <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                                </svg>
                                            </span>
                                        </div>
                                      <c:if test="${product[0].option2_name ne ''}" var="select1">
                                        <div class="input-group select-input selling-option-select-input__option selling-option-select-input__option-2">
                                            <select class="form-control empty selectOne dh_S" onchange="add_div(this,this)" id="selectOne_">
                                                <option selected="" value="" disabled="">${product[0].option2_name }</option>
                                                
                                            </select>
                                            <span class="select-input__icon">
                                                <svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet">
                                                    <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                                </svg>
                                            </span>
                                        </div>
                                        <script>select = true</script>
                                        </c:if>
                                        <script>
                                        
                                        	function selected_fun(select_n){
                                        		if(select){
                                        			option_select(select_n.value, select_n.id);
                                        		}else{
                                        			add_div(select_n.value);
                                        		}
                                        	}
                                        	function option_select(option, thisClass){
                                        		$.ajax({
                                        			url:'option_send.com',	
                                      		  		method:'post',
                                      		  		data: JSON.stringify(option),
                                      		  		contentType : 'application/json; charset=UTF-8',
                                      		  		dataType : 'json',
                                      		  		success : function(option_list){
                                      		  			$("."+thisClass).html("<option selected='' value='' disabled=''>${product[0].option2_name }</option>");
                                      		  			 $.each(option_list,function(index,item){
                                      		  				var op = '<option value='+index+'>'+item["option2"]+'</option>';
                                      		  				$("."+thisClass).append(op);
                                      		  			}) 
                                      		  		}	
                                        		})
                                        	}
                                        	var option_val = null;
                                        	var option_arr = [];
                                        	function add_div(S1,S2){
                                        		if(S2 == null){
                                        			option_val = S1 + ":1" ;
                                        		}else {
                                        			option_val = $("."+S1.id).val() + "," + S2.options[S2.selectedIndex].text + ":1";
                                        		}
                                        		//console.log($("#"+S1).val());
                                        		console.log(option_val);
                                        		
                                        		splitStr = option_val.split(":");
                                        		for(var i in option_arr){
                                        			tester = option_arr[i].split(":");
                                        			if(tester[0] == splitStr[0]){
                                        				alert("?????? ????????? ???????????????.");
                                        				return;
                                        			}
                                        		}
                                        		option_arr.push(option_val);
                                        		$.ajax({
                                        			url:'option_toString.com',
                                        			method:'post',
                                        			data: JSON.stringify(option_val),
                                        			contentType : 'application/json; charset=UTF-8',
                                      		  		dataType : 'json',
                                      		  		success : function(option_toString_list){
                                      		  			console.log("ajax : " + option_toString_list);
                                      		  			buy_item(option_toString_list);
                                      		  		}
                                        		})
                                        		if(S2 != null){
                                        			$(S2).children('option:not(:first)').remove();
                                        		}
                                        	}
                                        </script>
                                        <!-- <div class="input-group select-input selling-option-select-input__option selling-option-select-input__option-extra">
                                            <select class="form-control empty" id="subOption">
                                                <option selected="" value="" disabled="">???????????? (??????)</option>
                                                <option value="0">???????????? S ??????_????????? (HS01101) (14,000???)</option>
                                                <option value="1">???????????? S ??????_????????? (HS01102) (14,000???)</option>
                                                <option value="2">???????????? SS ????????????_????????? (HS01103) (14,000???)</option>
                                                <option value="3">???????????? SS ????????????_????????? (HS01104) (14,000???)</option>
                                                <option value="4">???????????? Q ???_????????? (HS01105) (18,000???)</option>
                                                <option value="5">???????????? Q ???_????????? (HS01106) (18,000???)</option>
                                                <option value="6">???????????? K ???_????????? (HS01107) (18,000???)</option>
                                                <option value="7">???????????? K ???_????????? (HS01108) (18,000???)</option>
                                                <option value="8">????????? ?????? ?????? ?????? ????????? SS (HI01002) (182,900???)</option>
                                                <option value="9">????????? ?????? ?????? ?????? ????????? Q (HI01003) (222,900???)</option>
                                            </select>
                                            <span class="select-input__icon">
                                                <svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet">
                                                    <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                                </svg>
                                            </span>
                                        </div> -->
                                    </div>
                                </div>
                                <ul class="selling-option-form-content__list">
                                	<script>
                                		var count = 0;
                                		var empty = 0;
                                		var div_arr = new Array();
                                		function buy_item(option_toString){
                                			count++;
                                			for(i=0; i < count; i++){
                                				if(div_arr[i] == null){
                                					empty = i;
                                				}
                                			}
                                			console.log("why : " + option_toString);
                                			op_Str = option_toString[0];
                                			if(select == false){
                                				console.log("true ");
                                				option1 = op_Str.split(":");
                                				option1_name = option1[0];
                                			}else{
                                				option1_name = option_toString[0];
                                			}
                                			console.log(option_toString);
                                			div_arr[empty] = 1;
                                			var html =	'<li id="'+ empty +'_">\
                                					<article class="selling-option-item">\
                                					<h2 class="selling-option-item__name h1_'+empty+'">\
                                						${product[0].option1_name}: '+ option1_name +'\
                                					</h2>\
                                					<button class="selling-option-item__delete" id="'+empty+'" type="button" aria-label="??????" onclick="remove_div(this)">\
                                					<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">\
                                					<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z">\
                                					</path>\
                                					</svg>\
                                					</button>\
                                					<div class="selling-option-item__controls">\
                                					<div class="selling-option-item__quantity">\
                                					<div class="input-group select-input option-count-input">\
                                					<select class="form-control _'+empty+'" onchange="div_price(this)" id="_'+empty+'">\
                                					<option value="0">1</option>\
                                					<option value="1">2</option>\
                                					<option value="2">3</option>\
                                					<option value="3">4</option>\
                                					<option value="4">5</option>\
                                					<option value="5">6</option>\
                                					<option value="6">7</option>\
                                					<option value="7">8</option>\
                                					<option value="8">9</option>\
                                					<option value="9">10+</option>\
                                					</select><span class="select-input__icon">\
                                					<svg class="icon" width="10" height="10" preserveAspectRatio="xMidYMid meet" style="fill: currentcolor;">\
                                					<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span></div></div>\
                                					<p class="selling-option-item__price">${price_sale} ???</p>\
                                					</div>\
                                					</article>\
                                					</li>';
                                			$(".selling-option-form-content__list").append(html);
                                			if(option_toString[1] != null){
                                				var html2 = null;
                                				tester = option_toString[1].split(":");
                   						 		 html2 = '/ ${product[0].option2_name}: ' + tester[0] +'\n';
                   						 		$(".h1_"+empty+"").append(html2);	
                   							}
                                			$(".dh_S").val(null).prop("selected", true);
                                			all_price();
                                		}
                                		function remove_div(div_index){ // ?????? div ?????? ??????
                                			//console.log($(".h1_" + div_index.id).text());
                                			Str = $(".h1_" + div_index.id).text();
                                			Str = Str.replace(/ /gi,'').replace(/\t/gi,'').split("\n");
                                			
                                			if(select){
                                				option = Str[0].split("/")
                                				option1 = option[0].split(":");
                                				option2 = option[1].split(":");
                                				toStr = option1[1] + "," + option2[1];
                                			}else{
                                				Str = Str[0].split(":");
                                				toStr = Str[1];
                                			}
                                			for(i = 0; i < option_arr.length; i++){
                                				splitStr = option_arr[i].split(":");
                                				if(toStr == splitStr[0]){
                                					option_arr.splice(i, 1);
                                				}
                                			}
                                			div_arr[div_index.id] = null;
                                			//console.log(option_arr);
                                			$("#"+div_index.id+"_").remove();
                                			$("#"+div_index.id+"_").remove();
                                			$("#"+div_index.id+"_").remove();
                                			all_price();
                                		}
                                		function div_price(select_Class){ //?????? div ?????? ?????? ?????? ??????
                                			momy = $(".h1"+select_Class.id);
                                			mm = $(momy).next().next();
                                			son = $(mm).children('.selling-option-item__price');
                                			var EA = parseInt($(select_Class).val())+1;
                                			index_price = int_comma(parseInt(${int_price_sale})*EA);
                                			$(son).text(""+index_price + " ???");
                                			// ?????? ?????? div 3??? select ?????? ???????????????
                                			div_id = select_Class.id;
                                			$("."+div_id).val($(select_Class).val()).prop("selected",  true);
                                			all_price();
                                			product_EA_change(momy,$(select_Class).val());
                                		}
                                		function int_comma(Int_val){ // ?????? ?????? ?????? function
                                			int_val = Int_val;
                                			return int_val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                		}
                                		
                                		function all_price(){
                                			all = 0;
                                			ex = $(".selling-option-item__price").text();
                                			
                                			var price_array = ex.replace(/ /gi,'').split("???");
                                			Exnum = 0;
                                			for(i=0; i < div_arr.length; i++){
                                				if(div_arr[i] == 1){
                                					Exnum++;
                                				}
                                			}
                                			for(i=0; i < Exnum; i++){
                                				ex_num = price_array[i].replace(/,/gi , "");
                                				ex_num *= 1; //??? ??????
                                				all += ex_num;
                                			}
                                			$(".selling-option-form-content__price__number").text(int_comma(all));
                                		}
                                		function product_EA_change(className, selectNum){
                                			console.log("check" + className + selectNum);
                                			exCls = $(className).attr('class').split(" ");
                                			Str = $("." + exCls[1]).text();
											Str = Str.replace(/ /gi,'').replace(/\t/gi,'').split("\n");
                                			if(select){
                                				option = Str[0].split("/")
                                				option1 = option[0].split(":");
                                				option2 = option[1].split(":");
                                				toStr = option1[1] + "," + option2[1];
                                			}else{
                                				Str = Str[0].split(":");
                                				toStr = Str[1];
                                			}
                                			for(i = 0; i < option_arr.length; i++){
                                				splitStr = option_arr[i].split(":");
                                				console.log("check2 : \n" + splitStr[0]+ "\n" + toStr);
                                				if(toStr == splitStr[0].replace(/ /gi,'')){
                                					var Num = parseInt(selectNum) + 1;
                                					option_arr[i] = splitStr[0] + ":" + Num;
                                				}
                                			}
                                			console.log(option_arr);
                                		}
                                	</script>
                                </ul>
                            </section>
                            <!-- ?????? ?????? -->
                            <p class="selling-option-form-content__price">
                                <span class="selling-option-form-content__price__left">????????????</span>
                                <span class="selling-option-form-content__price__right">
                                    <span class="selling-option-form-content__price__number">
                                        0
                                    </span>
                                    ???
                                </span>
                            </p>
                            <!-- ???????????? ?????? ??????-->
                            <div class="production-selling-option-form__footer">
                                <button class="button button--color-blue-inverted button--size-55 button--shape-4" type="button" onClick="basket()">
                                    ????????????
                                </button>
                                <button class="button button--color-blue button--size-55 button--shape-4" type="button" onClick="basket('buy')">
                                    ????????????
                                </button>
                            </div>
                        </div>
                        <!-- ?????? ??? ?????? -->
                        <div class="production-selling-overview__promotion-banner">
                            <a class="production-selling-promotion-banner" href="#">
                                <img class="production-selling-promotion-banner__image production-selling-promotion-banner__image--pc" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/production_promotions/event/164561040834468477.jpg?gif=1&amp;w=480" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/production_promotions/event/164561040834468477.jpg?gif=1&amp;w=720 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/production_promotions/event/164561040834468477.jpg?gif=1&amp;w=960 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/production_promotions/event/164561040834468477.jpg?gif=1&amp;w=1440 3x">
                                <img class="production-selling-promotion-banner__image production-selling-promotion-banner__image--mobile" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/production_promotions/event/164561041264369502.png?gif=1&amp;w=720" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/production_promotions/event/164561041264369502.png?gif=1&amp;w=1080 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/production_promotions/event/164561041264369502.png?gif=1&amp;w=1440 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/production_promotions/event/164561041264369502.png?gif=1&amp;w=2560 3x">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ????????? ?????? inform css-->
            <!-- ??? ????????? ??? ????????? div -->
            <div class="production-selling__card-gallery-wrap container">
                <div class="production-selling-section production-selling-section--placeholder">
                    <div class="production-selling-section__header">
                        <div class="production-selling-section__title"></div>
                        <div class="production-selling-section__right"></div>
                    </div>
                    <div class="gallery-wrap"></div>
                </div>
            </div>
            <div class="production-selling-navigation__border"></div>
            <!-- ?????? ?????? nav -->
            <div class="sticky-container production-selling-navigation__wrap" style="position: sticky; top: 80px; transition: top 0.1s ease 0s;">
                <div class="sticky-child production-selling-navigation" style="position: relative;">
                    <nav class="production-selling-navigation__content">
                        <ol class="production-selling-navigation__list">
                            <li>
                                <a class="production-selling-navigation__item production-selling-navigation__item--active" href="#production-selling-information" id="QuickBtn1">
                                    ????????????
                                </a>
                            </li>
                            <li>
                                <a class="production-selling-navigation__item" href="#production-selling-review"id="QuickBtn2" >
                                    ??????
                                    <span class="production-selling-navigation__item__count">
                                        ${reviewList.size() }
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="production-selling-navigation__item" href="/house/CScenter.com" id="QuickBtn3">
                                    ??????
                                    <span class="production-selling-navigation__item__count">
                                        / ????????????
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="production-selling-navigation__item" href="#production-selling-delivery" id="QuickBtn4">
                                    ??????/??????
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- ?????? ?????? ????????? -->
            <div class="production-selling__detail-wrap container">
                <div class="production-selling__detail row">
                    <div class="production-selling__detail__content col-12 col-lg-8">
                        <div class="production-selling-content">
                            <a id="production-selling-information" ></a>
                            <!-- ?????? ?????? ?????????(??????)-->
                            <!--
                            <section class="production-selling-section">
                                <header class="production-selling-section__header production-selling-section__header__hidden">
                                    <h1 class="production-selling-section__title">
                                        ????????????
                                    </h1>
                                </header>
                                 ??? ????????? ??? ????????? ?????? 
                                <div class="production-selling-description production-selling-description--notice">
                                    <div class="production-selling-description__expand-wrap">
                                        <button class="button button--color-blue button--size-60 button--shape-4 production-selling-description__expand" type="button">
                                            ?????????
                                            <svg class="icon" width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
                                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="production-selling-description__content">
                                        <div style="margin: 0px; padding: 0px; width: 100%; text-align: center;">
                                            <div>
                                                <div style="margin: 0px; padding: 0px; width: 100%; text-align: center;">
                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>-->
                            <header class="production-selling-section__header production-selling-section__header__hidden">
                                <h1 class="production-selling-section__title">
                                    ????????????
                                </h1>
                            </header>
                            <div class="production-selling-description production-selling-description--notice production-selling-description--open">
                                <div class="production-selling-description__content">
                                <c:forEach  var="i" begin="0" end="${fn:length(img_false)-1}">
                               		<img src="${img_false[i].photo_url}">
                                </c:forEach>
                                    <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/descriptions/1_1591763902471_3h.jpg?gif=1&amp;w=720" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/descriptions/1_1591763902471_3h.jpg?gif=1&amp;w=1080 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/descriptions/1_1591763902471_3h.jpg?gif=1&amp;w=1440 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/descriptions/1_1591763902471_3h.jpg?gif=1&amp;w=2560 3x">
                                    <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/descriptions/1_1592282616067_Pp6O4.jpg?gif=1&amp;w=720" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/descriptions/1_1592282616067_Pp6O4.jpg?gif=1&amp;w=1080 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/descriptions/1_1592282616067_Pp6O4.jpg?gif=1&amp;w=1440 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/descriptions/1_1592282616067_Pp6O4.jpg?gif=1&amp;w=2560 3x">
                                </div>
                            </div>
                            <table class="production-selling-table production-selling-description__information-noti">
                                <tbody>
                                    <tr>
                                        <th>??????</th>
                                        <td>${table.table_title }</td>
                                    </tr>
                                    <tr>
                                        <th>KC ?????? ??? ??????</th>
                                        <td>${table.table_kc }</td>
                                    </tr>
                                    <tr>
                                        <th>??????</th>
                                        <td>${table.table_color }</td>
                                    </tr>
                                    <tr>
                                        <th>?????????</th>
                                        <td>${table.table_component }</td>
                                    </tr>
                                    <tr>
                                        <th>?????? ??????</th>
                                        <td>${table.table_material }</td>
                                    </tr>
                                    <tr>
                                        <th>?????????, ???????????? ?????? ???????????? ?????? ??????</th>
                                        <td>${table.table_manufacturer }</td>
                                    </tr>
                                    <tr>
                                        <th>?????????</th>
                                        <td>${table.table_country }</td>
                                    </tr>
                                    <tr>
                                        <th>??????</th>
                                        <td>${table.table_size }</td>
                                    </tr>
                                    <tr>
                                        <th>??????, ????????????</th>
                                        <td>${table.table_delivery }</td>
                                    </tr>
                                    <tr>
                                        <th>??????????????????</th>
                                        <td>${table.table_qa }</td>
                                    </tr>
                                    <tr>
                                        <th>A/S ???????????? ????????????</th>
                                        <td>${table.table_cstel }</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- ???????????? -->
                            <a id="production-selling-review" ></a>
                            <section class="production-selling-section">
                                <header class="production-selling-section__header">
                                    <h1 class="production-selling-section__title">
                                        ?????? 
                                        <span class="count">
                                            ${reviewList.size() }
                                        </span>
                                    </h1>
                                    <!-- 
                                    <div class="production-selling-section__right">
                                        <button type="button">
                                            ????????????
                                        </button>
                                    </div> -->
                                </header>
                                <!-- ?????? ?????? -->
                                <div class="production-review-feed">
                                    <!-- ?????? ?????? ?????? -->
                                    
                                    <div class="production-review-feed__header-v2">
                                        <div class="production-review-feed__header-v2__stars">
                                            <div class="production-review-feed__header-v2__stars__badge">
                                                <span style="font-size: 30px;">?????? : </span>
                                                <span class="badge__pc">
                                                   ${totalRating }
                                                </span>
                                            </div>
                                            <!-- ?????? ?????? ?????? -->
                                            <div class="production-review-feed__header-v2__stars__badge">
                                                <span class="icon" aria-label="${totalRating }">
                                                	<c:choose>
													<c:when test="${totalRating > 4}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:when test="${totalRating > 3}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:when test="${totalRating > 2}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:when test="${totalRating > 1}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:when test="${totalRating > 0}">
													<span class="fillstar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:when>
													<c:otherwise>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													<span class="nonestar"><i class="fa-solid fa-star"></i></span>
													</c:otherwise>
													</c:choose>
                                                </span>
                                            </div>
                                            <!-- 
                                            <div class="production-review-feed__header-v2__stars__avg">
                                                <div class="production-review-feed__header-v2__stars__avg-warp">
                                                    <div class="production-review-feed__header-v2__stars__avg__container">
                                                        <div class="production-review-feed__header-v2__stars__avg__label label_selected">
                                                            5???
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__bar">
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__bg"></div>
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__color" style="width: 79.6375%;"></div>
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__number label_selected">
                                                            9,183
                                                        </div>
                                                    </div>
                                                    <div class="production-review-feed__header-v2__stars__avg__container">
                                                        <div class="production-review-feed__header-v2__stars__avg__label">
                                                            4???
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__bar">
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__bg"></div>
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__color" style="width: 16.7635%;"></div>
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__number">
                                                            1,933
                                                        </div>
                                                    </div>
                                                    <div class="production-review-feed__header-v2__stars__avg__container">
                                                        <div class="production-review-feed__header-v2__stars__avg__label">
                                                            3???
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__bar">
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__bg"></div>
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__color" style="width: 3.10467%;"></div>
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__number">
                                                            358
                                                        </div>
                                                    </div>
                                                    <div class="production-review-feed__header-v2__stars__avg__container">
                                                        <div class="production-review-feed__header-v2__stars__avg__label">
                                                            2???
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__bar">
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__bg"></div>
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__color" style="width: 0.329546%;"></div>
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__number">
                                                            38
                                                        </div>
                                                    </div>
                                                    <div class="production-review-feed__header-v2__stars__avg__container">
                                                        <div class="production-review-feed__header-v2__stars__avg__label">
                                                            1???
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__bar">
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__bg"></div>
                                                            <div class="production-review-feed__header-v2__stars__avg__bar__color" style="width: 0.216807%;"></div>
                                                        </div>
                                                        <div class="production-review-feed__header-v2__stars__avg__number">
                                                            25
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            -->
                                        </div>
                                    </div>
                                    <!-- ?????? ?????? -->
                                    <c:if test="${reviewList.size() > 0 }">
                                    <div class="filter">
                                        <div class="production-review-feed__filter">
                                            <div class="production-review-feed__filter__order-list">
                                                <button class="production-review-feed__filter__order production-review-feed__filter__order--active" aria-pressed="true" type="button">
                                                    ????????????
                                                </button>
                                                <button class="production-review-feed__filter__order" aria-pressed="false" type="button">
                                                    ?????????
                                                </button>
                                                <button class="production-review-feed__filter__order production-review-feed__filter__order--photo" aria-pressed="false" type="button">
                                                    <svg class="icon" width="18" height="18" viewBox="0 0 18 18" preserveAspectRatio="xMidYMid meet">
                                                        <path fill="currentColor" d="M15.821 3a.67.67 0 0 1 .679.672v10.656a.67.67 0 0 1-.679.672H2.18a.67.67 0 0 1-.679-.672V3.672c0-.375.3-.672.679-.672H15.82zm-.679 1.344H2.858v8.14L7.01 7.781c.094-.125.284-.125.394 0l2.321 2.657c.048.046.063.109.048.156l-.3 1.375c-.016.11.11.172.173.094l2.369-2.579a.202.202 0 0 1 .284 0l2.842 3.094V4.344zm-2.526 3.61a1.1 1.1 0 0 1-1.105-1.095 1.1 1.1 0 0 1 1.105-1.093 1.1 1.1 0 0 1 1.105 1.093 1.1 1.1 0 0 1-1.105 1.094z"> </path>
                                                    </svg>
                                                    ????????????
                                                </button>
                                            </div>
                                            <div class="production-review-feed__filter__option-list__mobile">
                                                <div class="drop-down panel-drop-down filter-bar-control">
                                                    <button class="production-review-feed__filter__option" type="button">
                                                        <svg class="production-review-feed__filter__option__icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                                            <path fill="#BDBDBD" d="M18.284 4H5.716a.7.7 0 0 0-.61.362.668.668 0 0 0 0 .724l3.963 6.978c.353.632.97 1.348.971 2.076v6.181c.002.24-.054.388.149.558.203.17.343.118.444.095l3.29-1.257c.283-.095.321-.369.317-.676v-4.9c0-.73.338-1.445.69-2.077l3.963-6.978a.668.668 0 0 0 0-.724.7.7 0 0 0-.61-.362z"></path>
                                                        </svg>
                                                        ??????
                                                    </button>
                                                </div>
                                            </div>
                                            <!-- 
                                            <ul class="production-review-feed__filter__option-list__pc">
                                                <li class="filter-bar__control-list__item">
                                                    <div class="drop-down panel-drop-down filter-bar-control">
                                                        <button class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">
                                                            ??????
                                                            <svg class="icon" width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                                                <path d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z"></path>
                                                            </svg>
                                                        </button>
                                                    </div>
                                                </li>
                                                <li class="filter-bar__control-list__item">
                                                    <div class="drop-down panel-drop-down filter-bar-control">
                                                        <button class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">
                                                            ??????
                                                            <svg class="icon" width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                                                <path d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z"></path>
                                                            </svg>
                                                        </button>
                                                    </div>
                                                </li>
                                            </ul>
                                                                                             -->
                                        </div>
                                    </div>
								</c:if>
                                </div>

                                <!-- ?????? -->
                                <div class="production-review-feed__list">
                                	<c:forEach items="${reviewList }" var="review">
                                    <div class="production-review-item__container">
                                        <article class="production-review-item">
                                            <div class="production-review-item__writer">
                                                <a href="#">
                                                    <img src="${review.user_img }" class="production-review-item__writer__img" alt="">
                                                </a>
                                                <div class="production-review-item__writer__info">
                                                    <p class="production-review-item__writer__info__name">
                                                        ${review.nickname }
                                                    </p>
                                                    <button class="production-review-item__writer__info__total-star-wrap" type="button">
                                                        <span class="production-review-item__writer__info__total-star" aria-label="?????? 5.0???">
															<c:if test="${review.rating eq 5}">
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															</c:if>
															<c:if test="${review.rating eq 4}">
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															</c:if>
															<c:if test="${review.rating eq 3}">
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															</c:if>
															<c:if test="${review.rating eq 2}">
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															</c:if>
															<c:if test="${review.rating eq 1}">
															<span class="fillstar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															<span class="nonestar"><i class="fa-solid fa-star"></i></span>
															</c:if>
                                                        </span>
                                                    </button>
                                                    <span class="production-review-item__writer__info__date">
                                                        <fmt:formatDate value="${review.created_at }" pattern="yyyy.MM.dd"/>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="production-review-item__name">
                                                <p>${review.option1_name }: ${review.option1 } <c:if test="${review.option2 ne '' }">/ ${review.option2_name }: ${review.option2 }</c:if></p>
                                            </div>
                                            <c:if test="${review.review_image ne '' }">
                                            <button type="button" class="production-review-item__img__btn">
                                                	<img class="production-review-item__img" src="${review.review_image }"/>
                                            </button>
                                            </c:if>
                                            <p class="production-review-item__description">${review.recontent }
                                            </p>
                                            <div class="production-review-item__help">
                                                <button type="button" class="production-review-item__help__btn likedbtn" value="${review.review_id }"> 
                                                    ????????? ??????
                                                </button>
                                                <!-- ???????????? ????????? ??????.. -->
                                                <button type="button" style="display:none;" class="production-review-item__help__btn__check likedbtn" value="${review.review_id }"> 
                                                    ??????
                                                </button>
                                                <div class="production-review-item__help__text">
                                                    <span class="production-review-item__help__text__number" id="s_${review.review_id }">
                                                    	<c:if test="${review.liked ne ''}">
                                                        	${review.liked }
                                                        </c:if>
                                                        <c:if test="${review.liked eq ''}">
                                                        	0
                                                        </c:if>
                                                    </span>
                                                    ????????? ????????? ???????????????.
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    </c:forEach>
                                </div>
                            
                            </section>
                            <!-- ?????? -->
                            <a id="production-selling-question"></a>
                            <section class="production-selling-section" style="display:none;">
                                <header class="production-selling-section__header">
                                    <h1 class="production-selling-section__title">
                                        ?????? 
                                        <span class="count">
                                            11,812
                                        </span>
                                    </h1>
                                    <div class="production-selling-section__right">
                                        <a href="#">????????????</a>
                                    </div>
                                </header>
                                <div class="production-question-feed">
                                    <div class="production-question-feed__list">
                                        <!-- ??????????????? ?????? ?????? -->
                                        <article class="production-question-feed__item" data-qna-id="5975667">
                                            <header class="production-question-feed__item__header">
                                                ?????? | ?????? | 
                                                <span class="unanswered">
                                                    ?????????
                                                </span>
                                            </header>
                                            <p class="production-question-feed__item__author">
                                                ???* | 2022??? 04??? 06??? 00??? 18???
                                            </p>
                                            <div class="production-question-feed__item__question">
                                                <span class="production-question-feed__item__badge">
                                                    Q&nbsp;
                                                </span>
                                                <!-- ?????? ?????? ( 1?????? ???????????? ????????? ?????? ) -->
                                                <p class="production-question-feed__item__content"><span class="production-question-feed__item__content__option-name">?????? 25cm ???????????? ??????????????? _S ?????? / ?????????(HL01037)<br></span>
                                                    ??????????????? ?????????????????????.</p>
                                            </div>
                                        </article>
                                        <article class="production-question-feed__item" data-qna-id="5975667">
                                            <header class="production-question-feed__item__header">
                                                ?????? | ?????? | 
                                                <span class="unanswered">
                                                    ?????????
                                                </span>
                                            </header>
                                            <p class="production-question-feed__item__author">
                                                ??????* | 2022??? 04??? 06??? 00??? 18???
                                            </p>
                                            <div class="production-question-feed__item__question">
                                                <span class="production-question-feed__item__badge">
                                                    Q&nbsp;
                                                </span>
                                                <!-- ?????? ?????? ( 1?????? ???????????? ????????? ?????? ) -->
                                                <p class="production-question-feed__item__content"><svg class="production-question-feed__item__content__secret-icon"
                                                        viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
                                                        <path fill="#AFAFAF"
                                                            d="M10 5.33h-.67V4a3.33 3.33 0 00-6.66 0v1.33H2c-.73 0-1.33.6-1.33 1.34v6.66c0 .74.6 1.34 1.33 1.34h8c.73 0 1.33-.6 1.33-1.34V6.67c0-.74-.6-1.34-1.33-1.34zm-4 6c-.73 0-1.33-.6-1.33-1.33S5.27 8.67 6 8.67s1.33.6 1.33 1.33-.6 1.33-1.33 1.33zm2.07-6H3.93V4a2.07 2.07 0 014.14 0v1.33z">
                                                        </path>
                                                    </svg>??????????????????</p>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- ?????? ?????? ????????? ???-->
                                    <ul class="list-paginator production-question-feed__paginator">
                                        <li><button class="list-paginator__page sm selected" type="button">1</button></li>
                                        <li><button class="list-paginator__page sm" type="button">2</button></li>
                                        <li><button class="list-paginator__page sm" type="button">3</button></li>
                                        <li><button class="list-paginator__page sm" type="button">4</button></li>
                                        <li><button class="list-paginator__page sm" type="button">5</button></li>
                                        <li><button class="list-paginator__page" type="button">6</button></li>
                                        <li><button class="list-paginator__page" type="button">7</button></li>
                                        <li><button class="list-paginator__page" type="button">8</button></li>
                                        <li><button class="list-paginator__page" type="button">9</button></li>
                                        <li><button class="list-paginator__next" type="button">
                                            <svg width="26" height="26" viewBox="0 0 26 26" preserveAspectRatio="xMidYMid meet">
                                                    <g fill="none" fill-rule="evenodd" transform="matrix(-1 0 0 1 26 0)">
                                                        <rect width="25" height="25" x=".5" y=".5" stroke="#DCDCDC" rx="4"></rect>
                                                        <g stroke="#424242" stroke-linecap="square" stroke-width="2">
                                                            <path d="M14.75 8.263L10.25 13M10.25 13l4.5 4.737"></path>
                                                        </g>
                                                    </g>
                                                </svg>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </section>
                            <!-- ?????? -->
                            <a id="production-selling-delivery"></a>
                            <section class="production-selling-section">
                                <header class="production-selling-section__header">
                                    <h1 class="production-selling-section__title">
                                        ??????
                                    </h1>
                                </header>
                                <table class="production-selling-table">
                                    <tbody>
                                        <tr>
                                            <th>??????</th>
                                            <td>${table.shiptable_info }</td>
                                        </tr>
                                        <tr>
                                            <th>?????????</th>
                                            <td>${table.shiptable_fee} </td>
                                        </tr>
                                        <tr>
                                            <th>???????????? ?????? ?????????</th>
                                            <td>${table.shiptable_plusfee} </td>
                                        </tr>
                                        <tr>
                                            <th>???????????? ??????</th>
                                            <td>${table.shiptable_unable}</td>
                                        </tr>
                                        <tr>
                                            <th>?????? ?????????</th>
                                            <td>${table.shiptable_propotionalfee}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </section>
                            <section class="production-selling-section">
                                <header class="production-selling-section__header">
                                    <h1 class="production-selling-section__title">
                                        ??????/??????
                                    </h1>
                                </header>
                                    <div class="production-selling-refund">
                                        <table class="production-selling-table production-selling-refund__table">
                                            <tbody>
                                                <tr>
                                                    <th>???????????????</th>
                                                    <td>${table.refundtable_fee}</td>
                                                </tr>
                                                <tr>
                                                    <th>???????????????</th>
                                                    <td>${table.exchangetable_fee}</td>
                                                </tr>
                                                <tr>
                                                    <th>????????? ???</th>
                                                    <td>${table.refundtable_address}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <h2 class="production-selling-refund__title">??????/?????? ????????? ?????? ?????? ?????? ??????</h2>
                                        <p class="production-selling-refund__note">?????? ??? ?????? ???????????? ??????????????? ????????????, ?????????, ?????????, ????????? ?????? ?????? ???????????? ??? ??????????????? ????????? ????????? ????????????.
                                        </p>
                                        <ol class="production-selling-refund__list">
                                            <li>????????? ?????? ????????? ?????? ?????? ??? 7??? ??????&nbsp;<small>(????????? ??????????????? ??????)</small></li>
                                            <li>??????/????????? ??????, ??????????????? ?????? ?????? ?????? ??? 3?????? ?????? ?????? ??????/????????? ?????? ????????? ??? ???????????? 30??? ??????.<br>??? ??? ?????? ?????? ??? ??????/?????? ??????&nbsp;<small>(?????????
                                                    ??????????????? ??????)</small></li>
                                        </ol>
                                        <h2 class="production-selling-refund__title">??????/?????? ????????? ??????</h2>
                                        <p class="production-selling-refund__note">????????? ?????? ?????? ??????/????????? ??????????????????.</p>
                                        <ol class="production-selling-refund__list">
                                            <li>????????????????????? ?????? ??????</li>
                                            <li>???????????? ?????? ?????? ????????? ?????? ?????? ?????? ?????? ????????? ??????&nbsp;<small>(???, ????????? ????????? ???????????? ????????? ?????? ?????? ????????? ????????? ??????)</small></li>
                                            <li>????????? ?????????????????? ????????? ???????????? ??????????????? ????????? ????????? ??????&nbsp;<small>(???: ??????, ?????????)</small></li>
                                            <li>???????????? ?????? ?????? ?????? ????????? ????????? ????????? ????????? ????????? ????????? ??????&nbsp;<small>(????????? ????????? ?????? ?????? ????????? ????????? ????????? ????????? ??????)</small></li>
                                            <li>????????? ????????? ????????? ???????????? ????????? ????????? ?????? ?????? ????????? ????????? ????????? ??????&nbsp;<small>(???: ??????, ?????????)</small></li>
                                            <li>???????????? ?????? ??? ??????????????? ???????????? ??????????????????</li>
                                            <li>????????? ????????? ?????? ?????? ????????? ????????? ??????&nbsp;<small>(CD/DVD/GAME/????????? ?????? ?????? ?????? ???)</small></li>
                                        </ol>
                                    </div>
                            </section>
                            <section class="production-selling-section">
                                <header class="production-selling-section__header">
                                    <h1 class="production-selling-section__title">
                                        ????????? ??????
                                    </h1>
                                </header>
                                <div>
                                    <table class="production-selling-table">
                                        <tbody>
                                            <tr>
                                                <th>??????</th>
                                                <td>??????????????????</td>
                                            </tr>
                                            <tr>
                                                <th>?????????</th>
                                                <td>?????????</td>
                                            </tr>
                                            <tr>
                                                <th>??????????????????</th>
                                                <td>?????? ????????? ?????????87??? 19 10???</td>
                                            </tr>
                                            <tr>
                                                <th>???????????? ????????????</th>
                                                <td>02-1644-5213</td>
                                            </tr>
                                            <tr>
                                                <th>E-mail</th>
                                                <td>cs@dolphin-agit.com</td>
                                            </tr>
                                            <tr>
                                                <th>????????? ????????????</th>
                                                <td>409-43-73987</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!-- ?????? ?????? ????????? ?????? (??? ???????????? ?????????) -->
                    <div class="production-selling__detail__sidebar col-4" id="sidebar_js">
                        <!--????????? ?????? ?????? ???????????? ???????????? ????????? ???????????? ??????-->
                        <div class="sticky-container production-selling-sidebar-wrap"id="sidebar_js1" >
                            <div class="sticky-child production-selling-sidebar" id="sidebar_move" style="position: relative; height: 589px; box-sizing: border-box;" >
                                <section class="production-selling-sidebar-content production-selling-sidebar__content">
                                    <div class="production-selling-option-form production-selling-sidebar-content__option-form">
                                        <section class="selling-option-form-content production-selling-option-form__form">
                                            <div class="selling-option-form-content__form">
                                                <div class="selling-option-select-input">
                                                    <div class="input-group select-input selling-option-select-input__option selling-option-select-input__option-1 ">
                                                        <select class="form-control empty selectTwo_ dh_S" onchange="selected_fun(this)" id="selectTwo">
                                                            <option selected="" value="" disabled="" >${product[0].option1_name }</option>
                                                            <c:forEach  var="i" begin="0" end="${fn:length(product)-1}">
                                                			<option>${product[i].option1 }</option>
                                           				     </c:forEach>
                                                        </select>
                                                        <span class="select-input__icon">
                                                            <svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet">
                                                                <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                                            </svg>
                                                        </span>
                                                    </div>
                                                    <c:if test="${product[0].option2_name ne ''}">
                                                    <div class="input-group select-input selling-option-select-input__option selling-option-select-input__option-2">
                                                        <select class="form-control empty selectTwo dh_S" onchange="add_div(this,this)" id="selectTwo_">
                                                            <option selected="" value="" disabled="">${product[0].option2_name }</option>
                                                        </select><span class="select-input__icon"><svg class="icon" width="10" height="10"
                                                                style="fill:currentColor" preserveAspectRatio="xMidYMid meet">
                                                                <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                                            </svg>
                                                        </span>
                                                    </div></c:if>
                                                    <!-- <div class="input-group select-input selling-option-select-input__option selling-option-select-input__option-extra">
                                                        <select class="form-control empty">
                                                            <option selected="" value="" disabled="">???????????? (??????)</option>
                                                            <option value="0">???????????? S ??????_????????? (HS01101) (14,000???)</option>
                                                            <option value="1">???????????? S ??????_????????? (HS01102) (14,000???)</option>
                                                            <option value="2">???????????? SS ????????????_????????? (HS01103) (14,000???)</option>
                                                            <option value="3">???????????? SS ????????????_????????? (HS01104) (14,000???)</option>
                                                            <option value="4">???????????? Q ???_????????? (HS01105) (18,000???)</option>
                                                            <option value="5">???????????? Q ???_????????? (HS01106) (18,000???)</option>
                                                            <option value="6">???????????? K ???_????????? (HS01107) (18,000???)</option>
                                                            <option value="7">???????????? K ???_????????? (HS01108) (18,000???)</option>
                                                            <option value="8">????????? ?????? ?????? ?????? ????????? SS (HI01002) (182,900???)</option>
                                                            <option value="9">????????? ?????? ?????? ?????? ????????? Q (HI01003) (222,900???)</option>
                                                        </select>
                                                        <span class="select-input__icon">
                                                            <svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet">
                                                                <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                                            </svg>
                                                        </span>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <ul class="selling-option-form-content__list"></ul>
                                        </section>
                                        <p class="selling-option-form-content__price">
                                            <span class="selling-option-form-content__price__left">
                                                ????????????
                                            </span>
                                            <span class="selling-option-form-content__price__right">
                                                <span class="selling-option-form-content__price__number">
                                                    0
                                                </span>
                                                ???
                                            </span>
                                        </p>
                                        <div class="production-selling-option-form__footer">
                                            <button class="button button--color-gray-14-inverted button--size-55 button--shape-4 production-selling-sidebar-content__scrap" type="button">
                                                <svg class="icon--stroke" aria-label="?????????" width="24" height="24"
                                                    fill="currentColor" stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24"
                                                    preserveAspectRatio="xMidYMid meet">
                                                    <path
                                                        d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
                                                    </path>
                                                </svg>
                                            </button>
                                            <button class="button button--color-blue-inverted button--size-55 button--shape-4"
                                                type="button" onClick="basket()">
                                                ????????????
                                            </button>
                                            <button class="button button--color-blue button--size-55 button--shape-4" type="button">
                                                ????????????
                                            </button>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div><!-- ????????????????????? ?????? end-->
                </div>
            </div>
            <!-- ??? ????????? ??? ????????? ?????? ???????????? ?????? -->
            <div class="sticky-container production-selling-floating-wrap"
                style="position: sticky; bottom: 0px; transition: bottom 0.1s ease 0s;">
                <div class="sticky-child production-selling-floating" style="position: relative;">
                    <div class="production-selling-floating-content production-selling-floating__content">
                        <button class="production-selling-floating-content__scrap" type="button">
                            <svg class="icon--stroke" aria-label="?????????" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="0.5"
                                viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                <path
                                    d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
                                </path>
                            </svg>
                            <span class="count">
                                56,488
                            </span>
                        </button>
                        <button class="_3Z6oR _3AsCW _32u90 production-selling-floating-content__button" type="button" id="smallbuyBtn" onclick="openSmallbuy()">
                            ????????????
                        </button>
                    </div>
                </div>
            </div>
        </div><!-- first div -->
        <footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>
    </div>
    <!-- footer -->
   

<!-- Script -->
<!-- ?????? div -->
<c:if test="${coupon_bln}">
<div class="react-modal-dh react-modal--bottom coupon-modal open open-active" id="coupon" style="display: none;">
    <div class="react-modal__content-wrap-dhp">
        <div class="react-modal__content-dh coupon-modal__content-dh">
            <header class="coupon-modal__header">
                <h1 class="coupon-modal__title"></h1><button class="coupon-modal__close" type="button" id="couponOff" onclick="closeCoupon()"
                    aria-label="??????"><svg class="icon" width="24" height="24" fill="currentColor" viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet">
                        <path
                            d="M12 11.3l8.13-8.14.7.7L12.72 12l8.13 8.13-.7.7L12 12.72l-8.13 8.13-.7-.7L11.28 12 3.16 3.87l.7-.71L12 11.29z">
                        </path>
                    </svg></button>
            </header>
            <ul class="coupon-modal__list">
                <li>
                    <article class="coupon-modal__item">
                        <div class="coupon-modal__item__content">
                            <p class="coupon-modal__item__price"><fmt:formatNumber value="${coupon.coupon_discount }" pattern="???#,###" /></p>
                            <p class="coupon-modal__item__title">${coupon.coupon_subtitle }</p>
                            <p class="coupon-modal__item__stat-list"><span class="coupon-modal__item__stat-item">&nbsp;</span></p>
                        </div>
                        <div class="coupon-modal__item__get-wrap">
                         <c:choose>
                         <c:when test="${carry_coupon.user_couponid ne null }"><button onclick="coupon_down()"
                                class="button button--color-blue button--size-45 button--shape-4 coupon-modal__item__get" disabled
                                type="button">?????????</button></c:when>
						<c:otherwise>
                        <button onclick="coupon_down()"
                                class="button button--color-blue button--size-45 button--shape-4 coupon-modal__item__get"
                                type="button">??????</button>
                        </c:otherwise>
                        </c:choose>
                        
                        </div>
                    </article>
                </li>
            </ul>
        </div>
    </div>
</div>
</c:if>
<!-- ????????? div -->
<div class="react-modal-dh react-modal--center large-close-modal css-gbg9ls open open-active" style="display: none" id="card">
    <div class="large-close-modal__button-wrap">
        <button class="large-close-modal__button" type="button" aria-label="??????" id="cardOff" onclick="closeCard()">
            <svg class="icon" width="20" height="20" viewBox="0 0 20 20" fill="currentColor"
                preserveAspectRatio="xMidYMid meet">
                <path fill-rule="nonzero"
                    d="M11.6 10l7.1 7.1-1.6 1.6-7.1-7.1-7.1 7.1-1.6-1.6L8.4 10 1.3 2.9l1.6-1.6L10 8.4l7.1-7.1 1.6 1.6z">
                </path>
            </svg>
        </button>
    </div>
    <div class="react-modal__content-wrap-dhp">
        <div class="react-modal__content-dh large-close-modal__content css-j3o0no">
            <div>
                <div class="css-14zdccb e117nz2q0">
                    <div class="css-1iyim9j e117nz2q1">
                        ????????? ?????? ??????
                    </div>
                    <ul class="css-mptd3v ek2mcvu7">
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644031696528.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644031696528.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644031696528.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644031696528.png?w=360&amp;webp=1 3x">
                                    <img alt="NH??????" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644031696528.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644031696528.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644031696528.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644031696528.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~8??????</div>
                                </li>
                            </ul>
                        </li>
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644815773852.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644815773852.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644815773852.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644815773852.png?w=360&amp;webp=1 3x">
                                    <img alt="??????" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644815773852.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644815773852.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644815773852.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857644815773852.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~8??????</div>
                                </li>
                            </ul>
                        </li>
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639073958928.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639073958928.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639073958928.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639073958928.png?w=360&amp;webp=1 3x">
                                    <img alt="??????" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639073958928.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639073958928.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639073958928.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639073958928.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~7??????</div>
                                </li>
                            </ul>
                        </li>
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639841003188.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639841003188.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639841003188.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639841003188.png?w=360&amp;webp=1 3x">
                                    <img alt="KB??????" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639841003188.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639841003188.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639841003188.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857639841003188.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~7??????</div>
                                </li>
                            </ul>
                        </li>
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159859020023483136.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159859020023483136.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159859020023483136.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159859020023483136.png?w=360&amp;webp=1 3x">
                                    <img alt="?????? (??????)" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159859020023483136.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159859020023483136.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159859020023483136.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159859020023483136.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~8??????</div>
                                </li>
                            </ul>
                        </li>
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857641777698407.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857641777698407.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857641777698407.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857641777698407.png?w=360&amp;webp=1 3x">
                                    <img alt="??????" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857641777698407.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857641777698407.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857641777698407.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857641777698407.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~6??????</div>
                                </li>
                            </ul>
                        </li>
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642209219969.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642209219969.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642209219969.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642209219969.png?w=360&amp;webp=1 3x">
                                    <img alt="??????" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642209219969.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642209219969.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642209219969.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642209219969.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~7??????</div>
                                </li>
                            </ul>
                        </li>
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642751001668.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642751001668.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642751001668.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642751001668.png?w=360&amp;webp=1 3x">
                                    <img alt="??????" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642751001668.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642751001668.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642751001668.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857642751001668.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~7??????</div>
                                </li>
                            </ul>
                        </li>
                        <li class="css-123pl9e ek2mcvu6">
                            <div class="css-1mtix8y ek2mcvu5">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857643252178462.png?w=144&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857643252178462.png?w=180&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857643252178462.png?w=256&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857643252178462.png?w=360&amp;webp=1 3x">
                                    <img alt="??????" class="css-1pyg2ia ek2mcvu4"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857643252178462.png?w=144"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857643252178462.png?w=180 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857643252178462.png?w=256 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/credit_card/159857643252178462.png?w=360 3x">
                                </picture>
                            </div>
                            <ul class="css-17fh4sh ek2mcvu3">
                                <li class="css-1cl40jt ek2mcvu2">
                                    <div class="css-h28ltg ek2mcvu1">5?????? ?????? 2~4??????</div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="css-1w92t8m eg0d1fe3">
                    <h3 class="css-1l77w7v eg0d1fe2">????????????</h3>
                    <ul class="css-1fi14ev eg0d1fe1">
                        <li class="css-1w25a88 eg0d1fe0">??????????????? ????????? ????????? ?????? ?????? ??? ????????? ??? ????????????. ????????? ????????? ??? ????????? ??????????????? ?????? ????????????.
                        </li>
                        <li class="css-1w25a88 eg0d1fe0">??????/??????(???????????????)/??????/??????/?????????/???????????????/ ???????????? ?????? ??? ??????</li>
                        <li class="css-1w25a88 eg0d1fe0">?????????/??????????????? ?????? ???, ?????????/???????????? ?????? ??????.</li>
                        <li class="css-1w25a88 eg0d1fe0">???????????? ??????????????????, ?????????????????????, ??????????????????, ????????????(?????????), ???????????????, ?????????(????????????,?????????),
                            ??????(B2B), ?????????, ???????????????, ?????? ??? ??????</li>
                        <li class="css-1w25a88 eg0d1fe0">??????????????? PG?????? ??? ??????, ??????, ?????????, ?????? ??? ???????????? ??? ?????????????????? ??????</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ?????? ??? ???????????? ?????? ????????? ??? ????????? ????????? ??????-->
<div class="react-modal-dh react-modal--bottom production-selling-select-modal open open-active" id="smallbuy" style="display: none;">
    <div class="react-modal__content-wrap-dhp">
        <div class="react-modal__content-dh production-selling-select-modal__content" id="closesmallbuy">
            <span class="production-selling-select-modal__handle"></span>
            <section class="selling-option-form-content production-selling-select-modal__form">
                <div class="selling-option-form-content__form">
                    <div class="selling-option-select-input">
                        <div class="input-group select-input selling-option-select-input__option selling-option-select-input__option-1">
                            <select class="form-control empty selectThree_ dh_S" onchange="selected_fun(this)" id="selectThree">
                                <option value="" disabled=""selected=""  >${product[0].option1_name }</option>
                                	<c:forEach  var="i" begin="0" end="${fn:length(product)-1}">
                                    <option >${product[i].option1 }</option>
                                    </c:forEach>
                            </select><span class="select-input__icon"><svg class="icon" width="10" height="10"
                                    preserveAspectRatio="xMidYMid meet" style="fill: currentcolor;">
                                    <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                </svg></span></div>
                                <c:if test="${product[0].option2_name ne ''}">
                        <div
                            class="input-group select-input selling-option-select-input__option selling-option-select-input__option-2">
                            <select class="form-control empty selectThree dh_S" onchange="add_div(this,this)" id="selectThree_">
                                <option value="" disabled="" selected>${product[0].option2_name }</option>
                            </select><span class="select-input__icon"><svg class="icon" width="10" height="10"
                                    preserveAspectRatio="xMidYMid meet" style="fill: currentcolor;">
                                    <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                </svg></span></div></c:if>
                        <!-- <div
                            class="input-group select-input selling-option-select-input__option selling-option-select-input__option-extra">
                            <select class="form-control empty">
                                <option value="" disabled="">???????????? (??????)</option>
                                <option value="0">???????????? S ??????_????????? (HS01101) (14,000???)</option>
                                <option value="1">???????????? S ??????_????????? (HS01102) (14,000???)</option>
                                <option value="2">???????????? SS ????????????_????????? (HS01103) (14,000???)</option>
                                <option value="3">???????????? SS ????????????_????????? (HS01104) (14,000???)</option>
                                <option value="4">???????????? Q ???_????????? (HS01105) (18,000???)</option>
                                <option value="5">???????????? Q ???_????????? (HS01106) (18,000???)</option>
                                <option value="6">???????????? K ???_????????? (HS01107) (18,000???)</option>
                                <option value="7">???????????? K ???_????????? (HS01108) (18,000???)</option>
                                <option value="8">????????? ?????? ?????? ?????? ????????? SS (HI01002) (182,900???)</option>
                                <option value="9">????????? ?????? ?????? ?????? ????????? Q (HI01003) (222,900???)</option>
                            </select><span class="select-input__icon"><svg class="icon" width="10" height="10"
                                    preserveAspectRatio="xMidYMid meet" style="fill: currentcolor;">
                                    <path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
                                </svg>
                                </span>
                                </div> -->
                    </div>
                </div>
                <ul class="selling-option-form-content__list"></ul>
            </section>
            <p class="selling-option-form-content__price"><span
                    class="selling-option-form-content__price__left">????????????</span><span
                    class="selling-option-form-content__price__right"><span
                        class="selling-option-form-content__price__number">0</span>???</span></p>
            <div class="production-selling-select-modal__footer"><button
                    class="button button--color-gray-7 button--size-50 button--shape-4 production-selling-select-modal__footer__button"
                    type="button" onClick="basket()">????????????</button><button
                    class="button button--color-blue button--size-50 button--shape-4 production-selling-select-modal__footer__button"
                    type="submit" onClick="basket('buy')">????????????</button></div>
        </div>
    </div>
</div>
<script>
function basket(param){
		$.ajax({
			url:'basket_ajax.com',
			method:'post',
			data: JSON.stringify(option_arr),	
			contentType : 'application/json; charset=UTF-8',
			dataType : 'text',
			success : function(after){
				console.log(after);
				if(after == "error"){
					alert("?????? ????????? ????????? ??????????????????.");
				}else if(after == "123"){
					alert("????????? ??? ????????? ?????????.");
					location.href = '/house/login.com'; 
				}else if(param != null){
					//alert("????????????");
					page_move();
				}else if(after == "hi"){
					alert("??????????????? ??????????????? ???????????????.");
					header_load();
				}
			}
		})
}

function page_move(){
	var form_param ='<input type="hidden" name="Product_ID" value="'+ ${product[0].product_postid} +'%">';	
   	$("#actionForm").append(form_param);
    $("#actionForm").submit(); 
}





$('.production-selling-select-modal').click(function(e) { 
    if($(e.target).hasClass("react-modal__content-wrap-dhp")) {
        $('#smallbuy').css("display","none");

        } 
    });
    $('.production-selling-select-modal').click(function(e) { 
    if($(e.target).hasClass("production-selling-select-modal")) {
         $('#smallbuy').css("display","none");
        } 
    });
    
    var img = $(".production-selling-cover-image__list__btn");
    $(img).hover(function(){
        //console.log($(this).attr('aria-label'));
        var choice = $(this).attr('aria-label');
        var value = (choice*100-100)*-1;
        var target = $(".carousel_list");
        //target.css("transform" , 'translateX(-100%)');
        if(1 == choice){
            target.css("transform" , 'translateX(0%)');
        }else if(2 == choice){
            target.css("transform" , 'translateX(-100%)');
        }else if(3 == choice){
            target.css("transform" , 'translateX(-200%)');
        }else if(4 == choice){
            target.css("transform" , 'translateX(-300%)');
        }else if(5 == choice){
            target.css("transform" , 'translateX(-400%)');
        }
    });
  //?????? ????????? ????????????..
    $(function() {
     	var exlocation = $("#sidebar_js").offset().top; // ?????? ????????? ?????? ?????? ???  1122.9625244140625
        plus = $('.sticky-container').outerHeight() + 50; // ????????? 2??? ???
        $banner = $('.production-selling-sidebar');
    $(window).scroll(function(){
    	
        //console.log(exlocation);
    	size=$('.layout-footer').outerHeight();
        var location = $(window).scrollTop();
       // console.log(location + plus);
        var val = $(document).height() - $(window).height() - size;
        var grayBar = location-exlocation;
       if (location >= val){
            $('#sidebar_move').css('position', 'absolute');
            $('#sidebar_move').css('top', '');
                $('#sidebar_move').css('bottom', '0');
            
            }else if((grayBar+plus) > 0 ){
                $('#sidebar_move').css({'position': 'fixed', 'height': '589px', 'transition': 'top 0.1s ease 0s', 'top': '133px', 'width': '313.75px'});
                $('#sidebar_js1').css('height' , '589px');
            } else{
            $('#sidebar_move').css('position', 'relative');
            $('#sidebar_move').css('top', '0');
            $('#sidebar_move').css('bottom', '');
        }
        
        var pointer1 = $("#production-selling-review").offset().top;
        var pointer2 = $("#production-selling-question").offset().top;
        var pointer3 = $("#production-selling-delivery").offset().top;
        //console.log(location-pointer3);
        if((location - pointer3) > -1){
            var notchangeColor = $("#QuickBtn4");
            reset(notchangeColor);
        }else if((location - pointer2) > -1){
            var notchangeColor = $("#QuickBtn3");
            reset(notchangeColor);
        }else if((location - pointer1) > -1){
            var notchangeColor = $("#QuickBtn2");
            reset(notchangeColor);
        }else{
            var notchangeColor = $("#QuickBtn1");
            reset(notchangeColor);
        }
    });
});
    function coupon_down(){
    	$.ajax({
			url:'coupon_down.com',
			method:'post',
			data: JSON.stringify(),
			contentType : 'application/json; charset=UTF-8',
		  		dataType : 'text',
		  		success : function(result_Str){
		  			if(result_Str == "login_false"){
		  				alert("????????? ??? ?????? ???????????????.");
		  				location.href = 'http://localhost:8080/house/login.com';
		  			}else{
		  				console.log("?????? ?????? ??????");
		  			}
		  		}
		})
		$(".button--size-45").attr("disabled", true);
		$(".button--size-45").text("?????????");
    }
    </script>
    <form action="ProductPage.com" method="post" id="actionForm">
		</form>
</body>
</html>