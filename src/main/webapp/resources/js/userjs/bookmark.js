
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
						url:"userscrap.com",
						type: 'post',
						data: JSON.stringify(gun),
						contentType:'application/json; charset=UTF-8',
						dataType: 'text',
						success: function(resp){
							setTimeout(function(){}, 400);
							$('#'+gun).find("#blue").css({fill:"#ff778e"});
							$('#'+gun).remove()
							$('#s_'+gun).append('<button class="item_bookmark b_none" id='+gun+' >'+
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
							console.log($('#'+gun));	
							
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
					success: function(resp){
						setTimeout(function(){}, 400);
						$('#'+so).find("#blue").css({fill:"none"});
						$('#'+so).find("#blueshadow").css({stroke:"#FFF"})
						$('#'+so).remove()
						$('#s_'+so).append('<button class="item_bookmark b_blue" id='+so+' >'+
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
			}
			
		});
		
	
           
       

});
$(document).ready(function () {
            $(document).on("click",".b_blue",function () {
                const Toast = Swal.mixin({
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
                    
                    title: '스크랩 했다잉~'
                })
            });

        });
$(document).ready(function () {
	
	 $(document).on("click",".b_none",function () {
                const Toast = Swal.mixin({
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
