<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/admin/admin-lib.jsp"%>

<body>

	<div class="container">

		<div class="row">

			<!-- Sidebar -->
			<div class="col-lg-2 d-none d-lg-block"><%@include
					file="/WEB-INF/views/layouts/admin/admin-headernav.jsp"%></div>
			<div class="col-lg-10 col-md-12">
				<div id="content-wrapper" class="d-flex flex-column">
					<!-- Main -->
					<div class="container">
						<div class="row mt-3">

							<div class="col-md-12 mb-4">
								<div
									class="d-md-flex justify-content-between align-items-center">
									<!-- pageheader -->
									<div>
										<h2>Chi tiết đơn hàng</h2>
										<!-- breacrumb -->
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
												<li class="breadcrumb-item  "><a
													href="admin/dashboard.htm" class="brc-link">Trang chủ</a></li>
												<li class="breadcrumb-item "><a href="admin/orders.htm"
													class="brc-link">Đơn hàng</a>
												<li class="breadcrumb-item active" aria-current="page"
													class="text-decoration-none">Chi tiết đơn hàng</li>
											</ol>

										</nav>
									</div>

								</div>
							</div>
							<div class="container">
								<!-- row -->
								<div class="row ">
									<div class="col-12 mb-5">
										<!-- card -->
										<div class="card h-100 card-lg">
											<div class="card-body p-6">
												<div class="d-md-flex justify-content-between">
													<div class="d-flex align-items-center mb-2 mb-md-0">
														<h2 class="mb-0">Mã đơn hàng: ${order.orderId }</h2>
														<c:choose>
															<c:when test="${order.status == 0 }">
																<c:set var="bargecolor" value="warning"></c:set>
																<c:set var="namestatus" value="Chờ xử lý"></c:set>
															</c:when>
															<c:when test="${order.status == 1 }">
																<c:set var="bargecolor" value="primary"></c:set>
																<c:set var="namestatus" value="Đang giao"></c:set>
															</c:when>
															<c:when test="${order.status == 2 }">
																<c:set var="bargecolor" value="success"></c:set>
																<c:set var="namestatus" value="Đã giao"></c:set>
															</c:when>
															<c:when test="${order.status == 3 }">
																<c:set var="bargecolor" value="danger"></c:set>
																<c:set var="namestatus" value="Đã hủy"></c:set>
															</c:when>
														</c:choose>
														<span class="badge badge-${bargecolor } ml-3">${namestatus }</span>
													</div>

												</div>
												<div class="mt-8">
													<div class="row">
														<!-- address -->
														<div class="col-lg-4 col-md-4 col-12">
															<div class="mb-6 mt-3">
																<h6>Thông tin khách hàng</h6>
																<p class="mb-1 lh-lg">
																	${order.account.getName() }<br>${order.account.email }<br>
																	${order.account.phoneNumber }
																</p>
															</div>
														</div>
														<!-- address -->
														<div class="col-lg-4 col-md-4 col-12">
															<div class="mb-6 mt-3">
																<h6>Địa chỉ giao hàng</h6>
																<p class="mb-1 lh-lg">${order.defaultAddress }</p>

															</div>
														</div>
														<!-- address -->
														<div class="col-lg-4 col-md-4 col-12">
															<div class="mb-6 mt-3">
																<h6>Chi tiết</h6>
																<p class="mb-1 lh-lg">
																	Ngày đặt: <span class="text-dark"><fmt:formatDate
																			pattern="dd-MM-yyyy" value="${order.orderTime}" /></span><br>
																	Tổng tiền: <span class="text-dark"><fmt:formatNumber
																			value="${order.price}" type="currency"
																			currencySymbol="đ" maxFractionDigits="0" /></span>
																</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12">
													<div class="table-responsive">
														<!-- Table -->
														<table class="table mb-0 text-nowrap table-centered">
															<!-- Table Head -->
															<thead class="bg-light">
																<tr>
																	<th>Ảnh</th>
																	<th>Tên sản phẩm</th>
																	<th>Giá</th>
																	<th>Số lượng</th>
																	<th>Tổng</th>
																</tr>
															</thead>
															<!-- tbody -->
															<tbody>
																<c:forEach varStatus="status" var="o"
																	items="${orderDetail}">
																	<tr>
																		<td class="align-item"><a
																			href="product-detail.htm?productId=${o.product.productId }">
																				<img
																				src="<c:url value="/assets/user/img/products/${o.product.image} "/>"
																				style="width: 50px; height: 50px;">
																		</a></td>
																		<td class="align-item">
																			<h5 class="mb-0 h6">${o.product.productName }</h5>

																		</td>
																		<td><span class="text-dark fw-bold"> <fmt:formatNumber
																					value="${o.price }" type="currency"
																					currencySymbol="đ" maxFractionDigits="0" />
																		</span></td>
																		<td>${o.quantity }</td>
																		<td><span class="text-dark fw-bold"> <fmt:formatNumber
																					value="${o.price * o.quantity }" type="currency"
																					currencySymbol="đ" maxFractionDigits="0" />
																		</span></td>
																	</tr>
																</c:forEach>

																<tr>
																	<td class="border-bottom-0 pb-0"></td>
																	<td class="border-bottom-0 pb-0"></td>
																	<td colspan="1" class="fw-medium text-dark ">Tạm
																		tính</td>
																	<td class="fw-medium text-dark "><fmt:formatNumber
																			value="${order.price - 15000}" type="currency"
																			currencySymbol="đ" maxFractionDigits="0" /></td>
																</tr>
																<tr>
																	<td class="border-bottom-0 pb-0"></td>
																	<td class="border-bottom-0 pb-0"></td>
																	<td colspan="1" class="fw-medium text-dark ">Phí
																		vận chuyển</td>
																	<td class="fw-medium text-dark  "><fmt:formatNumber
																			value="${15000}" type="currency" currencySymbol="đ"
																			maxFractionDigits="0" /></td>
																</tr>

																<tr>
																	<td></td>
																	<td></td>
																	<td colspan="1" class="fw-semi-bold text-dark ">
																		<!-- text --> Thành tiền
																	</td>
																	<td class="fw-semi-bold text-dark "><fmt:formatNumber
																			value="${order.price}" type="currency"
																			currencySymbol="đ" maxFractionDigits="0" /></td>
																</tr>

															</tbody>
														</table>
													</div>
												</div>
											</div>


											<div class="card-body p-6">
												<div class="row">
													<div class="col-md-6 mb-4 mb-lg-0">
														<h6>Hình thức thanh toán</h6>
														<c:choose>
															<c:when test="${order.paymentMethod.trim() eq 'BANKING'}">
																<c:set var="pm" value="Chuyển khoản ngân hàng" />
															</c:when>
															<c:when test="${order.paymentMethod.trim() eq 'COD'}">
																<c:set var="pm" value="Thanh toán khi nhận hàng" />
															</c:when>
															<c:otherwise>
																<c:set var="pm"
																	value="Phương thức thanh toán không xác định" />
															</c:otherwise>
														</c:choose>
														<span> ${pm } </span>
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
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="<c:url value="assets/js/user/account.js" />"></script>
</html>