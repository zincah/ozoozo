<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:forEach items="${sellerSaleList }" var="sellerSale">
<tr class="content-table-content content-hover">
  <td class="content-table-content-text option-line">
    <input class="form-check-input form-check-input-margin check1" type="checkbox" value="" onclick="checkfunction()">
</td>
<td class="content-table-content-text option-line">${sellerSale.seller_id }</td>
<td class="content-table-content-text option-line">${sellerSale.company_name }</td>
<td class="content-table-content-text option-line">${sellerSale.representative }</td>
<td class="content-table-content-text option-line">${sellerSale.registration_num }</td>
<td class="content-table-content-text option-line">${sellerSale.quantity }</td>
<td class="content-table-content-text option-line">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${sellerSale.payment}" var="payment"/>
${payment }
</td>
   <td class="content-table-content-text option-line">
   	<fmt:formatNumber type="number" maxFractionDigits="3" value="${sellerSale.payment}" var="realpayment"/>
${realpayment }
</td>
<td class="content-table-content-text option-line">${sellerSale.fee }%</td>
<td class="content-table-content-text option-line">
  ${sellerSale.seller_status }
  </td>
</tr>
</c:forEach>