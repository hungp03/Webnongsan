<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
@import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);

.card-no-border .card {
	border: 0px;
	border-radius: 4px;
	-webkit-box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.05);
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.05)
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem
}

.comment-widgets .comment-row:hover {
	background: rgba(0, 0, 0, 0.02);
	cursor: pointer;
}

.comment-widgets .comment-row {
	border-bottom: 1px solid rgba(120, 130, 140, 0.13);
	padding: 15px;
}

.comment-widgets {
	display: flex
}

.comment-text:hover {
	visibility: hidden;
}

.comment-text:hover {
	visibility: visible;
}

.label {
	padding: 3px 10px;
	line-height: 13px;
	color: #ffffff;
	font-weight: 400;
	border-radius: 4px;
	font-size: 75%;
}

.round img {
	border-radius: 100%;
}

.label-info {
	background-color: #1976d2;
}

.label-success {
	background-color: green;
}

.label-danger {
	background-color: #ef5350;
}

.action-icons a {
	padding-left: 7px;
	vertical-align: middle;
	color: #99abb4;
}

.action-icons a:hover {
	color: #1976d2;
}

.mt-100 {
	margin-top: 100px
}

.mb-100 {
	margin-bottom: 100px
}

.comment-footer .date {
	margin-right: 10px
}

.comment-text h5 {
	padding-top: 5px
}

.comment-widgets img {
	height: 40px !important;
	width: 40px !important;
}

.product__details__quantity input[type=number]::-webkit-outer-spin-button,
	.product__details__quantity input[type=number]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.product__details__quantity input[type=number] {
	-moz-appearance: textfield;
	appearance: textfield;
	width: 50px;
	text-align: center;
}

.product__details__quantity .pro-qty button {
	background-color: #6f6f6f26;
	border: none;
	padding: 10px 15px;
	cursor: pointer;
	font-size: 16px;
}

.primary-btn:disabled {
	cursor: not-allowed;
	opacity: 0.7;
}
</style>
</head>
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
								<h5>${company.phoneNumber }</h5>
								<span>Hỗ trợ 24/7</span>
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
						<h2>Organi Shop</h2>
						<div class="breadcrumb__option">
							<a href="<c:url value="/index.htm" />">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="<c:url value="/assets/user/img/products/${product.image }"/>"
								alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${product.productName }</h3>
						<div class="product__details__rating"
							style="display: flex; align-items: center; line-height: 1.2;">
							<div
								style="display: flex; align-items: end; padding: 0 15px 0 0;">
								<div
									style="color: #ee4d2d; border-bottom: 1px solid #ee4d2d; font-size: 1rem; margin-right: 5px">${product.ratingStar}</div>
								<c:set var="countStar" value="0"></c:set>
								<c:forEach begin="1" end="${product.ratingStar }">
									<i class="fa fa-star"
										style="font-size: 16px; height: 17px; width: 18px;"></i>
									<c:set var="countStar" value="${countStar + 1 }"></c:set>
								</c:forEach>
								<c:if test="${product.ratingStar > countStar }">
									<i class="fa fa-star-half-o"
										style="font-size: 16px; height: 17px; width: 18px;"></i>
								</c:if>

							</div>
							<div
								style="display: flex; border-left: 1px solid rgba(0, 0, 0, .14); align-items: end;; padding: 0 15px">
								<span
									style="color: #555; border-bottom: 1px solid #555; font-size: 1rem; margin-right: 5px">${product.reviews }</span>
								<span style="color: #555;">Đánh giá</span>
							</div>
						</div>

						<div class="product__details__price">
							<c:set var="formattedPrice">
								<fmt:formatNumber value="${product.price}" type="number"
									maxFractionDigits="0" />
							</c:set>
							${formattedPrice}đ
						</div>
						<div style="display: flex; align-items: center;">
						<!-- method="post" style="display: inline-block;" -->
							<form action="AddCart.htm?productId=${product.productId }"
								method="post" style="display: flex;"
								onsubmit="return validateQuantity()">
								<div class="product__details__quantity">
									<div class="quantity">
										<div class="pro-qty">
											<button type="button" onclick="changeQuantity(-1)">-</button>
											<input id="quantity" name="quantity" type="number" min="1"
												step="1" value="1" oninput="validateInput(event)">
											<button type="button" onclick="changeQuantity(1)">+</button>
										</div>
									</div>
								</div>
								<c:if test="${product.quantity <= 0}">
									<c:set var="btn_disable" value="disabled"></c:set>
								</c:if>
								<button type="submit" class="primary-btn" ${btn_disable}
									style="border: none">THÊM VÀO GIỎ</button>
							</form>

							<!-- <a class="heart-icon"><span class="icon_heart_alt">
						</span></a> --><form></form>
							<form method="post"
								action="AddWishlist.htm?productId=${product.productId }">
								<button style="border: none; background-color: transparent;">
									<a class="heart-icon"><span class="icon_heart_alt">
									</span></a>
								</button>
							</form>
						</div>
						<ul>
							<li><b>Đơn vị: </b> <span>${product.unit }</span></li>
							<c:if test="${product.quantity > 0}">
								<li><b>Tồn kho: </b> <span>${product.quantity }</span></li>
							</c:if>
							<c:if test="${product.quantity <= 0}">
								<li style="color: #dd2222"><span>Sản phẩm hết hàng</span></li>
							</c:if>
						</ul>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(${feedbacks.size() })</span></a>
							</li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Thông tin sản phẩm</h6>
									<div class="product-feedback-list">${product.detail }</div>
								</div>
							</div>
							<!--  Section đánh giá comment sản phẩm  -->
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Đánh giá</h6>
									<div class="d-flex comment-row" style="flex-direction: column">
										<c:forEach var="item" items="${feedbacks }" varStatus="loop">
											<div class="comment-widgets m-b-20">
												<div class="p-2">
													<span class="round"> <img
														src="<c:url value="/assets/user/img/account/${item.account.avatar }"/>"
														alt="User photo" class="user-nav__user-photo">
													</span>
												</div>
												<div class="comment-text w-100 active">
													<h5>${item.account.getName() }</h5>
													<span class="label label-success">Đã mua hàng</span>
													<div>
														<c:set var="countStar" value="0"></c:set>
														<c:forEach begin="1" end="${item.ratingStar }">
															<i class="fa fa-star"
																style="font-size: 16px; height: 17px; width: 18px; margin-right: -2px; color: #EDBB0E;"></i>
															<c:set var="countStar" value="${countStar + 1 }"></c:set>
														</c:forEach>
														<c:if test="${item.ratingStar > countStar }">
															<i class="fa fa-star-half-o"
																style="font-size: 16px; height: 17px; width: 18px;"></i>
														</c:if>
													</div>
													<div class="comment-footer">
														<span class="date"><fmt:formatDate
																pattern="dd-MM-yyyy HH:mm" value="${item.postingDate }" /></span>
														<span class="action-icons"> </span>
													</div>
													<p class="m-b-5 m-t-10">${item.feedbackContent }</p>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>Related Product</h2>
					</div>
				</div>
			</div>
			<div class="product__details__pic__slider owl-carousel">
				<c:forEach var="item" items="${relatedProducts }" varStatus="loop">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="<c:url value="/assets/user/img/products/${item.image }"/>">
							<ul class="product__item__pic__hover">
								<li>
									<%-- <a
									href="<c:url value="/AddWishlist.htm?productId=${item.productId }"/>"><i
										class="fa fa-heart"></i></a> --%>
									<form method="post"
										action="AddWishlist.htm?productId=${item.productId }">
										<button style="border: none; background-color: transparent;">
											<a><i class="fa fa-heart"></i></a>
										</button>
									</form>
								</li>
								<li><a
									href="<c:url value="/product-detail.htm?productId=${item.productId }"/>"><i
										class="fa fa-retweet"></i></a></li>
								<li>
									<%-- <a
									href="<c:url value="/AddCart.htm?productId=${item.productId }"/>"><i
										class="fa fa-shopping-cart"></i></a> --%>
									<form method="post"
										action="AddCart.htm?productId=${item.productId }">
										<button style="border: none; background-color: transparent;">
											<a><i class="fa fa-shopping-cart"></i></a>
										</button>
									</form>
								</li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a
									href="<c:url value="/product-detail.htm?productId=${item.productId }"/>">${item.productName }</a>
							</h6>
							<h5>
								<c:set var="formattedPrice">
									<fmt:formatNumber value="${item.price}" type="number"
										maxFractionDigits="0" />
								</c:set>
								${formattedPrice}đ
							</h5>
						</div>
					</div>

				</c:forEach>
			</div>

		</div>
	</section>
	<!-- Related Product Section End -->
	<content tag="script"> <script>
		function changeQuantity(amount) {
			var quantityInput = document.getElementById('quantity');
			var currentQuantity = parseInt(quantityInput.value);
			var newQuantity = currentQuantity + amount;

			if (newQuantity >= 1) {
				quantityInput.value = newQuantity;
			}
		}
		function validateInput(event) {
			var input = event.target;
			var value = input.value;

			// Kiểm tra và xóa tất cả dấu '.'
			var newValue = value.replace(/\./g, '');

			if (value === '-' || value === '0' || parseInt(value) < 1) {
				input.value = '';
			} else {
				input.value = newValue;
			}

		}

		function validateQuantity() {
			var quantity = document.getElementById('quantity').value;
			var productQuantity = $
			{
				product.quantity
			}
			;
			if (quantity === '' || !Number.isInteger(Number(quantity))) {
				alert("Vui lòng nhập số lượng của sản phẩm");
				return false;
			}
			if (parseInt(quantity) > productQuantity) {
				alert("Số lượng sản phẩm tồn kho không đủ. Chỉ còn "
						+ productQuantity + " sản phẩm trong kho.");
				return false;
			}
			return true;
		}
	</script> </content>
</body>
