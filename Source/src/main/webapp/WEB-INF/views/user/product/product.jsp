<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
.product__pagination a.active {
	background: #7fad39;
	border-color: #7fad39;
	color: #ffffff;
}

.latest-product__item__text {
	overflow: hidden;
	padding-top: 10px;
}

.latest-product__item__text h6 a {
	color: #252525;
	margin-bottom: 8px;
}

.btn-custom {
	background-color: #7fad39 !important;
	font-weight: 600;
	color: white;
}

.price-value {
	font-size: 16px;
	color: #dd2222;
	font-weight: 700;
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

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>Danh mục</h4>
							<ul>
								<c:forEach var="item" items="${categories}">
									<li><a
										href="<c:url value="/product.htm?categoryId=${item.categoryId }&currentPage=1"/>">${item.name }</a></li>
								</c:forEach>
							</ul>
						</div>


						<div class="sidebar__item">
							<h4>Giá</h4>
							<div class="price-range-wrap">
								<div
									class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
									data-min="1000" data-max="${maxprice }">
									<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
								</div>
								<div class="range-slider">

									<div class="d-flex justify-content-between">
										<p class="price-value" id="minamount"></p>
										<p class="price-value" id="maxamount"></p>
									</div>

									<button class="btn btn-custom mt-4" onclick="filterByPrice()">Filter</button>
								</div>
							</div>
						</div>

						<div class="sidebar__item">
							<div class="latest-product__text">
								<h3>Sản phẩm mới nhất</h3>

								<c:set var="limitLatestProduct" value="${latestProducts.size()}" />

								<c:if test="${limitLatestProduct > 5 }">
									<c:set var="limitLatestProduct" value="5" />
								</c:if>

								<div class="latest-product__slider owl-carousel">

									<div class="latest-prdouct__slider__item">
										<c:forEach var="item" items="${latestProducts}"
											varStatus="loop" begin="0" end="${limitLatestProduct }">
											<a
												href="<c:url value="/product-detail.htm?productId=${item.productId }"/>"
												class="latest-product__item">
												<div class="latest-product__item__pic">
													<img
														src="<c:url value="/assets/user/img/products/${item.image }"/>"
														alt="">
												</div>
												<div class="latest-product__item__text">
													<h6>${item.productName }</h6>
													<span> <c:set var="formattedPrice">
															<fmt:formatNumber value="${item.price}" type="number"
																maxFractionDigits="0" />
														</c:set> ${formattedPrice}đ
													</span>
												</div>
											</a>
											<c:if
												test="${(loop.index+1) % 3 == 0 || (loop.index+1) == latestProducts.size() }">
									</div>
									<c:if test="${(loop.index+1) < limitLatestProduct }">
										<div class="latest-prdouct__slider__item">
									</c:if>
									</c:if>
									</c:forEach>
								</div>
							</div>

						</div>

					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>Sản phẩm đề xuất</h2>
						</div>


						<div class="row">
							<div class="product__discount__slider owl-carousel">
								<c:forEach var="item" items="${ productsByCategory}"
									varStatus="loop">

									<div class="col-lg-4">
										<div class="product__discount__item">
											<div class="product__discount__item__pic set-bg"
												data-setbg="<c:url value="/assets/user/img/products/${item.image }"/>">

												<ul class="product__item__pic__hover">
													<li>
														<%-- <a
														href="<c:url value="/AddWishlist.htm?productId=${item.productId }"/>"><i
															class="fa fa-heart"></i></a> --%>

														<form method="post"
															action="AddWishlist.htm?productId=${item.productId }">
															<button
																style="border: none; background-color: transparent;">
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
															<button
																style="border: none; background-color: transparent;">
																<a><i class="fa fa-shopping-cart"></i></a>
															</button>
														</form>
													</li>
												</ul>
											</div>
											<div class="product__discount__item__text">
												<h5>
													<a
														href="<c:url value="/product-detail.htm?productId=${item.productId }"/>">${item.productName }</a>
												</h5>
												<div class="product__item__price">
													<c:set var="formattedPrice">
														<fmt:formatNumber value="${item.price}" type="number"
															maxFractionDigits="0" />
													</c:set>
													${formattedPrice}đ
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="filter__item mt-2">
							<div class="row">
								<div class="col-lg-4 col-md-5">
									<!-- <div class="filter__sort" style="visibility: hidden;"> -->
									<div class="filter__sort">
										<span>Sắp xếp theo</span> <select id="sort"
											onchange="sortProducts()">
											<option value="none"
												<c:if test="${param.sort eq 'none'}">selected</c:if>>Mặc
												định</option>
											<option value="name"
												<c:if test="${param.sort eq 'name'}">selected</c:if>>Tên</option>
											<option value="price"
												<c:if test="${param.sort eq 'price'}">selected</c:if>>Giá</option>
										</select>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div class="filter__found">
										<h6>
											<span>${productsByCategory.size() }</span> Sản phẩm tìm thấy
										</h6>
									</div>
								</div>

							</div>
						</div>
						<div class="row">
							<c:forEach var="item" items="${productsByCategory }"
								begin="${paginateInfo.start }" end="${paginateInfo.end }"
								varStatus="loop">

								<div class="col-lg-4 col-md-6 col-sm-6">
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
														<button
															style="border: none; background-color: transparent;">
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
														<button
															style="border: none; background-color: transparent;">
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
								</div>

							</c:forEach>


						</div>


						<c:if test="${total > 6}">
							<div class="d-flex justify-content-center">
								<div class="product__pagination">
									<c:set var="PreviousPage" value="${paginateInfo.currentPage }" />
									<c:if test="${ paginateInfo.currentPage > 1 }">
										<c:set var="PreviousPage"
											value="${paginateInfo.currentPage -1 }" />
									</c:if>

									<c:set var="Nextpage" value="${paginateInfo.currentPage }" />
									<c:if
										test="${ paginateInfo.currentPage < paginateInfo.totalPage}">
										<c:set var="Nextpage" value="${paginateInfo.currentPage + 1 }" />
									</c:if>
									<c:set var="minPrice" value="${param.minPrice }"></c:set>
									<c:set var="maxPrice" value="${param.maxPrice }"></c:set>
									<c:set var="categoryId" value="${param.categoryId}"></c:set>
									<c:set var="sort" value="${param.sort }"></c:set>
									<c:if test="${paginateInfo.currentPage != 1 }">
										<a
											href="<c:url value="/product/filterBy.htm">
                <c:param name="sort" value="${sort}"/>
                <c:param name="categoryId" value="${categoryId}"/>
                <c:param name="minPrice" value="${minPrice}"/>
                <c:param name="maxPrice" value="${maxPrice}"/>
                <c:param name="currentPage" value="${PreviousPage}"/>
            </c:url>">
											<i class="fa fa-long-arrow-left"></i>
										</a>
									</c:if>
									<c:forEach var="item" begin="1"
										end="${ paginateInfo.totalPage}" varStatus="loop">
										<c:if test="${loop.index == paginateInfo.currentPage}">
											<a class="active"
												href="<c:url value="/product/filterBy.htm">
                    <c:param name="sort" value="${sort}"/>
                    <c:param name="categoryId" value="${categoryId}"/>
                    <c:param name="minPrice" value="${minPrice}"/>
                	<c:param name="maxPrice" value="${maxPrice}"/>
                    <c:param name="currentPage" value="${loop.index}"/>
                </c:url>">
												${loop.index} </a>
										</c:if>
										<c:if test="${loop.index != paginateInfo.currentPage}">
											<a
												href="<c:url value="/product/filterBy.htm">
                    <c:param name="sort" value="${sort}"/>
                    <c:param name="categoryId" value="${categoryId}"/>
                    <c:param name="minPrice" value="${minPrice}"/>
                	<c:param name="maxPrice" value="${maxPrice}"/>
                    <c:param name="currentPage" value="${loop.index}"/>
                </c:url>">
												${loop.index} </a>
										</c:if>
									</c:forEach>
									<c:if
										test="${paginateInfo.currentPage != paginateInfo.totalPage}">
										<a
											href="<c:url value="/product/filterBy.htm">
                <c:param name="sort" value="${sort}"/>
                <c:param name="categoryId" value="${categoryId}"/>
                <c:param name="minPrice" value="${minPrice}"/>
                <c:param name="maxPrice" value="${maxPrice}"/>
                <c:param name="currentPage" value="${Nextpage}"/>
            </c:url>">
											<i class="fa fa-long-arrow-right"></i>
										</a>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
	</section>
	<!-- Product Section End -->
	<script type="text/javascript">
		function getParameterByName(name, url) {
			if (!url)
				url = window.location.href;
			name = name.replace(/[\[\]]/g, "\\$&");
			var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
					.exec(url);
			if (!results)
				return null;
			if (!results[2])
				return '';
			return decodeURIComponent(results[2].replace(/\+/g, " "));
		}

		// Lấy tham số tìm kiếm từ URL nếu có
		var urlParams = new URLSearchParams(window.location.search);
		var searchValue = urlParams.get('search');

		// Đặt giá trị tìm kiếm vào trường input nếu tham số tìm kiếm đã được cung cấp trong URL
		if (searchValue !== null) {
			document.getElementById('search').value = searchValue;
		}
	</script>
	<script>
		function sortProducts() {
			var sortValue = document.getElementById("sort").value;
			var categoryId = getParameterByName("categoryId");
			var baseUrl = "${pageContext.request.contextPath}/product/";
			var url = baseUrl + "filterBy.htm?";
			if (categoryId) {
				url += "categoryId=" + categoryId;
			}
			if (sortValue !== "none") {
				url += "&sort=" + sortValue;
			}

			window.location.href = url;
		}

		function filterByPrice() {
			var minPrice = parseInt(document.getElementById("minamount").innerText);
			var maxPrice = parseInt(document.getElementById("maxamount").innerText);
			var categoryId = getParameterByName("categoryId");
			var sortValue = getParameterByName("sort");
			var currentPage = getParameterByName("currentPage");
			var baseUrl = "${pageContext.request.contextPath}/product/";
			var url = baseUrl + "filterBy.htm?";
			if (categoryId) {
				url += "categoryId=" + categoryId;
			}
			if (sortValue) {
				url += "&sort=" + sortValue;
			}
			url += "&minPrice=" + minPrice + "&maxPrice=" + maxPrice;

			url += "&currentPage=" + 1;

			window.location.href = url;
		}
	</script>
</body>
