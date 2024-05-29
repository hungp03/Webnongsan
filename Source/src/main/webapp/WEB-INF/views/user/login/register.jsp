<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
<style>
.align-items-center {
	align-items: center !important;
}

.justify-content-center {
	justify-content: center !important;
}

.row {
	--bs-gutter-x: 1.5rem;
	--bs-gutter-y: 0;
	display: flex;
	flex-wrap: wrap;
	margin-top: calc(-1 * 0);
	margin-right: calc(-.5 * 1rem);
	margin-left: calc(-.5 * 1rem);
}

.row>* {
    flex-shrink: 0;
    width: 100%;
    max-width: 100%;
    padding-right: calc(1rem* .5);
    padding-left: calc(1rem* .5);
    margin-top: 1rem;
}

@media  only screen and ( min-width : 992px) {
	.order-lg-1 {
		order: 1 !important;
	}
	.col-lg-4 {
		flex: 0 0 auto !important;
		width: 33.33333333% !important;
	}
	.offset-lg-1 {
	margin-left: 8.33333333%;
}
}

.order-2 {
	order: 2 !important;
}

@media  only screen and ( min-width : 768px) {
	.col-md-6 {
		flex: 0 0 auto;
		width: 50%;
	}
}

.col-12 {
	flex: 0 0 auto;
	width: 100%;
}


.img-fluid {
	max-width: 100%;
	height: auto;
}

.mb-5 {
	margin-bottom: 3rem !important;
}
.fw-bold {
    font-weight: 700 !important;
}
.mb-1 {
    margin-bottom: 0.25rem !important;
}
.text-warning {
    --bs-text-opacity: 1;
    color: rgba(255,193,7, 1) !important;
}
.col {
    flex: 1 0 0%;
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
.col-12 {
    flex: 0 0 auto;
    width: 100%;
}
.d-grid {
    display: grid !important;
}

[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
    cursor: pointer;
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
.btn {
    --bs-btn-padding-x: 0.75rem;
    --bs-btn-padding-y: 0.375rem;
    --bs-btn-font-family: ;
    --bs-btn-font-size: 1rem;
    --bs-btn-font-weight: 400;
    --bs-btn-line-height: 1.5;
    --bs-btn-color: #212529;
    --bs-btn-bg: transparent;
    --bs-btn-border-width: 1px;
    --bs-btn-border-color: transparent;
    --bs-btn-border-radius:0.375rem;
    --bs-btn-hover-border-color: transparent;
    --bs-btn-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px rgba(0, 0, 0, 0.075);
    --bs-btn-disabled-opacity: 0.65;
    --bs-btn-focus-box-shadow: 0 0 0 0.25rem rgba(60,153,110, .5);
    display: inline-block;
    padding: 0.375rem 0.375rem*2;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: fff;
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
    border: 1px solid #198754;
    border-radius:0.375rem;
    background-color: #198754;
    transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
input[type="file" i] {
    appearance: none;
    background-color: initial;
    cursor: default;
    align-items: baseline;
    color: inherit;
    text-overflow: ellipsis;
    text-align: start !important;
    padding: initial;
    border: initial;
    white-space: pre;
    overflow: hidden !important;
}
.link-success {
	color: RGBA(25, 135, 84, 0.5);
	-webkit-text-decoration-color: RGBA(25, 135, 84,
		0.5);
	text-decoration-color: RGBA(25, 135, 84,
		0.5);
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
label {
    display: inline-block;
}
</style>
</head>
<body>
	<section class="my-lg-14 my-8">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row justify-content-center align-items-center">
				<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
					<!-- img -->
					<img src="<c:url value="/assets/user/img/signup-g.svg"/>" alt=""
						class="img-fluid">
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
					<div class="mb-lg-9 mb-5" style="margin-bottom: 0px!important">
						<h1 class="mb-1 h2 fw-bold">Đăng ký</h1>
						<p>
							Chào mừng đến với <span class="text-warning">Ogani!</span> Hãy nhập vào thông tin của bạn để đăng nhập
						</p>
					</div>
					<!-- form -->
					<form id="userbean" action="register.htm"
						method="post" enctype="multipart/form-data">
						<div class="row g-3">
							<!-- col -->
							
							<div class="col">
								<!-- input -->
								<input name="firstName" placeholder="Họ"
									type="text" class="form-control " />

							</div>
							
							<div class="col">
								<input name="lastName" placeholder="Tên"
									type="text" class="form-control "/>
							</div>
							<div class="col-12">

								<input name="email" placeholder="Địa chỉ Email" type="email"
									class="form-control"/>

							</div>
							<div class="col-12">
								<div class="password-field position-relative">
									<input name="mật khẩu"
										placeholder="Nhập mật khẩu" type="password"
										class="form-control"/>

								</div>
							</div>
							<div class="col-12">
								<input name="phoneNumber"
									placeholder="Số điện thoại" type="text" class="form-control"
									/>

							</div>
							<div class="col-12" style="display:flex;">
								<label for="avatar" style="margin-right:5px">Hình đại diện:</label> 
								<input name="avatar" id="avatar" type="file" class="form-control-file"/>

							</div>
							<!-- btn -->
							<c:if test="${not empty status}">
								<div class="col-12">
									<span style="color: red;font-weight: 500;padding: 4px 12px;font-size: 16px;font-family: 'Cairo', sans-serif;line-height: 26px;">
									${ status}</span>
								</div>
							</c:if>
							<div class="col-12 d-grid">
								<button name="update" type="submit" class="btn btn-success">Tiếp theo</button>
							</div>

							<!-- text -->
							<p>
								<small>Bằng việc nhấn tiếp tục bạn đã đồng ý với điều khoản dịch vụ của chúng tôi <a
									class="link-success" href="#!"> Điều khoản dịch vụ</a> &amp; <a
									class="link-success" href="#!">Chính sách bảo mật</a></small>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
