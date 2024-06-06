<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@include file="/WEB-INF/views/layouts/admin/admin-lib.jsp" %>

		<body>
			<div class="container">
				<div class="row">
					<!-- Sidebar -->
					<div class="col-lg-2 d-none d-lg-block">
						<%@include file="/WEB-INF/views/layouts/employee/employee-headernav.jsp" %>
					</div>
					<div class="col-lg-10 col-md-12">
						<div id="content-wrapper" class="d-flex flex-column">
							<div class="container">
								<!-- Breadcrum -->
								<div class="row mb-4">
									<div class="col-md-12">
										<div class="d-md-flex justify-content-between align-items-center">
											<div>
												<h2>Đơn hàng</h2>
												<!-- breacrumb -->
												<nav aria-label="breadcrumb">
													<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
														<li class="breadcrumb-item  "><a href="employee/dashboard.htm"
																class="brc-link">Trang
																chủ </a></li>
														<li class="breadcrumb-item active" aria-current="page"
															class="text-decoration-none">Đơn hàng</li>
													</ol>

												</nav>
											</div>

										</div>
									</div>
								</div>
								<!--End Breadcrum -->


								<div class="row">
									<div class="col-xl-12 col-12 mb-5">
										<div class=" px-6 py-6">
											<div class="col-xl-12 col-12 mb-3">
												<div class="row justify-content-end">
													<div class="col-xl-2 col-md-4 col-12 d-flex flex-col">
														<p class="mr-4 p-1">Filter</p>
														<div class="dropdown">
															<button class="btn btn-custom dropdown-toggle" type="button"
																data-bs-toggle="dropdown" aria-expanded="false">
																<c:if test="${filter == 0 }">Tất cả</c:if>
																<c:if test="${filter == 1 }">Chờ xử lý</c:if>
																<c:if test="${filter == 2 }">Đang giao</c:if>
																<c:if test="${filter == 3 }">Đã giao</c:if>
																<c:if test="${filter == 4 }">Đã hủy</c:if>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																		href="employee/orders.htm?filter=0">Tất cả</a>
																</li>
																<li><a class="dropdown-item"
																		href="employee/orders.htm?filter=1">Chờ xử
																		lý</a></li>
																<li><a class="dropdown-item"
																		href="employee/orders.htm?filter=2">Đang
																		giao</a></li>
																<li><a class="dropdown-item"
																		href="employee/orders.htm?filter=3">Đã giao</a>
																</li>
																<li><a class="dropdown-item"
																		href="employee/orders.htm?filter=4">Hủy</a></li>

															</ul>
														</div>
													</div>
												</div>
											</div>


										</div>
										<!-- table -->
										<div class="table-responsive ">
											<table class="table">
												<thead class="position-sticky top-0">
													<tr class="table-success">
														<th>Detail</th>
														<th>Order ID</th>
														<th>Status</th>
														<th>Date</th>
														<th>Amount</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach varStatus="status" var="item" items="${orders}">
														<tr>
															<td class="align-middle"><a
																	href="employee/orders/order-detail.htm?orderId=${item.orderId }"
																	class="btn btn-outline-info btn-sm">Xem</a></td>
															<td class="align-middle"><span
																	style="color: #a8729a;">${item.orderId }</span></td>
															<td class="align-middle">
																<div class="dropdown">
																	<button
																		class="btn btn-sm btn-custom dropdown-toggle"
																		type="button" data-bs-toggle="dropdown"
																		aria-expanded="false">
																		<c:if test="${item.status == 0 }">Chờ xử lý
																		</c:if>
																		<c:if test="${item.status == 1 }">Đang giao
																		</c:if>
																		<c:if test="${item.status == 2 }">Đã giao</c:if>
																		<c:if test="${item.status == 3}">Đã hủy</c:if>
																	</button>
																	<ul class="dropdown-menu">
																		<li>
																			<form
																				action="employee/orders/update-order.htm"
																				method="post">
																				<input type="hidden" name="id"
																					value="${item.orderId}">
																				<input type="hidden" name="status"
																					value="0">
																				<button type="submit"
																					class="dropdown-item ${item.status == 0 || item.status == 1 || item.status == 2 || item.status == 3 ? 'disabled' : '' }">
																					Chờ xử lý
																				</button>
																			</form>
																		</li>
																		<li>
																			<form
																				action="employee/orders/update-order.htm"
																				method="post">
																				<input type="hidden" name="id"
																					value="${item.orderId}">
																				<input type="hidden" name="status"
																					value="1">
																				<button type="submit"
																					class="dropdown-item ${item.status == 1 || item.status == 2 || item.status == 3 ? 'disabled' : '' }">
																					Đang giao
																				</button>
																			</form>
																		</li>
																		<li>
																			<form
																				action="employee/orders/update-order.htm"
																				method="post">
																				<input type="hidden" name="id"
																					value="${item.orderId}">
																				<input type="hidden" name="status"
																					value="2">
																				<button type="submit"
																					class="dropdown-item ${item.status == 2 || item.status == 3 ? 'disabled' : '' }">
																					Đã giao
																				</button>
																			</form>
																		</li>
																		<li>
																			<form
																				action="employee/orders/update-order.htm"
																				method="post">
																				<input type="hidden" name="id"
																					value="${item.orderId}">
																				<input type="hidden" name="status"
																					value="3">
																				<button type="submit"
																					class="dropdown-item ${item.status == 2 || item.status == 3 ? 'disabled' : '' }">
																					Đã hủy
																				</button>
																			</form>
																		</li>
																	</ul>
																</div>
															</td>
															<td class="align-middle">
																<fmt:formatDate value="${item.orderTime}"
																	pattern="HH:mm dd-MM-yyyy" />
															</td>

															<td class="align-middle">
																<fmt:formatNumber value="${item.price }" type="currency"
																	currencySymbol="đ" maxFractionDigits="0" />
															</td>


														</tr>
													</c:forEach>
												</tbody>
											</table>


										</div>
									</div>
								</div>

							</div>

							<div class="d-flex justify-content-center">
								<c:if test="${orders.size() > 0}">
									<!-- nav -->
									<nav>
										<ul class="pagination d-flex justify-content-center ms-2">
											<li class="page-item ${(paginate.currentPage == 1) ? 'disabled' : ''}">
												<a class="page-link mx-1" aria-label="Previous"
													href="employee/orders.htm?crrPage=${crrPage - 1}&filter=${filter}">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</li>
											<c:forEach var="i" begin="1" end="${paginate.totalPage}" varStatus="in">
												<li
													class="page-item ${(paginate.currentPage == in.count) ? 'active' : ''}">
													<a class="page-link mx-1"
														href="employee/orders.htm?crrPage=${in.count}&filter=${filter}">${in.count}</a>
												</li>
											</c:forEach>
											<li
												class="page-item ${(paginate.currentPage == paginate.totalPage) ? 'disabled' : ''}">
												<a class="page-link mx-1 text-body" aria-label="Next"
													href="employee/orders.htm?crrPage=${paginate.currentPage + 1}&filter=${filter}">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</li>
										</ul>
									</nav>
								</c:if>
							</div>

							<!--End pagination -->
						</div>
					</div>
				</div>
			</div>
		</body>
		<script src="<c:url value=" /assets/admin/js/AlertHandler.js" />"></script>

		</html>