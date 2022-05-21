<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
<ul class="category_tree">

<c:forEach items="${otherlist }" var="other">
	<li class="category_entry">
		<div class="category_entry_header">
			<a id="${other[0].subcate_code }" class="category_entry_move subcate">${other[0].subcate_name }</a>
			
			<button class="category_entry_expand">
				<svg class="icon" width="12" height="12" fill="currentColor"
					viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
					<path
						d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
			</button>
			
		</div> <!--버튼 누르면 밑에 토글다운 생기게-->

		<div class="category_tree_child_layer" style="overflow: hidden;">
			<ul class="category_tree_children">
				<c:forEach items="${other }" var="smlist" begin="1">
				<li class="category_tree_children_entry">
					<a id="${smlist.subcate_code }" class="botcate">${smlist.subcate_name }</a>
					</li>
					</c:forEach>
				</ul>
			</div>
		</li>
	</c:forEach>

</ul>

<ul class="category_list_others">
	<c:forEach items="${toplist }" var="top">
	<li class="category_list_others_item"><a href="${top.cate_code }" class="movetitle">${top.cate_name }</a></li>
	</c:forEach>
</ul>