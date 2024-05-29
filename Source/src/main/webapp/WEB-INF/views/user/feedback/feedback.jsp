<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>Thông tin người dùng</title>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<base href="${pageContext.servletContext.contextPath}/">
<style>
@import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);

.comment-widgets {
	border: 2px solid #ddd;
	padding: 5px 15px;
	margin-bottom: 5px
}

.product-detail {
	display: flex;
	align-items: center;
	border-bottom: 1px solid #ddd;
	justify-content: space-between;
}

.product-detail .product-info {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.product-detail .product-info .product-image img {
	width: 120px;
	height: auto
}

.product-detail .product-info .product-name h3, .product-detail .product-price span
	{
	font-size: 16px;
}

.product-detail .product-price {
	margin-right: 10px
}

.edit-button {
	display: flex;
	justify-content: end;
	margin-right: 5px;
}

.edit-button a {
	border: none;
	color: orange;
	padding: 3px 10px;
}
</style>
</head>

<body>
	<script type="text/javascript">
		
	</script>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Page title -->
				<div class="my-5">
					<h3>Lịch sử đánh giá</h3>
					<hr>
				</div>
				<!-- Form START -->

				<div class="row mb-4 gx-5">
					<%@include file="/WEB-INF/views/layouts/user/account-menu.jsp"%>

					<div class="col-lg-8 feedback-list">
						<c:forEach var="item" items="${feedbacks }" varStatus="loop">
							<div class="comment-widgets m-b-20">
								<div class="p-2 product-detail">
									<div class="product-info">
										<div class="product-image">
											<img
												src="<c:url value="/assets/user/img/products/${item.product.image }"/>"
												alt="User photo" class="user-nav__user-photo">
										</div>
										<div class="product-name">
											<h3>${item.product.productName }</h3>
										</div>
									</div>
									<div class="product-price">
										<span><c:set var="formattedPrice">
												<fmt:formatNumber value="${item.product.price}"
													type="number" maxFractionDigits="0" />
											</c:set> ${formattedPrice}đ</span>
									</div>
								</div>
								<div class="p-2">
									<span class="round"> <img
										src="<c:url value="/assets/user/img/account/${item.account.avatar }"/>"
										alt="User photo" class="user-nav__user-photo">
									</span>
								</div>
								<div class="comment-text w-100 active">
									<h5>${item.account.getName() }</h5>
									<div>
										<c:set var="countStar" value="0"></c:set>
										<c:forEach begin="1" end="${item.ratingStar }">
											<i class="fa fa-star"
												style="font-size: 16px; height: 17px; width: 18px; margin-right: -2px; color: #EDBB0E;"></i>
											<c:set var="countStar" value="${countStar + 1 }"></c:set>
										</c:forEach>
										<c:if test="${item.ratingStar > countStar }">
											<i class="fa fa-star-half-o"
												style="font-size: 16px; height: 17px; width: 18px;"></i>
										</c:if>
									</div>
									<div class="comment-footer">
										<span class="date">${item.postingDate }</span> <span
											class="label label-success">Đã mua hàng</span> <span
											class="action-icons"> <a href="#" data-abc="true"><i
												class="fa fa-heart"></i></a>
										</span>
									</div>
									<p class="m-b-5 m-t-10">${item.feedbackContent }</p>
								</div>
								<div class="edit-button">
									<a href="EditFeedback.htm?productId=${item.product.productId}">Sửa</a>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>

				<!-- Row END -->

			</div>
		</div>
	</div>




	<div id="snippetContent">

		<!-- 		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
			integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
			crossorigin="anonymous">
 -->
	</div>
	<!-- Thư viện tìm kiếm cbb -->
	<!-- Include Select2 CSS -->

	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css"
		rel="stylesheet" />

	<!-- Include jQuery (cần thiết cho Select2) -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- Include Select2 JavaScript -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"
		defer></script>


</body>

</html>