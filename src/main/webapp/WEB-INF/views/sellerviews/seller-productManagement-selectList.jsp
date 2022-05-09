<c:forEach var="selectProductListView" items="${selectProductListView}">
	<tr class="content-table-content content-hover">
		<td class="content-table-content-text option-line state0">${selectProductListView.getProduct_id()}</td>
		<td class="content-table-content-text option-line">${selectProductListView.getProduct_seller_code()}</td>
		<td class="content-table-content-text option-line">${selectProductListView.getProduct_title()}</td>
		<td class="content-table-content-text option-line"><fmt:formatNumber
				value="${selectProductListView.getProduct_price()}" type="currency" /></td>
		<td class="content-table-content-text option-line">${selectProductListView.getCategory_name()}</td>
		<td class="content-table-content-text option-line">${selectProductListView.getStatus()}</td>
		<td class="content-table-content-text option-line">${selectProductListView.getProduct_quantity()}</td>
		<td class="content-table-content-text option-line"><fmt:formatDate
				value="${selectProductListView.getProduct_created()}"
				pattern="yyyy-MM-dd HH:mm" /></td>
		<td class="content-table-content-text option-line"><fmt:formatDate
				value="${selectProductListView.getProduct_updated()}"
				pattern="yyyy-MM-dd HH:mm" /></td>
	</tr>
</c:forEach>