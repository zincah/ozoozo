<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="color_option mt-3 row">
	<c:forEach items="${wholeList }" var="perList" begin="0">
	<div class="col-2 option_title status-name-600 checkTitle" style="font-size: 13px" id="${perList[0].filter_id }">${perList[0].filter_name }</div>
	<div class="col-10 color_options" style="padding-bottom: 1rem;">
		<c:forEach items="${perList }" var="item" begin="1">
		<div class="form-check form-check-display">
			<input class="form-check-input form-check-input-margin checking"
				type="checkbox" value="${item.filter_id }" id="${item.filter_id }" name="${perList[0].filter_name }"/> 
				<label class="form-check-label" for="${item.filter_id }"> ${item.filter_name }
			</label>
		</div>
		</c:forEach>
	</div>
</c:forEach>
</div>
					