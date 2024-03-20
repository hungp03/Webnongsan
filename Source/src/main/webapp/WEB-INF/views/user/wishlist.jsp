<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="/assets/user/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Wishlist</h2>
						<div class="breadcrumb__option">
							<a href="<c:url value="/index.htm"/>">Home</a> <span>Wishlist</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">Products</th>
<!-- 									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th> -->
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty wishlist }">
									<c:forEach var="item" items="${wishlist }" varStatus="loop">
										<tr>
											<td class="shoping__cart__item"><img
												src="<c:url value="/assets/user/img/products/${item.product.image }"/>" alt="" style="width:100px">
												<h5>${item.product.productName }</h5></td>
											<td class="shoping__cart__item__close">
											<a href="<c:url value="/DeleteWishlist.htm?productId=${ item.product.productId}"/>"><span class="icon_close"></span></a></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- WIshlist Section End -->

</body>
