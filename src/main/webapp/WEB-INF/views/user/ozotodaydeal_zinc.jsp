<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="resources/css/user_css/zinc/ozotodaydeal.css?var=2" rel="stylesheet"/>
    <link href="resources/css/user_css/zinc/ozoper_photo_todeal.css?var=2" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>
$(document).ready(function(){
		
		$(".banner_link").click(function(e){
			e.preventDefault();
		});
	
		
		
		
	$(document).on("click",".b_blue",function(){
		var gun =  $(this).attr('id')
		
		
		
		
		
		
		/* var uid = sessionStorage.getItem('User_Num');
		console.log(uid)
		if(uid !=null){ */
			
		
		
		 $.ajax({
			url:"userscrap.com",
			type: 'post',
			data: JSON.stringify(gun),
			contentType:'application/json; charset=UTF-8',
			dataType: 'text',
			success: function(resp){
				setTimeout(function(){}, 400);
				$('#'+gun).find("#blue").css({fill:"#ff778e"});
				$('#'+gun).remove()
				$('#s_'+gun).append('<button class="item_bookmark b_none" id='+gun+'>'+
						'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon">'+
						'<defs>'+
 					    '<path id="scrap-icon-3-b" '+
						'		d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"&gt;'+
						'<filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox">'+
						'<feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>'+
						'<feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur>'+
						'<feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite>'+
						'<feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>'+
						'<filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox">'+
						'<feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur>'+
						'<feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>'+
						'<feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite>'+
						'<feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>'+
						'<g id="blue" fill="#ff778e" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)">'+
						'<use fill="#000" filter="url(#scrap-icon-3-a)"></use>'+
						'<use fill="#FFF" fill-opacity=".4"></use>'+
						'<use fill="#000" filter="url(#scrap-icon-3-c)"></use>'+
						'<path id="blueshadow" stroke="#ff778e" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>'+
						'</button>');
				console.log($('.b_none'));	
				
			}
			}) ;
		 
		/* }else{
			alert("로그인 해주세요");
		} */
			
	})
	
	 $(document).on("click",".b_none",function(){
		 var so =  $(this).attr('id')
			
		 /* 	var uid = sessionStorage.getItem('User_Num');
		 	console.log(uid)
		if(uid !=null){ */
			
			$.ajax({
				url:"scrapdelete.com",
				type: 'post',
				data: JSON.stringify(so),
				contentType:'application/json; charset=UTF-8',
				dataType: 'text',
				success: function(resp){
					setTimeout(function(){}, 400);
					$('#'+so).find("#blue").css({fill:"none"});
					$('#'+so).find("#blueshadow").css({stroke:"#FFF"})
					$('#'+so).remove()
					$('#s_'+so).append('<button class="item_bookmark b_blue" id='+so+'>'+
						'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon">'+
						'<defs>'+
 					    '<path id="scrap-icon-3-b" '+
						'		d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"&gt;'+
						'<filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox">'+
						'<feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>'+
						'<feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur>'+
						'<feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite>'+
						'<feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>'+
						'<filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox">'+
						'<feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur>'+
						'<feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>'+
						'<feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite>'+
						'<feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>'+
						'<g id="blue" fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)">'+
						'<use fill="#000" filter="url(#scrap-icon-3-a)"></use>'+
						'<use fill="#FFF" fill-opacity=".4"></use>'+
						'<use fill="#000" filter="url(#scrap-icon-3-c)"></use>'+
						'<path id="blueshadow" stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>'+
						'</button>');
					console.log($('#'+so));			
				}
				}) 
	/* 	}else{
			alert("로그인 해주세요");
		} */
	
		});  
	
	
	 
	});
    </script>
</head>
<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="container">
        <div class="todaydeal_title">
            오늘의딜
        </div>
        <div class="todaydeal_sub">
            매일 자정, 새로운 특가상품
        </div>


        <!-- 사진 영역 -->
        <div class="row">
           <c:forEach items="${todayDealList }" var="deal">
	               <div class="col-12 col-md-4 col-lg-3">
	                  <div class="deals_list_wrap">
	                  <c:choose>
	                                    <c:when test="${deal.checkit eq true}">
	                                   
	                                    <div class="item_timer b_${deal.post_id }" >
	                                    <div>1일 남음</div>
	                                    </div>
	                                    <div id="s_${deal.post_id}"></div>
	                                    <button class="item_bookmark b_none" id="${deal.post_id }" >
	                                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
	                                       height="24" viewBox="0 0 24 24" class="inactive-icon">
	                                    <defs>
	                                    <path id="scrap-icon-3-b"
	                                          d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path>
	                                    <filter id="scrap-icon-3-a" width="150%" height="150%"
	                                          x="-25%" y="-25%" filterUnits="objectBoundingBox">
	                                    <feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
	                                    <feGaussianBlur in="shadowOffsetOuter1"
	                                          result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur>
	                                    <feComposite in="shadowBlurOuter1" in2="SourceAlpha"
	                                          operator="out" result="shadowBlurOuter1"></feComposite>
	                                    <feColorMatrix in="shadowBlurOuter1"
	                                          values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>
	                                    <filter id="scrap-icon-3-c" width="150%" height="150%"
	                                          x="-25%" y="-25%" filterUnits="objectBoundingBox">
	                                    <feGaussianBlur in="SourceAlpha" result="shadowBlurInner1"
	                                          stdDeviation="1.5"></feGaussianBlur>
	                                    <feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>
	                                    <feComposite in="shadowOffsetInner1" in2="SourceAlpha"
	                                          k2="-1" k3="1" operator="arithmetic"
	                                          result="shadowInnerInner1"></feComposite>
	                                    <feColorMatrix in="shadowInnerInner1"
	                                          values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>
	                                    <g id="blue" fill="#ff778e" fill-rule="nonzero"
	                                                transform="matrix(1 0 0 -1 0 24)">
	                                    <use fill="#000" filter="url(#scrap-icon-3-a)" ></use>
	                                    <use fill="#FFF" fill-opacity=".4" ></use>
	                                    <use fill="#000" filter="url(#scrap-icon-3-c)" ></use>
	                                    <path id="blueshadow" stroke="#ff778e"
	                                                d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
	                                     </button>
	                                    </c:when>
	                                    <c:when test="${deal.checkit eq false}">
	                                    <div class="item_timer b_${deal.post_id }" >
	                                    <div>1일 남음</div>
	                                    </div>
	                                    <div id="s_${deal.post_id}"></div>
	                                    <button class="item_bookmark b_blue" id="${deal.post_id }"  >
	                                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
	                                       height="24" viewBox="0 0 24 24" class="inactive-icon">
	                                    <defs>
	                                     <path id="scrap-icon-3-b" >
	                                          d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path>
	                                    <filter id="scrap-icon-3-a" width="150%" height="150%"
	                                          x="-25%" y="-25%" filterUnits="objectBoundingBox">
	                                    <feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
	                                    <feGaussianBlur in="shadowOffsetOuter1"
	                                          result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur>
	                                    <feComposite in="shadowBlurOuter1" in2="SourceAlpha"
	                                          operator="out" result="shadowBlurOuter1"></feComposite>
	                                    <feColorMatrix in="shadowBlurOuter1"
	                                          values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>
	                                    <filter id="scrap-icon-3-c" width="150%" height="150%"
	                                          x="-25%" y="-25%" filterUnits="objectBoundingBox">
	                                    <feGaussianBlur in="SourceAlpha" result="shadowBlurInner1"
	                                          stdDeviation="1.5"></feGaussianBlur>
	                                    <feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>
	                                    <feComposite in="shadowOffsetInner1" in2="SourceAlpha"
	                                          k2="-1" k3="1" operator="arithmetic"
	                                          result="shadowInnerInner1"></feComposite>
	                                    <feColorMatrix in="shadowInnerInner1"
	                                          values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>
	                                    <g id="blue" fill="none" fill-rule="nonzero"
	                                          transform="matrix(1 0 0 -1 0 24)">
	                                    <use fill="#000" filter="url(#scrap-icon-3-a)"
	                                          ></use>
	                                    <use fill="#FFF" fill-opacity=".4"></use>
	                                    <use fill="#000" filter="url(#scrap-icon-3-c)"
	                                          ></use>
	                                    <path id="blueshadow" stroke="#FFF"
	                                          d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
	                                     </button>
	                                    </c:when>
	                                    </c:choose>
	                     <article class="deals_item">
	                     
	                        <a href="productPage.com?p=${deal.post_id }&deal=true" style="text-decoration: none; width: 100%;">
	                           <div class="deals_item_wrap">
	                              <div class="deals_item_pic_out">
	                                 <div class="deals_item_pic">
	                                    <div class="item_ani">
	                                       <img class="images" src="${deal.photo_url }">
	                                    </div>
	                                 </div>
	                       
	                                    
	                                
	                              </div>
	                              <div class="deals_item_content">
	                                 <div class="deals_item_header">
	                                    <span class="deals_item_header_brand">${deal.company_name }</span>
	                                    <span class="deals_item_header_name">${deal.post_name }</span>
	                                 </div>
	                                 <div class="deals_item_body_price">
	                                    <span class="sale_percent">${deal.deal_saleratio}%</span> <span
	                                       class="price">${deal.sale_price }</span>
	                                 </div>
	                                 <div class="deals_item_review">
	                                    <div class="review_icon">
	                                       <i class="fa-solid fa-star" style=""></i>
	                                    </div>
	                                    <div class="review_score">${deal.star_ratio }</div>
	                                 </div>
	                              </div>
	                           </div>
	                        </a>
	                     </article>
	                  </div>
	               </div>
	            </c:forEach>


        </div>
    </div>
    <footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>
</body>
</html>