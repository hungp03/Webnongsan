<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<html>
<%-- <%@include file="/WEB-INF/views/layouts/user/common.jsp"%> --%>
<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Browser</title>

<base href="${pageContext.servletContext.contextPath}/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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
									<th scope="col" class="col-sm-4">Ngày mua</th>
									<th scope="col" class="col-sm-3">Tổng tiền</th>
									<th scope="col" class="col-sm-4">Trạng thái</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty userOrder}">
									<c:forEach items="${userOrder}" var="order" varStatus="loop">
										<tr>
											<th><a
												href="something.htm?orderId=${order.getOrderId() }"><i
													class="bi bi-info-circle"></i></a></th>
											<td>${order.getOrderTime() }</td>
											<td>${order.getPrice() }</td>
											<td>${order.getStatus() }</td>
										</tr>
									</c:forEach>
								</c:if>


							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>