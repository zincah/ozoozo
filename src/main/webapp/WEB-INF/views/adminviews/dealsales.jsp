<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${dealList }" var="deal">
	<tr class="content-table-content content-hover">
	  <td class="content-table-content-text option-line">
	    <input class="check3 form-check-input form-check-input-margin" type="checkbox" value="" name="dealcheckbox" onchange="checkfunction()"/>
	  </td>
	  <td class="content-table-content-text option-line">${deal.post_id }</td>
	  <td class="content-table-content-text option-line">${deal.company_name }</td>
	  <td class="content-table-content-text option-line">${deal.post_name }</td>
	  <td class="content-table-content-text option-line">${deal.cate_name }</td>
	  <td class="content-table-content-text option-line">${deal.payment } 원</td>
	  <td class="content-table-content-text option-line">${deal.quantity }</td>
	  <td class="content-table-content-text option-line">
	  	<fmt:formatDate value="${deal.deal_time }" pattern="yyyy-MM-dd HH:mm" />
	  </td>
	  <td class="content-table-content-text option-line">
	  	<fmt:formatDate value="${deal.deal_endtime }" pattern="yyyy-MM-dd HH:mm" />
	  </td>
	  <td class="content-table-content-text option-line">${deal.deal_status }</td>
	</tr>
</c:forEach>