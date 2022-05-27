
$(document).ready(function(){
	
	
	$(document).on("click",".b_blue",function(){
			var User_Num = '';
			var gun =  $(this).attr('id')
			$.ajax({
				url: 'memberSessionCheck.com',
				type : 'post',
				contentType:'application/json; charset=UTF-8',
				datatype : 'int',
				async :false,
				success : function(result){
					User_Num = result;
					
				},
				error : function(xhr, status,error){
					console.log(xhr)
					console.log(status)
					console.log(error)
					alert('ajax error');
				}
			});
			
			
			if(User_Num == 0 || User_Num == 'null'){
				var relogin = confirm('로그인이 필요합니다 확인시 로그인 창으로 이동됩니다 '+ '\n' +'취소시 현재 창이 유지 됩니다.')
				if(relogin){
					location.href ='/house/login.com';
					
					
				}
			}else{
				console.log(gun)
				
					 $.ajax({
						url:"userscrapdetail.com",
						type: 'post',
						data: JSON.stringify(gun),
						contentType:'application/json; charset=UTF-8',
						dataType: 'text',
						success: function(w){
							setTimeout(function() { }, 400);
					if(w=="1"){
//					
					$('#' + gun).remove()
					$('#s_' + gun).append('<button id="'+gun+'" class="production-selling-header__action__button production-selling-header__action__button-scrap b_none" type="button">' +
						'<svg class="icon--stroke" aria-label="스크랩" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">' +
						'<path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path>' +
						'</svg>' +
						'</button>');
						$(".production-selling-header__action__button>.icon--stroke").css({ fill: "#ff778e",stroke: "#ff778e" })
							console.log($('#'+gun));
				
								 
		                let Toast = Swal.mixin({
		                    toast: true,
		                    position: 'bottom',
		                    showConfirmButton: false,
		                    timer: 3000,
		                    timerProgressBar: true,
							background: '#ffb0bd',
		                    didOpen: (toast) => {
		                        toast.addEventListener('mouseenter', Swal.stopTimer)
		                        toast.addEventListener('mouseleave', Swal.resumeTimer)
		                    }
		                })
		
		                Toast.fire({
		                    
		                    title: '스크랩 했다잉~ '
		                })
		          

		
							}else if(w=="0"){
								
		                let Toast = Swal.mixin({
		                    toast: true,
		                    position: 'bottom',
		                    showConfirmButton: false,
		                    timer: 3000,
		                    timerProgressBar: true,
							background: '#ffb0bd',
		                    didOpen: (toast) => {
		                        toast.addEventListener('mouseenter', Swal.stopTimer)
		                        toast.addEventListener('mouseleave', Swal.resumeTimer)
		                    }
		                })
		
		                Toast.fire({
		                    
		                    title: '이미 스크랩 한 게시물입니다 '
		                })

							}	
							
						}
						}) ;
					
					}
										
				
				   
				
			
		});
		
		$(document).on("click",".b_none",function(){
			var User_Num = '';
			var so =  $(this).attr('id')
			$.ajax({
				url: 'memberSessionCheck.com',
				type : 'post',
				contentType:'application/json; charset=UTF-8',
				datatype : 'int',
				async :false,
				success : function(result){
					User_Num = result;
				},
				error : function(xhr, status,error){
					console.log(xhr)
					console.log(status)
					console.log(error)
					alert('ajax error');
					
				}
			});
			
			
			if(User_Num == '' || User_Num == 'null'){
				var relogin = confirm('로그인이 필요합니다 확인시 로그인 창으로 이동됩니다 '+ '\n' +'취소시 현재 창이 유지 됩니다.')
				if(relogin){
					location.href ='/house/login.com';
					
					
				}
			}else{
				console.log(so)
		
			 
				$.ajax({
					url:"scrapdelete.com",
					type: 'post',
					data: JSON.stringify(so),
					contentType:'application/json; charset=UTF-8',
					dataType: 'text',
					success: function(qw){
						
						setTimeout(function(){}, 400);
						
						if(qw=="1"){
						setTimeout(function() { }, 400);
					$('#' + so).remove()
					$('#s_' + so).append('<button id="'+so+'" class="production-selling-header__action__button production-selling-header__action__button-scrap b_blue" type="button">' +
						'<svg class="icon--stroke" aria-label="스크랩" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">' +
						'<path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path>' +
						'</svg>' +
						'</button>');
					console.log($('#' + so));
						
						$(document).ready(function () {	
							$(document).load("click",".b_none",function () {
		
				            let Toast = Swal.mixin({
				                toast: true,
				                position: 'bottom',
				                showConfirmButton: false,
				                timer: 3000,
				                timerProgressBar: true,
								background: '#ffb0bd',
				                didOpen: (toast) => {
				                    toast.addEventListener('mouseenter', Swal.stopTimer)
				                    toast.addEventListener('mouseleave', Swal.resumeTimer)
				                }
				            })
				
				            Toast.fire({
				                
				                title: '스크랩 해제 했다잉~'
				            })
				        });
						
						 });
						}else if(qw =="0" ){
							
						$(document).ready(function () {		
							$(document).load("click",".b_none",function () {
		               		 let Toast = Swal.mixin({
		                    toast: true,
		                    position: 'bottom',
		                    showConfirmButton: false,
		                    timer: 3000,
		                    timerProgressBar: true,
							background: '#ffb0bd',
		                    didOpen: (toast) => {
		                        toast.addEventListener('mouseenter', Swal.stopTimer)
		                        toast.addEventListener('mouseleave', Swal.resumeTimer)
		                    }
		                })
		
		                Toast.fire({
		                    
		                    title: '이미 해제 한 게시물입니다 '
		                })
		            });
 		});

						}
						
						
						
									
					}
					
					
					}) 
					
					
			}
				
			
		});
		
	
           
       

});
