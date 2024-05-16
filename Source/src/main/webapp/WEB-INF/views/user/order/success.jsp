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
	<div
		class="d-flex justify-content-center align-items-center min-vh-60">
		<div class="container-fluid text-center">
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-7 col-xl-6">
					<div class="card mx-auto border-info">
						<div class="card-body">
							<h5 class="card-title text-success">Đặt hàng thành công!!!</h5>
							<p class="card-text">Cám ơn bạn đã đặt hàng! Shop sẽ xử lý
								đơn hàng của bạn trong thời gian nhanh nhất có thể!</p>
							<p class="card-text">
								Thời gian giao hàng dự kiến <span class="fw-bold"> <fmt:formatDate
										type="both" value="${orders.deliveryTime}"
										pattern="dd-MM-yyyy HH:mm" /> (nội thành HCM)
								</span> và từ 1-3 ngày với các tỉnh thành khác
							</p>
							<a class="btn btn-outline-success card-link" href="index.htm"
								role="button"> <i class="bi bi-house"></i> Quay về trang chủ
							</a> <a class="btn btn-outline-success card-link"
								href="account/OrderHistory.htm" role="button"> <i
								class="bi bi-list-check"></i> Danh sách đơn hàng
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>