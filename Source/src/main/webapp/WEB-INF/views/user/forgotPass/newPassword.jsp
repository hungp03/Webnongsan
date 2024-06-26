<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<style>
.fw-bold {
	font-weight: 700 !important;
}

.text-success-login {
	--bs-text-opacity: 1;
	color: rgba(25, 135, 84, var(--bs-text-opacity)) !important;
}

.img-fluid {
	max-width: 100%;
	height: auto;
}

.form-control {
	display: block;
	width: 100%;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #dee2e6;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0.375rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

#passwordToggler {
	color: #001e2b;
	cursor: pointer;
	font-size: 16px;
	position: absolute;
	right: 20px;
	top: 50%;
}

.position-relative {
	position: relative !important;
}

.form-check {
	display: block;
	min-height: 1.5rem;
	padding-left: 1.5em;
	margin-bottom: 0.125rem;
}

.form-check .form-check-input {
	float: left;
	margin-left: -1.5em;
}

.form-check-input {
	--bs-form-check-bg:#fff;
	width: 1em;
	height: 1em;
	margin-top: 0.25em;
	vertical-align: top;
	background-color: #fff;
	background-image: var(--bs-form-check-bg-image);
	background-repeat: no-repeat;
	background-position: center;
	background-size: contain;
	border: 1px solid #dee2e6;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	-webkit-print-color-adjust: exact;
	color-adjust: exact;
    print-color-adjust: exact;
}
.justify-content-between {
    justify-content: space-between !important;
}

.d-flex {
    display: flex !important;
}
.row>* {
    flex-shrink: 0;
    width: 100%;
    max-width: 100%;
    padding-right: calc(1rem* .5);
    padding-left: calc(1rem* .5);
    margin-top: 1rem;
}

.form-check-input[type=checkbox] {
	border-radius: 0.25em;
}
.form-check-input:checked[type=checkbox] {
    --bs-form-check-bg-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+DQo8c3ZnIHdpZHRoPSIxMiIgaGVpZ2h0PSI5IiB2aWV3Qm94PSIwIDAgMTIgOSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgPHBhdGggZD0iTTQuNTc1IDguOTc3cy0uNDA0LS4wMDctLjUzNi0uMTY1TC4wNTcgNS42NGwuODI5LTEuMjI3TDQuNDcgNy4yNjggMTAuOTIxLjA4NmwuOTIzIDEuMTAzLTYuODYzIDcuNjRjLS4xMzQtLjAwMy0uNDA2LjE0OC0uNDA2LjE0OHoiIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPg0KPC9zdmc+);
	background-color: green !important;
}
.form-check-input:checked {
    background-color: #0d6efd;
    border-color: #0d6efd;
}
.form-check .form-check-input {
    float: left;
    margin-left: -1.5em;
}
.form-check-input[type=checkbox] {
    border-radius: 0.25em;
}
.text-muted {
	--bs-text-opacity: 1;
	color: rgba(33, 37, 41, 0.75) !important;
}
a.text-muted{
	text-decoration:underline;
}
.btn-success {
	--bs-btn-color: #fff;
	--bs-btn-bg: #198754;
	--bs-btn-border-color: #198754;
	--bs-btn-hover-color: #fff;
	--bs-btn-hover-bg: #157347;
	--bs-btn-hover-border-color: #146c43;
	--bs-btn-focus-shadow-rgb: 60, 153, 110;
	--bs-btn-active-color: #fff;
	--bs-btn-active-bg: #146c43;
	--bs-btn-active-border-color: #13653f;
	--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	--bs-btn-disabled-color: #fff;
	--bs-btn-disabled-bg: #198754;
	--bs-btn-disabled-border-color: #198754;
}

.link-success {
	color: RGBA(25, 135, 84, 0.8);
	-webkit-text-decoration-color: RGBA(25, 135, 84,
		0.8);
	text-decoration-color: RGBA(25, 135, 84,
		0.8);
}
.link-success:focus, .link-success:hover {
    color: RGBA(20, 108, 67, 1);
    -webkit-text-decoration-color: RGBA(20, 108, 67, 1);
    text-decoration-color: RGBA(20, 108, 67, 1);
}

[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled),
	button:not(:disabled) {
	cursor: pointer;
}
</style>
</head>
<body>
	<section class="my-lg-14 my-5">
		<div class="container">
			<!-- row -->
			<div class="row justify-content-center align-items-center">
				<!-- col -->
				<div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
					<div class="mb-lg-9 mb-3">
						<h1 class="mb-1 h2 fw-bold">
							Quên mật khẩu <span class="text-success-login">OGANI </span>
						</h1>
						<p>Hãy nhập mật khẩu mới của bạn</p>
					</div>

					<form id="userbean" class="pt-2" action="forgotPassword/newPassword.htm" method="post">
						<div class="row g-3">
							<!-- row -->

							<div class="col-12">
								<!-- input -->
								<input name="newPass" placeholder="Mật khẩu mới"
									type="password" class="form-control" required/>
							</div>
							<div class="col-12">
								<!-- input -->
								<input name="confirmPass" placeholder="Xác thực mật khẩu"
									type="password" class="form-control" required/>
							</div>
							<c:if test="${not empty message}">
								<div class="col-12">
									<span style="color: red;font-weight: 500;font-size: 16px;font-family: 'Cairo', sans-serif;line-height: 26px;">
									${message }</span>
								</div>
							</c:if>
							<!-- btn -->
							<div class="col-12 d-grid">
								<button
									class="btn btn-success btn-block  mb-3" type="submit">Đăng nhập</button>
							</div>

						</div>
					</form>
				</div>
			</div>

		</div>
		
	</section>
</body>

