<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>


<style>
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #ffffff;
	min-width: 140px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.avatar {
    border: none;
}

</style>


<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
	<div class="humberger__menu__logo">
		<a href="<c:url value="/assets/user/#"/>"><img
			src="<c:url value="/assets/user/img/logo.png"/>" alt=""></a>
	</div>
	<div class="humberger__menu__cart">
		<ul>
			<li><a href="<c:url value="/assets/user/#"/>"><i
					class="fa fa-heart"></i> <span> <c:if
							test="${not empty userInfo }">
						${wishlist.size() }
					</c:if>
				</span></a></li>
			<li><a href="<c:url value="/assets/user/#"/>"><i
					class="fa fa-shopping-bag"></i> <span> <c:if
							test="${not empty userInfo }">
						${carts.size() }
					</c:if>
				</span></a></li>
		</ul>
	</div>
	<div class="humberger__menu__widget">
		<%-- <div class="header__top__right__language">
			<img src="<c:url value="/assets/user/img/language.png"/>" alt="">
			<div>English</div>
			<span class="arrow_carrot-down"></span>
			<ul>
				<li><a href="<c:url value="/assets/user/#"/>">Spanis</a></li>
				<li><a href="<c:url value="/assets/user/#"/>">English</a></li>
			</ul>
		</div> --%>
	</div>
	<nav class="humberger__menu__nav mobile-menu">
		<ul id="menu">
			<li><a href="<c:url value="/index.htm"/>">Home</a></li>
			<li><a href="<c:url value="/product.htm"/>">Shop</a></li>
			<li><a href="<c:url value="/contact.htm"/>">Contact</a></li>
			<c:if test="${empty userInfo }">
				<li><a href="<c:url value="/login.htm"/>">Login</a></li>
			</c:if>
			<c:if test="${not empty userInfo }">
				<li><a href="<c:url value="/logout.htm"/>">Logout</a></li>
			</c:if>
		</ul>
	</nav>
	<div id="mobile-menu-wrap"></div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="<c:url value='/index.htm'/>"> <img
						src="<c:url value='/assets/user/img/logo.png'/>" alt="Logo"></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul id="menu">
						<li><a href="<c:url value="/index.htm"/>">Home</a></li>
						<li><a href="<c:url value="/product.htm"/>">Shop</a></li>
						<li><a href="<c:url value="/contact.htm"/>">Contact</a></li>
						<c:if test="${empty userInfo }">
							<li><a href="<c:url value="/login.htm"/>">Login</a></li>
						</c:if>
						<c:if test="${not empty userInfo}">
							<li><a href="<c:url value='/logout.htm'/>">Logout</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3 d-flex justify-content-end"
				style="padding-right: 0;">
				<div class="header__cart d-flex align-items-center">
					<ul class="d-flex align-items-center mb-0">
						<c:if test="${not empty userInfo}">
							<div class="user-menu dropdown pr-2">	
										<div class="dropdown">
											<div class="avatar">
											<c:choose>
											<c:when test="${not empty userInfo.avatar}">
												<img
													src="<c:url value='/assets/user/img/account/${userInfo.avatar}'/>"
													alt="User photo" class="user-nav__user-photo">
												</c:when>
											<c:otherwise>
												<img
													src="<c:url value='/assets/user/img/account/defaultavatar.png'/>"
													alt="#" class="user-nav__user-photo">
											</c:otherwise>
											</c:choose>
												
												<span
													class="user-nav__user-name">${userInfo.getName()}</span>
											</div>
											<div class="dropdown-content">
											<c:choose>
												<c:when test="${userInfo.getRole().getRoleId() == 'ADMIN'}">
													<a href="admin/dashboard.htm">Admin Page</a> 
												</c:when>
												<c:when test="${userInfo.getRole().getRoleId() == 'EMPLOYEE'}">
													<a href="employee/dashboard.htm">Employee Page</a> 
												</c:when>
											</c:choose>
												<a
													href="account/ProfilePage.htm">Profile</a>
											</div>
										</div>
							</div>

						</c:if>
						<li class="me-3"><a href="<c:url value='/wishlist.htm'/>"><i
								class="fa fa-heart"></i> <span>${not empty userInfo ? wishlist.size() : 0}</span></a></li>
						<li><a href="<c:url value='/cart.htm'/>"><i
								class="fa fa-shopping-bag"></i> <span>${not empty userInfo ? carts.size() : 0}</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>

