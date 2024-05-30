<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Browser</title>

<base href="${pageContext.servletContext.contextPath}/">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>


<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Page title -->
				<div class="my-5">
					<h3>Lịch sử đơn hàng</h3>
					<hr>
				</div>
				<div class="row mb-4 gx-5">
					<%@include file="/WEB-INF/views/layouts/user/account-menu.jsp"%>

					<div class="col-lg-10 mb-4">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" class="col-sm-1">Chi tiết</th>
									<th scope="col" class="col-sm-3">Ngày mua</th>
									<th scope="col" class="col-sm-3">Tổng tiền</th>
									<th scope="col" class="col-sm-3">Trạng thái</th>
									<th scope="col" class="col-sm-3">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty orders}">
									<c:forEach items="${orders}" var="order" varStatus="loop">
										<tr>
											<th><a
												href="order/myorder.htm?orderId=${order.getOrderId() }"><i
													class="bi bi-info-circle address-link"></i></a></th>
											<td><fmt:formatDate type="both"
													value="${order.getOrderTime() }" pattern="dd-MM-yyyy HH:mm" /></td>
											<td><fmt:formatNumber value='${order.getPrice() }'
													type='currency' currencySymbol='đ' maxFractionDigits='0' /></td>
											<td><c:if test="${order.status == 0 }">Đang xử lý</c:if>
												<c:if test="${order.status == 1 }">Đang giao hàng</c:if> <c:if
													test="${order.status == 2 }">Thành công</c:if> <c:if
													test="${order.status == 3}">Đã hủy</c:if></td>
											<c:set var="isDisabled" value="" />
											<c:if test="${order.status != 0 }">
												<c:set var="isDisabled" value="disabled" />
											</c:if>
											<td><a
												class="btn btn-sm text-light btn-danger ${isDisabled }"
												data-bs-toggle="modal" data-bs-target="#exampleModal"
												data-orderid="${order.getOrderId()}">Hủy</a></td>
										</tr>
									</c:forEach>
								</c:if>


							</tbody>
						</table>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">Hủy
											đơn hàng</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Bạn có muốn hủy yêu cầu đặt hàng?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Đóng</button>
										<form id="cancelOrderForm" action="" method="post">
											<button type="submit" class="btn btn-danger">Hủy yêu
												cầu</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center mb-3">
						<c:if test="${orders.size() > 0}">
							<!-- nav -->
							<nav>
								<ul class="pagination d-flex justify-content-center ms-2">
									<li
										class="page-item ${(paginate.currentPage == 1) ? 'disabled' : ''}">
										<a class="page-link mx-1" aria-label="Previous"
										href="account/OrderHistory.htm?crrPage=${crrPage - 1}">
											<span aria-hidden="true">&laquo;</span>
									</a>
									</li>
									<c:forEach var="i" begin="1" end="${paginate.totalPage}"
										varStatus="in">
										<li
											class="page-item ${(paginate.currentPage == in.count) ? 'active' : ''}">
											<a class="page-link mx-1"
											href="account/OrderHistory.htm?crrPage=${in.count}">${in.count}</a>
										</li>
									</c:forEach>
									<li
										class="page-item ${(paginate.currentPage == paginate.totalPage) ? 'disabled' : ''}">
										<a class="page-link mx-1 text-body" aria-label="Next"
										href="account/OrderHistory.htm?crrPage=${paginate.currentPage + 1}">
											<span aria-hidden="true">&raquo;</span>
									</a>
									</li>
								</ul>
							</nav>
						</c:if>
					</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>
		// cập nhật form khi modal được mở
		document.addEventListener('DOMContentLoaded', function() {
			var exampleModal = document.getElementById('exampleModal');
			exampleModal.addEventListener('show.bs.modal', function(event) {
				var button = event.relatedTarget;
				var orderId = button.getAttribute('data-orderid');
				var form = document.getElementById('cancelOrderForm');
				form.action = 'order/cancelRequest.htm?orderId=' + orderId;
			});
		});
	</script>
</body>

</html>