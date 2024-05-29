<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/admin/admin-lib.jsp"%>

<body>
	<div class="container">
		<div class="row">
			<!-- Sidebar for larger screens -->
			<div class="col-lg-2 d-none d-lg-block">
				<%@include file="/WEB-INF/views/layouts/admin/admin-headernav.jsp"%>
			</div>
			<!-- Main content area -->
			<div class="col-lg-10 col-md-12">
				<div id="content-wrapper" class="d-flex flex-column">
					<div class="container">
						<!-- Breadcrumb -->
						<div class="row mb-4">
							<div class="col-md-12">
								<div
									class="d-md-flex justify-content-between align-items-center">
									<div>
										<h2>Trang chủ</h2>
										<!-- Breadcrumb -->
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
												<li class="breadcrumb-item"><a href="admin/dashboard.htm"
													class="brc-link">Trang chủ</a></li>
											</ol>
										</nav>
									</div>
									<!-- Button for opening sidebar on smaller screens -->
									<!-- <button class="btn btn-primary d-lg-none" type="button"
										data-toggle="offcanvas" data-target="#offcanvasSidebar"
										aria-controls="offcanvasSidebar">
										<i class="bi bi-list"></i>
									</button> -->
								</div>
							</div>
						</div>
						<!-- End Breadcrumb -->

						<div class="row mb-4 mt-3">
							<div class="col-md-12">
								<!-- Card -->
								<div class="card bg-light border-0 rounded-4"
									style="background-image: url(assets/admin/img/slide_2.jpg); background-repeat: no-repeat; background-size: cover; background-position: right;">
									<div class="card-body p-lg-12 p-5">
										<h1>Xin chào Admin</h1>
										<p>Chào mừng bạn quay trở lại</p>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-4 col-md-6 mb-4">
								<!-- Card -->
								<div class="card h-100 card-lg">
									<!-- Card body -->
									<div class="card-body p-4">
										<!-- Heading -->
										<div
											class="d-flex justify-content-between align-items-center mb-4">
											<div>
												<h4 class="mb-0 fs-5">Tổng doanh thu</h4>
											</div>
											<div
												class="icon-shape icon-md bg-light-danger text-dark-danger rounded-circle">
												<i class="bi bi-currency-dollar fs-5"></i>
											</div>
										</div>
										<!-- Project number -->
										<div class="lh-1">
											<h1 class="mb-2 fw-bold fs-2">
												<fmt:formatNumber value="${totalEarning}" type="currency"
													currencySymbol="đ" maxFractionDigits="0" />
											</h1>
											<span>Phí vận chuyển <fmt:formatNumber value="${totalFee}" type="currency"
													currencySymbol="đ" maxFractionDigits="0" /></span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 mb-4">
								<!-- card -->
								<div class="card h-100 card-lg">
									<!-- card body -->
									<div class="card-body p-6">
										<!-- heading -->
										<div
											class="d-flex justify-content-between align-items-center mb-6">
											<div>
												<h4 class="mb-2 fs-5">Đơn hàng</h4>
											</div>
											<div
												class="icon-shape icon-md bg-light-warning text-dark-warning rounded-circle">
												<i class="bi bi-cart fs-5"></i>
											</div>
										</div>
										<!-- project number -->
										<div class="lh-1">
											<h1 class="mb-2 fw-bold fs-2">${totalOrder}</h1>
											<span>${ordersThisMonth } đơn hàng tháng này</span>
										</div>

									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 mb-4">
								<!-- card -->
								<div class="card h-100 card-lg">
									<!-- card body -->
									<div class="card-body p-6">
										<!-- heading -->
										<div
											class="d-flex justify-content-between align-items-center mb-6">
											<div>
												<h4 class="mb-2 fs-5">Khách hàng</h4>
											</div>
											<div
												class="icon-shape icon-md bg-light-info text-dark-info rounded-circle">
												<i class="bi bi-people fs-5"></i>
											</div>
										</div>
										<!-- project number -->
										<div class="lh-1">
											<h1 class="mb-2 fw-bold fs-2">${totalClient}</h1>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- <!-- Off-canvas sidebar for smaller screens -->
	<div class="offcanvas offcanvas-start" tabindex="-1"
		id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasSidebarLabel">Menu</h5>
			<button type="button" class="close" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="offcanvas-body">
			<%@include file="/WEB-INF/views/layouts/admin/admin-headernav.jsp"%>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> --%>
</body>

<script src="<c:url value="/assets/admin/js/AlertHandler.js"/>"></script>

</html>