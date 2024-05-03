<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/layouts/user/common.jsp"%>
<head>
<style>
.product__pagination a.active {
	background: #7fad39;
	border-color: #7fad39;
	color: #ffffff;
}

.btn-custom {
	background-color: #7fad39 !important;
	font-weight: 600;
	color: white;
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
						<h2>Organi Shop</h2>
						<div class="breadcrumb__option">
							<a href="<c:url value="/index.htm" />">Home</a> <span>Search</span>
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
							<h4>Filter</h4>
							<div>
								<label>Price</label> <input type="range" min="0" max="5000000"
									value="0" class="slider" id="priceRange"
									placeholder="price_filter" style="width: 100%">
							</div>
							<div class="price-range-wrap">

								<%-- <div class="range-slider">
									<div class="price-input">
										<input type="text" id="minamount"
											value="<fmt:formatNumber value='1000' />₫"> <input
											type="text" id="maxamount"
											value="<fmt:formatNumber value='10000000' />₫">
									</div>
								</div> --%>
								<button class="btn btn-custom mt-4" onclick="filterByPrice()">Filter</button>

							</div>
						</div>

					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>Search Result</h2>
						</div>
						<div class="filter__item">
							<div class="row">
								<div class="col-lg-4 col-md-5">
									<div class="filter__sort">
										<span>Sort By</span> <select id="sort"
											onchange="sortProducts()">
											<option value="none">Default</option>
											<option value="name">Name</option>
											<option value="price">Price</option>
										</select>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div class="filter__found">
										<h6>
											<span>${total }</span> Products found
										</h6>
									</div>
								</div>

							</div>
						</div>
						<div class="row">
							<c:forEach var="item" items="${products}">

								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="<c:url value="/assets/user/img/products/${item.image }"/>">
											<ul class="product__item__pic__hover">
												<li><a
													href="<c:url value="/AddWishlist.htm?productId=${item.productId }"/>"><i
														class="fa fa-heart"></i></a></li>
												<li><a
													href="<c:url value="/product-detail.htm?productId=${item.productId }"/>"><i
														class="fa fa-retweet"></i></a></li>
												<li><a
													href="<c:url value="/AddCart.htm?productId=${item.productId }"/>"><i
														class="fa fa-shopping-cart"></i></a></li>
											</ul>
										</div>
										<div class="product__item__text">
											<h6>
												<a href="#">${item.productName }</a>
											</h6>
											<h5>
												<fmt:formatNumber value='${item.price }' type='currency'
													currencySymbol='đ' maxFractionDigits='0' />
											</h5>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>

					</div>
					<c:if test="${products.size() > 0}">
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

								<c:if test="${paginateInfo.currentPage != 1 }">
									<a
										href="<c:url value="/product/search.htm">
                <c:param name="sort" value="${sort}"/>
                <c:param name="search" value="${search}"/>
                <c:param name="currentPage" value="${PreviousPage}"/>
            </c:url>">
										<i class="fa fa-long-arrow-left"></i>
									</a>
								</c:if>
								<c:forEach var="item" begin="1" end="${ paginateInfo.totalPage}"
									varStatus="loop">
									<c:if test="${loop.index == paginateInfo.currentPage}">
										<a class="active"
											href="<c:url value="/product/search.htm">
                    <c:param name="sort" value="${sort}"/>
                    <c:param name="search" value="${search}"/>
                    <c:param name="currentPage" value="${loop.index}"/>
                </c:url>">
											${loop.index} </a>
									</c:if>
									<c:if test="${loop.index != paginateInfo.currentPage}">
										<a
											href="<c:url value="/product/search.htm">
                    <c:param name="sort" value="${sort}"/>
                    <c:param name="search" value="${search}"/>
                    <c:param name="currentPage" value="${loop.index}"/>
                </c:url>">
											${loop.index} </a>
									</c:if>
								</c:forEach>
								<c:if
									test="${paginateInfo.currentPage != paginateInfo.totalPage}">
									<a
										href="<c:url value="/product/search.htm">
                <c:param name="sort" value="${sort}"/>
                <c:param name="search" value="${search}"/>
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
	<script>
		function sortProducts() {
			var sortValue = document.getElementById("sort").value;
			var searchValue = getParameterByName("search");
			var baseUrl = "${pageContext.request.contextPath}/product/";
			var url = baseUrl + "search.htm?";
			if (sortValue !== "none") {
				url += "sort=" + sortValue;
			}
			if (searchValue) {
				url += "&search=" + searchValue;
			}
			window.location.href = url;
		}

		function filterByPrice() {
			var minPrice = 0;
			var maxPrice = document.getElementById("priceRange").value;
			var searchValue = getParameterByName("search");
			var sortValue = getParameterByName("sort");
			var currentPage = getParameterByName("currentPage");
			var baseUrl = "${pageContext.request.contextPath}/product/";
			var url = baseUrl + "search.htm?";
			if (searchValue) {
				url += "search=" + searchValue;
			}
			if (sortValue) {
				url += "&sort=" + sortValue;
			}
			url += "&minPrice=" + minPrice + "&maxPrice=" + maxPrice;
			if (currentPage) {
				url += "&currentPage=" + currentPage;
			}
			window.location.href = url;
		}

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
	</script>

	<script>
		// Lấy tham số tìm kiếm từ URL nếu có
		var urlParams = new URLSearchParams(window.location.search);
		var searchValue = urlParams.get('search');

		// Đặt giá trị tìm kiếm vào trường input nếu tham số tìm kiếm đã được cung cấp trong URL
		if (searchValue !== null) {
			document.getElementById('search').value = searchValue;
		}
	</script>

</body>
