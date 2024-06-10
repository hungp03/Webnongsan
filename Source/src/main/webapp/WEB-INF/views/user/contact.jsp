<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--Multiple Languages  -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<body>
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>Danh mục</span>
						</div>
						<ul>
							<c:forEach var="item" items="${categories}">
								<li><a
									href="<c:url value="/product.htm?categoryId=${item.categoryId }"/>">${item.name }</a></li>
							</c:forEach>

						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<%@ include file="/WEB-INF/views/layouts/user/searchbox.jsp"%>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>${company.phoneNumber }</h5>
								<span>Hỗ trợ 24/7</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="/assets/user/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Organi Shop</h2>
						<div class="breadcrumb__option">
							<a href="<c:url value="/index.htm" />">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<iframe style="width: 500px; height: 350px;"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.5103616667384!2d106.7870282!3d10.8487332!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752713471f5b15%3A0x1d5dddea640dad31!2zOTcgxJAuIE1hbiBUaGnhu4duLCBIaeG7h3AgUGjDuiwgUXXhuq1uIDksIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1685600738680!5m2!1svi!2s"
					style="border:0;" allowfullscreen="" loading="lazy"
					referrerpolicy="no-referrer-when-downgrade"></iframe>


			</div>
			<div class="col-md-6">
				<form:form class="row" method="post" modelAttribute="contactBean">

					<div class="col-md-12 mb-3">
						<!-- input -->
						<label class="form-label" for="title"> Tiêu đề</label>
						<form:input type="text" id="title" path="title"
							class="form-control" placeholder="Nhập vào tiêu đề"
							required="true" />
						<form:errors path="title" cssClass="text-danger" />
					</div>
					<div class="col-md-6 mb-3">
						<label class="form-label" for="emailContact">Email<span
							class="text-danger">*</span></label> 
							<form:input type="email"
							id="emailContact" path="emailContact" class="form-control"
							placeholder="Nhập vào email của bạn" required="true"/>
							<form:errors path="emailContact" cssClass="text-danger"/>
					</div>
					<div class="col-md-6 mb-3">
						<!-- input -->
						<label class="form-label" for="phone"> Điện thoại</label> 
						<form:input
							type="text" id="phone" path="phone" class="form-control"
							placeholder="Nhập vào số điện thoại của bạn" required="true"/>
						 <form:errors path="phone" cssClass="text-danger"/>
					</div>
					<div class="col-md-12 mb-3">
						<!-- input -->
						<label class="form-label" for="comments"> Nội dung</label>
						 <form:textarea path="comments" id="comments" rows="3" class="form-control" placeholder="Mô tả chi tiết vấn đề của bạn"/>
						  <form:errors path="comments" cssClass="text-danger"/>
					</div>
					<c:if test="${not empty message}">
						<div class="col-12">
							<span
								style="color: red; font-weight: 500; padding: 4px 12px; font-size: 16px; font-family: 'Cairo', sans-serif; line-height: 26px;">
								${ message}</span>
						</div>
					</c:if>
					<div class="col-md-12">
						<!-- btn -->
						<button type="submit" class="btn btn-success">Gửi</button>
					</div>
				</form:form>
			</div>
		</div>
		<section class="contact spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-6 text-center">
						<div class="contact__widget">
							<span class="icon_phone"></span>
							<h4>Phone</h4>
							<p>${company.phoneNumber }</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 text-center">
						<div class="contact__widget">
							<span class="icon_pin_alt"></span>
							<h4>Address</h4>
							<p>${company.address }</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 text-center">
						<div class="contact__widget">
							<span class="icon_clock_alt"></span>
							<h4>Open time</h4>
							<p>${ company.openTime}am to ${company.closeTime } pm</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 text-center">
						<div class="contact__widget">
							<span class="icon_mail_alt"></span>
							<h4>Email</h4>
							<p>${company.gmail }</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	</section>
</body>