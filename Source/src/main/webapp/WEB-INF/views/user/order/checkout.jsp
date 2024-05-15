<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>Danh mục</span>
						</div>
						<ul>
							<c:forEach var="item" items="${categories}">
								<li><a
									href="<c:url value="/product.htm?categoryId=${item.categoryId }"/>">${item.name }</a></li>
							</c:forEach>

						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<%@ include file="/WEB-INF/views/layouts/user/searchbox.jsp"%>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>+65 11.188.888</h5>
								<span>support 24/7 time</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="/assets/user/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Checkout</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Checkout</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<h4>Thông tin</h4>
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="row">
							<div class="col-lg-12">
								<div class="checkout__input">
									<p>Tên người mua hàng</p>
									<input class="text-dark" type="text" value="${user.getName()}"
										readonly>
								</div>
							</div>

						</div>
						<div class="checkout__input">
							<p>
								Address<span></span>
							</p>
							<input class="text-dark" type="text"
								value="${user.defaultAddress.getFullAddress() }" readonly>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>
										Phone<span></span>
									</p>
									<input class="text-dark" type="text"
										value="${user.phoneNumber }" readonly>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>
										Email<span></span>
									</p>
									<input class="text-dark" type="text" value="${user.email }"
										readonly>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-6 col-md-6">
						<form method="post">
							<div class="checkout__order">
								<h4>Đơn hàng</h4>
								<div
									class="checkout__order__products d-flex justify-content-between">
									Sản phẩm <span>Số lượng</span> <span>Thành tiền</span>
								</div>

								<ul>
									<c:set var="totalPrice" value="0" />
									<c:forEach var="item" items="${cart}">
										<c:set var="totalPrice"
											value="${totalPrice + item.product.getPrice() * item.quantity}" />
										<li class="d-flex justify-content-between">
											<p class="col-4 p-0">${item.product.getProductName()}</p> <span
											class="col-4  text-center">${ item.quantity}</span> <span
											class="col-4 p-0 text-right"><fmt:formatNumber
													value='${item.product.getPrice() * item.quantity}'
													type='currency' currencySymbol='đ' maxFractionDigits='0' /></span>
										</li>
									</c:forEach>

								</ul>
								<div class="checkout__order__subtotal">
									Tạm tính <span><fmt:formatNumber value='${totalPrice }'
											type='currency' currencySymbol='đ' maxFractionDigits='0' /></span>
								</div>
								<div class="checkout__order__total">
									Phí vận chuyển <span style="color: #1c1c1c;">20.000 đ</span>
								</div>
								<div class="checkout__order__total">
									Tổng <span><fmt:formatNumber
											value='${totalPrice + 20000 }' type='currency'
											currencySymbol='đ' maxFractionDigits='0' /></span>
								</div>

								<p>Chọn hình thức thanh toán</p>
								<div>
									<input type="radio" id="cod" name="paymentMethod" value="cod">
									<span class="checkmark"></span> <label for="cod"> Thanh
										toán khi nhận hàng </label>
								</div>
								<div>
									<input type="radio" id="banking" name="paymentMethod"
										value="banking"> <span class="checkmark"></span> <label
										for="banking"> Chuyển khoản</label>
								</div>
								<button type="submit" class="site-btn" id="paymentButton">Thanh toán</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
	<script src="<c:url value='/assets/user/js/checkoutHandle.js'/>"></script>
</body>

</html>