<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Page title -->
				<div class="my-5">
					<h3>Đổi mật khẩu</h3>
					<hr>
				</div>
				<!-- Form START -->
				<table class="file-upload">
					<div class="row mb-4 gx-5">
						<%@include file="/WEB-INF/views/layouts/user/account-menu.jsp"%>
						<form:form action="account/changePassword.htm" method="post"
							modelAttribute="password">

							<div class="col-lg-10 mb-5 mb-xxl-0">
								<div class="bg-secondary-soft px-4 py-5 rounded">

									<c:if test="${not empty message}">
										<c:choose>
											<c:when test="${message == 0}">
												<div
													class="  alert alert-danger alert-dismissible fade show"
													role="alert">
													Cập nhật thất bại!
													
												</div>


											</c:when>
											<c:when test="${message == 1}">
												<div
													class=" alert alert-success alert-dismissible fade show"
													role="alert">
													Cập nhật thành công!
													
												</div>
											</c:when>

										</c:choose>
									</c:if>

									<div class="form-group row">
										<label for="inputPassword" class="col-sm-3 col-form-label">Mật
											khẩu cũ: </label>
										<div class="col-lg-9">
											<form:input path="oldPass" type="password"
												class="form-control" required="true" value=""
												placeholder="Password" />
											<label class="mb-1"> <form:errors path="oldPass"
													cssClass="errors" />
											</label>
										</div>
									</div>
									<div class="form-group row">
										<label for="inputPassword" class="col-sm-3 col-form-label">Mật
											khẩu mới: </label>
										<div class="col-lg-9">
											<form:input path="newPass" type="password"
												class="form-control" required="true" value=""
												placeholder="New password" />
											<label class="mb-1"> <form:errors path="newPass"
													cssClass="errors" /></label>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Nhập lại mật
											khẩu mới: </label>
										<div class="col-lg-9">
											<form:input path="confirmPass" type="password"
												class="form-control" required="true"
												placeholder="Confirm new password" />
											<label class="mb-1"> <form:errors path="confirmPass"
													cssClass="errors" />
										</div>
									</div>
									<div class="gap-3 d-md-flex justify-content-md-end text-center">
										<button type="submit" class="btn btn-primary"
											style="margin-right: 4em;">Đổi mật khẩu</button>
									</div>
						</form:form>

					</div>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="assets/js/user/account.js"></script>
	<script type="text/javascript">
	
		// Ngay sau khi load xong trang làm những điều này
		window.addEventListener("load", function() {
			// Đặt mã của bạn ở đây
			var alertElements = document.querySelectorAll(".alert");
			setTimeout(function() {
				alertElements.forEach(function(alertElement) {
					alertElement.style.display = "none";
				})
			},3000);
		});
	</script>
</body>

</html>