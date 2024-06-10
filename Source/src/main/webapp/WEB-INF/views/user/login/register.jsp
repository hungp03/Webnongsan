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
#userbean .error{
	color: red
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
					<img src="<c:url value="/assets/user/img/signup-g.jpg"/>" alt=""
						class="img-fluid">
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
					<div class="mb-lg-9 mb-5" style="margin-bottom: 0px!important">
						<h1 class="mb-1 h2 fw-bold">Đăng ký</h1>
						<p>
							Chào mừng đến với <span style="color: #7fad39;">Ogani!</span> Hãy nhập vào thông tin của bạn để đăng nhập
						</p>
					</div>
					<!-- form -->
					<form:form id="userbean" action="register.htm"
						method="post" enctype="multipart/form-data"  modelAttribute="userBean">
						<div class="row g-3">
							<!-- col -->
							
							<div class="col">
								<!-- input -->
								<form:input path="firstName" placeholder="Họ"
									type="text" class="form-control " required="true"/>
								<form:errors path="firstName" cssClass="error"/>
							</div>
							
							<div class="col">
								<form:input path="lastName" placeholder="Tên"
									type="text" class="form-control " required="true"/>
								<form:errors path="lastName" cssClass="error"/>
							</div>
							<div class="col-12">

								<form:input path="email" placeholder="Địa chỉ Email" type="email"
									class="form-control" required="true"/>
								<form:errors path="email" cssClass="error"/>
							</div>
							<div class="col-12">
								<div class="password-field position-relative">
									<form:input path="password"
										placeholder="Nhập mật khẩu" type="password"
										class="form-control" required="true"/>
									<form:errors path="password" cssClass="error"/>
								</div>
							</div>
							<div class="col-12">
								<form:input path="phoneNumber"
									placeholder="Số điện thoại" type="text" class="form-control" autocomplete="off" id="phoneNumber"
									/>
								 <form:errors path="phoneNumber" cssClass="error"/>
							</div>
							<div class="col-12" style="display:flex;">
								<label for="avatar" style="margin-right:5px">Hình đại diện:</label> 
								<form:input path="avatar" id="avatar" type="file" class="form-control-file"/>
								<form:errors path="avatar" cssClass="error"/>
							</div>
							<!-- btn -->
							<c:if test="${not empty status}">
								<div class="col-12">
									<span style="color: red;font-weight: 500;padding: 4px 12px;font-size: 16px;font-family: 'Cairo', sans-serif;line-height: 26px;">
									${ status}</span>
								</div>
							</c:if>
							<div class="col-12 d-grid mb-5">
								<button name="update" type="submit" class="btn btn-success">Tiếp theo</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
</body>
