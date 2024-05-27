<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="/assets/user/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Shopping Cart</h2>
						<div class="breadcrumb__option">
							<a href="<c:url value="/index.htm"/>">Home</a> <span>Shopping
								Cart</span>
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
			<c:if test="${not empty carts }">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">Products</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								
									<c:forEach var="item" items="${carts }" varStatus="loop">
										<tr>
											<td class="shoping__cart__item"><img
												src="<c:url value="/assets/user/img/products/${item.product.image }"/>"
												alt="" style="width: 100px">
												<h5>${item.product.productName }</h5></td>
											<td class="shoping__cart__price"><fmt:formatNumber
													value='${item.product.price }' type='currency'
													currencySymbol='đ' maxFractionDigits='0' /></td>
											<td class="shoping__cart__quantity">
												<div class="quantity">
													<div class="pro-qty" data-id="${item.product.productId }">

														<span class="dec qtybtn">-</span> <input type="text"
															value="${item.quantity }" readonly> <span
															class="inc qtybtn">+</span>

													</div>
												</div>
											</td>
											<td class="shoping__cart__total"><fmt:formatNumber
													value='${item.product.price * item.quantity}'
													type='currency' currencySymbol='đ' maxFractionDigits='0' /></td>
											<td class="shoping__cart__item__close"><a
												href="<c:url value="/DeleteCart.htm?productId=${ item.product.productId}"/>"><span
													class="icon_close"></span></a></td>
										</tr>
									</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6"></div>
				<div class="col-lg-6">
					<div class="shoping__checkout">
						<h5>Cart Total</h5>
						<ul>

								<li>Subtotal <span><fmt:formatNumber
											value='${totalPrice }' type='currency' currencySymbol='đ'
											maxFractionDigits='0' /></span></li>
								<li>Delivery fee<span><fmt:formatNumber
											value="15000" type="currency" currencySymbol="đ"
											maxFractionDigits="0" /></span></li>
								<li>Total <span><fmt:formatNumber
											value='${totalPrice + 15000 }' type='currency'
											currencySymbol='đ' maxFractionDigits='0' /></span></li>

						</ul>
						<a href="order/checkout.htm" class="primary-btn">THANH TOÁN</a>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${ empty carts}">
				<div class="row" style="text-align:center">
					<div class="col-lg-12">
						<h3 style="font-size:20px; color:gray">Giỏ hàng đang trống hãy bắt đầu mua sắm nào</h3>
					</div>
				</div>
			</c:if>
		</div>
	</section>
 	<!-- Shoping Cart Section End -->
<!--	<content tag="script"> <script>
		$(".pro-qty").on(
				"click",
				'.qtybtn',
				function() {
					var id = $(this).parent().data("id");
					var $button = $(this);
					var oldValue = parseFloat($button.parent().find('input')
							.val());
					var newVal;
					if ($button.hasClass('inc')) {
						newVal = oldValue + 1;
					} else {
						// Don't allow decrementing below zero
						if (oldValue > 0) {
							newVal = oldValue - 1;
						} else {
							newVal = 0;
						}
					}
					/* $button.parent().find('input').val(newVal); */
					window.location = "EditCart.htm?productId=" + id + "&qty="
							+ newVal;
				})
	</script> </content> -->
	<content tag="script">
		<script>
			$(".pro-qty").on("click", '.qtybtn',function(){
				var id = $(this).parent().data("id");
				var $button = $(this);
		        var oldValue = parseFloat($button.parent().find('input').val());
		        var newVal;
		        if ($button.hasClass('inc')) {
		            newVal = oldValue + 1;
		            window.location = "EditCart.htm?productId="+id+"&qty="+newVal;
		        } else {
		            // Don't allow decrementing below zero
		            if (oldValue > 1) {
		                newVal = oldValue - 1;
		                window.location = "EditCart.htm?productId="+id+"&qty="+newVal;
		            } else {
		                var confirmation = confirm("Số lượng hàng hóa hiện tại là 1. Bạn có muốn xóa sản phẩm khỏi giỏ hàng không?")
		                if(confirmation){
		                	window.location = "DeleteCart.htm?productId="+id;
		                }else{
		                	return;
		                }
		            }
		        }
		        /* $button.parent().find('input').val(newVal); */
		        
			}) 

		</script>
	</content>

</body>
