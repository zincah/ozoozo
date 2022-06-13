

function photoUpload(){
			
			var formData = new FormData();
		
			
			var mainFileInput = $(".main_photo");
			var fileInput = $(".thisisfile");
			
			for (var i = 0; i < mainFileInput.length; i++) {
				if (mainFileInput[i].files.length > 0) {
					for (var j = 0; j < mainFileInput[i].files.length; j++) {
						console.log(" mainFileInput[i].files[j] :::"+ mainFileInput[i].files[j]);
						
						// formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.  
						formData.append('mainfile', $('.main_photo')[i].files[j]);
					}
				}
			}
			
			for (var i = 0; i < fileInput.length; i++) {
				if (fileInput[i].files.length > 0) {
					for (var j = 0; j < fileInput[i].files.length; j++) {
						console.log(" fileInput[i].files[j] :::"+ fileInput[i].files[j]);
						
						// formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.  
						formData.append('file', $('.thisisfile')[i].files[j]);
					}
				}
			}
			

			
			$.ajax({
			      url: 'uploadPhotos.seller',
			      method:'post',
			      data: formData,
			      contentType: false,             
			      processData: false,              
			      async: false, 
			      success: function(resp) {
					alert("성공!");
					console.log(resp);
			      },
			      error: function(jqXHR){
			    	  alert(jqXHR.responseText);
			      }
			});
			
			
		
		}