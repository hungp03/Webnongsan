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
	transform: translateY(-50%);
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
    --bs-form-check-bg-image: url(https://png.pngtree.com/png-clipart/20190904/original/pngtree-check-icon-png-image_4479663.jpg);
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
				<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
					<!-- img -->
					<img src="<c:url value="/assets/user/img/signin-g.svg"/>" alt=""
						class="img-fluid">
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
					<div class="mb-lg-9 mb-3">
						<h1 class="mb-1 h2 fw-bold">
							Sign in to <span class="text-success-login">OGANI </span>
						</h1>
						<p>Welcome back to OGANI! Enter your email to get started.</p>
					</div>

					<form:form id="userbean" class="pt-2" action="login.htm" method="post" modelAttribute="user">
						<div class="row g-3">
							<!-- row -->

							<div class="col-12">
								<!-- input -->
								<form:input path="email" placeholder="Email address"
									type="email" class="form-control"/>
							</div>
							<div class="col-12">
								<!-- input -->
								<div class="password-field position-relative">
									<form:input path="password" placeholder="Password"
										type="password" class="form-control"/> 
								</div>

							</div>
							<div class="d-flex justify-content-between">
								<!-- form check -->
								<div class="form-check">
									<input id="flexCheckDefault" name="isRemember"
										class="form-check-input" type="checkbox" value="true"><input
										type="hidden" name="_isRemember" value="on">
									<!-- label -->
									<label class="form-check-label" for="flexCheckDefault">
										Remember me </label>
								</div>
								<div>
									<a data-bs-toggle="modal" data-bs-target="#exampleModal"
										class="text-muted" href="#">Forgot password?</a>
								</div>
							</div>
							<!-- btn -->
							<div class="col-12 d-grid">
								<button
									class="btn btn-success btn-block  mb-3" type="submit">Log
									in</button>
							</div>
							<!-- link -->
							<div>
								Do not have an account? <a href="<c:url value="register.htm"/>"
									class="link-success " previewlistener="true">Create new</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>

		</div>
	</section>
</body>
