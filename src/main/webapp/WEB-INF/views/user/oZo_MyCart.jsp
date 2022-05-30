<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="resources/css/user_css/zinc/ozocart.css?var=2" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>

    
       
        window.onload = function(){
        	<c:forEach items="${cart_li}" var="result">
    		<c:if test="${result.cart_quantity < 10}">
    			$("#"+ ${result.cart_product}+"_S").val(${result.cart_quantity}).prop("selected",true);
    		</c:if>
    		</c:forEach>
        	$.ajax({
    			url:'pro_first.com',	
  		  		method:'post',
  		  		data: JSON.stringify(),
  		  		contentType : 'application/json; charset=UTF-8',
  		  		dataType : 'json',
  		  		success : function(pro_li){
  		  			pro_js = pro_li;
	  		  		$.ajax({
	  	    			url:'cart_first.com',	
	  	  		  		method:'post',
	  	  		  		data: JSON.stringify(),
	  	  		  		contentType : 'application/json; charset=UTF-8',
	  	  		  		dataType : 'json',
	  	  		  		success : function(cart_li){
	  	  		  			if(cart_li.length == 0){
	  	  		  				return;
	  	  		  			}
	  	  		  			cart_js = cart_li;
	  	  		  			product_price();	
	  	  		  		}	
	  	    		})
  		  		}	
    		})
        }
        /* for(i=0; i < pro_js.length; i++){
			if(pro_js[i].quantity < 10){
				console.log("순서3");
				$("#" + cart[i].cart_product + "_S").val(cart_js[i].cart_quantity) - 1).prop("selected",true);
			}
		} */
        
    </script>
	</head> 	 
<body>
	<script>
	$(function(){

        $(".modal_close", this).click(function(){
            $(".modal_layer").hide();
        });

        $(".carted_product_edit_btn").click(function(){
            $(".modal_layer").show();
        });

    });
	
	let pro_js = [];
    var cart_js = [];
    pro_id = [];
    function product_price(){
    	for(i=0; i < pro_js.length; i++){
    		//pro_id.push(pro_js[i].product_id);
    		comma = int_comma(pro_js[i].product_price * cart_js[i].cart_quantity);
    		$("#"+ pro_js[i].product_id + "_won").text(comma);
    	}
    	all_price();
    }
    function int_comma(Num){
		return Num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    function ea_change(this_class){
    	if($(this_class).val() > 999){
    		alert("수량이 너무 많습니다 전화로 문의해주세요.");
    		$(this_class).val(999);
    	}else if($(this_class).val() == ""){
    		alert("수량을 입력해주세요.");
    		return;
    	}
    	
    	ex = this_class.id.split("_");
    	if(ex[1] == "S"){
    		if($(this_class).val() == 10){
    			select_change(ex[0]);
    			return;
    		}
    	}
    	for(i=0; i < pro_js.length; i++){
    		if(ex[0] == pro_js[i].product_id){
    			won = int_comma(pro_js[i].product_price * (parseInt($(this_class).val())))
    			$("#"+ex[0]+"_won").text(won);
    			all_price();
    			DB_update(ex[0], this_class.value);
    			return;
    		}
    	}
    }
    function select_change(this_class){
    	var html = '<div class="selling-option-item__quantity '+ this_class +'_ID">\
    	<input type="number" pattern="[0-9]*" min="1" step="1" size="5" class="form-control option-count-input manual" id="'+ this_class +'_I" value="10" onInput="ea_change(this)"></div>';
    	$("." + this_class + "_SD").remove();
    	$("." + this_class + "_SSD").prepend(html);
    	ea = $("#"+this_class + "_I").val();
    	all_price();
    	DB_update(this_class, ea);
    }
    function DB_update(product_id, ea){
    	Str = product_id + "/" + ea;
    	$.ajax({
  			url:'update_cart.com',	
		  		method:'post',
		  		data: JSON.stringify(Str),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(final_price){
		  			console.log(final_price);
		  			pro_js = final_price;
		  			all_price();
		  		}	
  		})
    }
    function all_price(){
    	post = [];
    	for(i = 0; i < pro_js.length; i++){
   			Bln = $("#"+ pro_js[i].product_postid + "_check").is(':checked');
   			if(Bln){
   				if(post.includes(pro_js[i].product_postid)){
   	   			}else{
   	   				post.push(pro_js[i].product_postid);
   	   			}
			}	
   		}
    	var all_price = 0;
    	var sale_before = 0;
    	var sale_after = 0;
    	var shipfee = 0;
    	for(i=0; i < post.length; i++){
    		var Num = 0;
    		
    		for(j=0; j < pro_js.length; j++){
    			if(post[i] == pro_js[j].product_postid){
    				ExNum = parseInt($("#" + pro_js[j].product_id + "_won").text().replace(/,/gi , ""));
    				Num += parseInt(ExNum);
    				sale_before += parseInt(pro_js[j].whole_price * pro_js[j].cart_quantity);
    				sale_after += parseInt(pro_js[j].whole_price / 100 * (100 - pro_js[j].sale_ratio) * pro_js[j].cart_quantity);
    				shipfee += parseInt(pro_js[j].product_shipfee * pro_js[j].cart_quantity);
    			}
    		}
    		all_price += Num;
    		$("#" + post[i] +"_PP").text(int_comma(Num));
    	}
    	all_price += shipfee;
    	$(".shipfee").text(int_comma(shipfee));
    	$(".sale_before").text(int_comma(sale_before));
    	$(".sale_after").text(int_comma(sale_after));
    	$("#all_price").text(int_comma(all_price));
    }
    // 삭제 버튼
    function delete_post(this_class){
    	console.log(this_class.id);
    	N = this_class.id;
    	N = N.split("_");
    	delete_cart(N[0]);
    }
    function delete_pro(this_class){
    	N = this_class.id;
    	N = N.split("_");
    	delete_cart(N[0]);
    }
    function delete_cart(Num){
    	$("."+Num).remove();
    	$.ajax({
  			url:'delete_cart.com',	
		  		method:'post',
		  		data: JSON.stringify(Num),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(pro_li){
		  			location.reload();
		  		}	
  		})
    }
    function check_div(){
    	if($(".check_input").is(':checked')){
    		$("._3UImz").prop('checked',true);
    	}else{
    		$("._3UImz").prop('checked',false);
    	}
    }
    function check(this_class){
    	product_count = 0;
    	Bln_ = false;
   		for(i = 0; i < pro_js.length; i++){
   			Bln = $("#"+ pro_js[i].product_postid + "_check").is(':checked');
   			if(Bln){
   				product_count++;
			}else{
				Bln_ = true;
			} 		
   		}
   		$(".cart_order_btn").text(product_count +"개 상품 구매 하기");
   		all_price();
   		if(Bln_){
   			$(".check_input").prop('checked',false);
   			return;
   		}
   		$(".check_input").prop('checked',true);
    }
    function check_delete(){
   	check_li = [];
    	for(i = 0; i < post.length; i++){
			Bln = $("#"+ post[i] + "_check").is(':checked')
			if(Bln){
				check_li.push(post[i]);
			} 		
		}
    	if(check_li.length < 1){
    		alert("선택된 항목이 없습니다.");
    	}else if(check_li.length == 1){
    		delete_cart(check_li[0]);
    	}else{
    		$.ajax({
      			url:'delete_cart_check.com',	
    		  		method:'post',
    		  		data: JSON.stringify(check_li),
    		  		contentType : 'application/json; charset=UTF-8',
    		  		dataType : 'json',
    		  		success : function(){
    		  			location.reload();
    		  		}	
      		})
    	}
    }
    function payment(){
   	 var param_Str = "";
   	 console.log(post);
   	 if(post.length == 0){
   		 alert("구매하실 상품을 선택해 주세요.");
   		 return;
   	 }
   	for(i = 0; i < post.length; i++){
		if(Bln = $("#"+ post[i] + "_check").is(':checked')){
			param_Str += post[i];
			if(i != post.length - 1 ){
				param_Str +=  "%";
			}
		}
	}
   	console.log(param_Str);
   	var form_param ='<input type="hidden" name="Product_ID" value="'+ param_Str +'">';	
   	$("#actionForm").append(form_param);
    $("#actionForm").submit(); 
    }
	</script>
    <div class="header">
        <jsp:include page="./header/OzoH.jsp"></jsp:include>
    </div>

    	<c:choose>
    	<c:when test="${seller_li.size() ne 0 }">
    	<div class="cart_wrap">
        <div class="container">
            <div class="row">

                <div class="cart_main_bar col-12 col-md-7 col-lg-8">
                    <div class="cart_main_content">
                        <div class="cart_main_content_header">
                            <span class="cart_main_content_header_left">
                                <div class="check_box_wrap">
                                    <input type="checkbox" class="check_input" value checked onClick="check_div()">
                                    <span class="check_input_deco">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg>
                                    </span>
                                </div>
                                <div class="header_left_title">
                                    모두선택
                                </div>
                            </span>
                            <span class="cart_main_content_header_right">
                                <button class="cart_product_delete" onClick="check_delete()">선택삭제</button>
                            </span>
                        </div>
                        <ul class="cart_main_content_list all_pro">
                            <!-- 다른 브랜드 for 문 : 장바구니 -->
                            <c:forEach var="i" begin="0" end="${fn:length(seller_li)-1 }">
                            <li class="cart_main_content_group">
                                <article class="content_group">
                                    <div class="cart_group_header">${seller_li[i].company_name }</div>
                                        <c:forEach var="j" begin="0" end="${fn:length(post_li)-1}">
                                        	<c:if test="${seller_li[i].seller_id eq post_li[j].post_sellerid }">
                                        	<c:set var="post_id" value="${post_li[j].post_id }"/>
                                        		<ul class="cart_group_delivery_list ${post_li[j].post_id }">
                                        			<li class="cart_group_delivery_list_item ${post_li[j].post_id }">
                                           				 <article class="cart_group_delivery_list_item_wrap">
                                        					 <div class="carted_product">
                                                				<div class="carted-product__select">
                                                					<div class="_3zqA8">
                                                						<input type="checkbox" class="_3UImz" id="${post_li[j].post_id}_check" value="" checked="" onClick="check(this)">
                                               							<span class="_2mDYR">
                                               								<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
                                               									<path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path>
			                                                				</svg>
			                                                			</span>
			                                                		</div>
			                                                	</div>
                                                    			<a href="#" class="carted_product_link">
                                                        			<div class="product_image">
                                                           				<img src="${post_li[j].photo_url }">
                                                        			</div>
                                                        		<div class="product_info">
                                                            <div class="product_info_title">[${seller_li[i].company_name}]${post_li[j].post_name}</div>
                                                     
                                                            <p class="product_info_delivery">무료배송&nbsp;|&nbsp;화물택배</p>
                                                        </div>
                                                    </a>
                                                    <button class="delete_product" type="button" id="${post_li[j].post_id }_B" onclick="delete_post(this)">
                                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                    </button>
                                                     <ul class="carted_product_option_list">
                                                    <c:forEach var="f" begin="0" end="${fn:length(pro_li)-1}">
                                                    <c:if test="${post_id eq pro_li[f].product_postid }">
                                                    <li class="carted_product_option_list_item ${pro_li[f].product_id}" >
                                                            <article class="option_item">
                                                                <div class="option_item_name">
																	<c:choose>
																		<c:when test="${pro_li[f].option2 ne ''}">
																		${pro_li[f].option1} / ${pro_li[f].option2}
																		</c:when>
																		<c:otherwise>
																		${pro_li[f].option1}
																		</c:otherwise>
																	</c:choose>
																</div>
                                                                <button class="option_item_delete" id="${pro_li[f].product_id}_B" onClick="delete_pro(this)">
                                                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
                                                                </button>
                                                                <div class="option_item_control ${pro_li[f].product_id}_SSD">
                                                                	<c:choose>
                                                                		<c:when test="${cart_li[f].cart_quantity < 10 }" >
		                                                                    <div class="option_item_count ${pro_li[f].product_id}_SD">
		                                                                        <select class="form_control"id="${pro_li[f].product_id}_S" onChange="ea_change(this)">
		                                                                            <option value="1">1</option>
		                                                                            <option value="2">2</option>
		                                                                            <option value="3">3</option>
		                                                                            <option value="4">4</option>
		                                                                            <option value="5">5</option>
		                                                                            <option value="6">6</option>
		                                                                            <option value="7">7</option>
		                                                                            <option value="8">8</option>
		                                                                            <option value="9">9</option>
		                                                                            <option value="10">+10</option>
		                                                                        </select>
		                                                                        <span class="select-input__icon">
		                                                                        <svg class="icon" width="10" height="10" style="fill:currentColor" preserveAspectRatio="xMidYMid meet">
		                                                                        <path fill-rule="evenodd" d="M0 3l5 5 5-5z">
		                                                                        </path>
		                                                                        </svg>
		                                                                        </span>
		                                                                    </div>
                                                                   		 </c:when>
                                                                   		<c:otherwise>
	                                                                    <div class="selling-option-item__quantity ${pro_li[f].product_id}_ID">
	                                                                    	<input type="number" pattern="[0-9]*" min="1" step="1" size="5" class="form-control option-count-input manual" id="${pro_li[f].product_id}_I" value="${cart_li[f].cart_quantity}" onInput="ea_change(this)">
	                                                                    </div>
                                                                    </c:otherwise>
                                                                    </c:choose>
                                                                    <div class="option_item_price">
                                                                        <span class="option_item_price_here" id="${pro_li[f].product_id}_won"></span>
                                                                        원
                                                                    </div>
                                                                </div>
                                                            </article>
                                                        </li>
                                                        </c:if>
                                                    </c:forEach>
                                                    </ul>
                                                    <div class="carted_product_footer">
                                                        <div class="carted_product_footer_left">
                                                            <button class="carted_product_edit_btn" type="button">옵션변경</button>
                                                            <button class="carted_product_order_only_btn" type="button">바로구매</button>
                                                        </div>
                                                        <div class="carted_product_footer_right">
                                                            <span class="carted_product_subtotal" id="${post_li[j].post_id}_PP">179,000</span>
                                                            원
                                                        </div>
                                                    </div>
                                                </div>
												<footer class="delivery_group_footer">
                                                    <div class="delivery_group_footer_text">
                                                    	<c:choose>
                                                    		<c:when test="${post_li[j].post_shipfee eq 0}">
                                                    			배송비 무료
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			개당 ${post_li[j].exStr } 원
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    </div>
                                                </footer>
                                        		</ul>
                                        	</c:if>
                                        </c:forEach>
								</article>
							</li>    
							</c:forEach>
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
                                        <span class="number sale_before"></span>
                                        원
                                    </dd>
                                </div>
                                <div class="cart_summary_row">
                                    <dt>총배송비</dt>
                                    <dd>
                                        +
                                        <span class="number shipfee"></span>
                                        원
                                    </dd>
                                </div>
                                <div class="cart_summary_row">
                                    <dt>총할인금액</dt>
                                    <dd>
                                        -
                                        <span class="number sale_after"></span>
                                        원
                                    </dd>
                                </div>
                                <div class="cart_summary_row cart_summary_row_total">
                                    <dt>결제금액</dt>
                                    <dd>
                                        <span class="number" id="all_price"></span>
                                        원
                                    </dd>
                                </div>
                            </div>
                            
                            <div class="cart_order">
                                <button class="cart_order_btn btn_layer" onClick="payment()">
                                    ${pro_li.size()}개 상품 구매 하기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </c:when>
        <c:otherwise>
        <div class="commerce-cart-empty">
        <div class="commerce-cart-empty__content">
        	<img class="commerce-cart-empty__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/assets/163703569663018673.png" alt="장바구니가 비었습니다.">
        		<a class="button button--color-blue button--size-50 button--shape-4 commerce-cart-empty__content__button" href="main.com">
        		상품 담으러 가기
        		</a>
        	</div>
        	</div>
        </c:otherwise>
        </c:choose>
		<form action="cart_payment.com" method="post" id="actionForm">
		<input type="hidden" name="cart_param" value="true">
		</form>
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
                                <img src="#">
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