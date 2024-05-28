<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/layouts/admin/admin-lib.jsp"%>
<c:choose>
	<c:when test="${role.toLowerCase() eq 'employee'}">
		<c:set var="roleName" value="Nhân viên" />
	</c:when>
	<c:when test="${role.toLowerCase() eq 'guest'}">
		<c:set var="roleName" value="Khách hàng" />
	</c:when>
</c:choose>
<style>
</style>
<body>
	<c:if test="${not empty mess}">
		<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
			<div class="  alert alert-success alert-dismissible fade show"
				role="alert">
				${mess }
				<button type="button" class="ms-auto btn-close"
					data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</div>

	</c:if>
	<div class="container">
		<div class="row">

			<!-- Sidebar -->
			<div class="col-lg-2 d-none d-lg-block"><%@include
					file="/WEB-INF/views/layouts/admin/admin-headernav.jsp"%></div>
			<div class="col-lg-10 col-md-12">
				<div id="content-wrapper" class="d-flex flex-column">
					<!-- Main -->
					<div class="container">
						<div class="row mb-5">

							<div class="col-md-12 mb-4">
								<div
									class="d-md-flex justify-content-between align-items-center">
									<!-- pageheader -->
									<div>
										<h2>Cập nhật thông tin ${roleName }</h2>
										<!-- breacrumb -->
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
												<li class="breadcrumb-item  "><a
													href="admin/dashboard.htm" class="brc-link">Trang chủ
												</a></li>
												<li class="breadcrumb-item "><a
													href="admin/user/get-${role.toLowerCase() }.htm"
													class="brc-link">${roleName } </a>
												<li class="breadcrumb-item active" aria-current="page"
													class="text-decoration-none">Cập nhật thông tin ${roleName }</li>
											</ol>

										</nav>
									</div>

								</div>
							</div>

							<div class=" col-md-6 offset-md-3 card p-5 ">
								<form:form action="admin/user/edit.htm?id=${id}"
									modelAttribute="updateuser" enctype="multipart/form-data"
									method="post">
									<div class="row g-3">

										<div class="col">
											<label for="lastName" class="form-label mb-2 fw-bold">Họ</label>
											<form:input type="text" id="lastName" placeholder="Họ"
												class="form-control " path="lastName" />
											<form:errors class="text-danger" path="lastName" />

										</div>
										<!-- col -->
										<div class="col">
											<!-- input -->
											<label for="firstName" class="form-label mb-2 fw-bold">Tên</label>
											<form:input type="text" id="Tên"
												placeholder="Firstname" class="form-control "
												path="firstName" />
											<form:errors class="text-danger" path="firstName" />
										</div>
										<div class="col-12">
											<label for="email" class="form-label mb-2 fw-bold">Email</label>
											<form:input type="email" class="form-control"
												placeholder="Email" id="email" path="email" />
											<form:errors class="text-danger" path="email" />
										</div>
										<div class="col-12">

											<label for="password" class="form-label mb-2 fw-bold">
												Mật khẩu</label>
											<form:input type="password" class="form-control"
												id="password" placeholder="Password" path="password" />
											<form:errors class="text-danger" path="password" />

										</div>
										<div class="col-12 ">
											<label for="phoneNumber" class="form-label mb-2 fw-bold">Số điện thoại</label>
											<form:input type="text" class="form-control" id="phoneNumber"
												path="phoneNumber" placeholder="Phone Number" />
											<form:errors class="text-danger" path="phoneNumber" />
										</div>
										<div class="form-group mt-3">
											<p class="mb-2 fw-bold">Ảnh hiện tại</p>
											<img id="output" class="width-100" style="width: 100px"
												src="<c:url value="/assets/user/img/account/${updateuser.avatarDir }" />"
												alt="No Image" />
										</div>
										<div class="col-12 ">
											<label for="avatar">Avatar:</label>
											<form:input type="file" class="form-control-file" id="avatar"
												path="avatar" accept="image/*" />
											<form:errors class="text-danger" path="avatar" />
										</div>
										<!-- btn -->
										<div
											class="col-12 mt-2 d-flex align-items-center justify-content-center">
											<button type="submit" class="btn btn-custom">Xác nhận</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
					<!-- End Main -->
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>