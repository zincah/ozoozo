<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
<script>

	function goajax(){
		
		$.ajax({
	  		url:'testtest.admin',
	  		method:'post',
	  		data: JSON.stringify("전송"),
	  		dataType : 'json',
	  		contentType: false, 
	  		processData: false, 
	  		cache : false,
	  		success : function(resp){
	  			
	  			console.log("hi");
	  			console.log(resp);
	  			$("#test").html(resp);
	  		},
	  		error : function(jqXHR, testStatus, errorThrown){
	  			console.log(testStatus);
	  			console.log(errorThrown)
	  		}
		});
		
	}


</script>
</head>
<body>

	hi
	<div id="test">
	
	</div>
	
	<button type="button" onclick="goajax()">전송</button>

</body>
</html>