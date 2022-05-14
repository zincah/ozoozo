<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
				<input type="hidden" value="${totalcount}" id="totalcount">
                <!-- for -->
                <c:forEach items="${postList }" var="post">
	                <tr class="content-table-content content-hover">
	                  <td class="content-table-content-text option-line">
	                   	  <input type="hidden" value="${post.post_id }"/>
	                      <input class="check form-check-input form-check-input-margin" type="checkbox" value="" name="productcheckbox" onchange="checkfunction()"/>
	                  </td>
	                  <td class="content-table-content-text option-line">${post.company_name }</td>
	                  <td class="content-table-content-text option-line">
	                    <a href="#">${post.post_name }</a>
	                    </td>
	                  <td class="content-table-content-text option-line">${post.cate_name }</td>
	                  <td class="content-table-content-text option-line">${post.product_count }</td>
	                  <td class="content-table-content-text option-line">${post.subcate_name }</td>
	                  <td class="content-table-content-text option-line">
	                   <c:choose>
							<c:when test="${post.post_couponid != null}">
								${post.coupon_title }
								<input type="hidden" value="${post.post_couponid }">
							</c:when>
							<c:when test="${post.post_couponid != null}">-</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
	                  </td>
	                  <td class="content-table-content-text option-line">${post.product_created }</td>
					  <td class="content-table-content-text option-line">
					  	<c:choose>
								<c:when test="${post.deal_status != null}">${post.deal_status }</c:when>
								<c:when test="${post.deal_status == null}">-</c:when>
								<c:otherwise>-</c:otherwise>
						</c:choose>
					  </td>
	                  <td class="content-table-content-text option-line">
	                  	<c:choose>
							<c:when test="${post.best_product == true}">o</c:when>
							<c:when test="${post.best_product == false}">x</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
	                  </td>
	                  <td class="content-table-content-text option-line">${post.post_status }</td>
	                </tr>
				</c:forEach>
          