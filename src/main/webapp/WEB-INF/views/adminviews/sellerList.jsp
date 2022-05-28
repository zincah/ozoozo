<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach items="${sellerList }" var="seller">
<tr class="content-table-content content-hover">
  <td class="content-table-content-text option-line">
    <input type="hidden" value="${seller.seller_id }"/>
	<input class="check form-check-input form-check-input-margin" type="checkbox" value="" name="sellerCheckBox" onchange="checkfunction()"/>
 </td>
 <td class="content-table-content-text option-line">${seller.seller_id }</td>
<td class="content-table-content-text option-line"><button class="btn getSellerInfo" style="width: 100%;" value="${seller.seller_id }">${seller.company_name }</button></td>
<td class="content-table-content-text option-line">${seller.representative }</td>
<td class="content-table-content-text option-line">${seller.shop_tell }</td>
<td class="content-table-content-text option-line">${seller.registration_num }</td>
<td class="content-table-content-text option-line">
<fmt:formatDate value="${seller.entry_date}" pattern="yyyy-MM-dd HH:mm" />
</td>
<td class="content-table-content-text option-line">${seller.brandstar }</td>
<td class="content-table-content-text option-line">${seller.seller_status }</td>
</tr>
</c:forEach>

