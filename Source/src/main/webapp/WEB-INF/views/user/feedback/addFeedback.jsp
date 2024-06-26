<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<style>
.rating_container {
	display: flex;
}

.rating_container label {
	display: flex;
	color: #EDBB0E;
	align-items: center;
	margin-right: 20px;
	cursor: pointer
}

.rating_container input[type="radio"] {
	transform: scale(0.8);
}
.checkout__form{
	display:flex;
	justify-content: center;
}
.checkout__form input[type="submit"] {
	margin-left: auto;
	margin-right:auto
}
.checkout__submit{
	text-align:center
}
</style>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="/assets/user/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Shopping Cart</h2>
						<div class="breadcrumb__option">
							<a href="<c:url value="/index.htm"/>">Home</a> <span>Shopping
								Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				
				<form:form action="addFeedback.htm?productId=${product.productId}" modelAttribute="feedback">
				<h4>Đánh giá sản phẩm</h4>
					<div class="latest-prdouct__slider__item">
						<a
							href="<c:url value="/product-detail.htm?productId=${product.productId }"/>"
							class="latest-product__item">
							<div class="latest-product__item__pic">
								<img
									src="<c:url value="/assets/user/img/products/${product.image }"/>"
									alt="">
							</div>
							<div class="latest-product__item__text">
								<h3 style="font-size: 24px">${product.productName }</h3>
							</div>
						</a>
					</div>

					<div class="checkout__input">
						<p>
							Đánh giá chất lượng sản phẩm<span>*</span>
						</p>

						<div class="rating_container">
							<label> <form:radiobutton path="ratingStar" value="1" />
								<i class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i>
							</label> <label> <form:radiobutton path="ratingStar" value="2" />
								<i class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i>
							</label> <label> <form:radiobutton path="ratingStar" value="3" />
								<i class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i>
							</label> <label> <form:radiobutton path="ratingStar" value="4" />
								<i class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star-o"
								style="font-size: 20px; height: 17px; width: 18px;"></i>
							</label> <label> <form:radiobutton path="ratingStar" value="5" checked="checked"/>
								<i class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i> <i
								class="fa fa-star"
								style="font-size: 20px; height: 17px; width: 18px;"></i>
							</label>
						</div>
					</div>
					
			
					<div class="checkout__input">
						<p>Đánh giá chi tiết sản phẩm</p>
						<form:textarea path="feedbackContent" rows="4" cols="80" />
					</div>
					<div class="checkout__submit">
					<input type="submit" class="site-btn" value="HOÀN THÀNH" />
					</div>
			</div>
			</form:form>
		</div>
		</div>
	</section>
</body>
