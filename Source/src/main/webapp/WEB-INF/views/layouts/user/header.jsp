<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp" %>
	
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="<c:url value="/assets/user/#"/>"><img src="<c:url value="/assets/user/img/logo.png"/>" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="<c:url value="/assets/user/#"/>"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="<c:url value="/assets/user/#"/>"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="<c:url value="/assets/user/img/language.png"/>" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="<c:url value="/assets/user/#"/>">Spanis</a></li>
                    <li><a href="<c:url value="/assets/user/#"/>">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="<c:url value="/assets/user/#"/>"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="<c:url value="/assets/user/./index.html"/>">Home</a></li>
                <li><a href="<c:url value="/assets/user/./shop-grid.html"/>">Shop</a></li>
                <li><a href="<c:url value="/assets/user/#"/>">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="<c:url value="/assets/user/./shop-details.html"/>">Shop Details</a></li>
                        <li><a href="<c:url value="/assets/user/./shoping-cart.html"/>">Shoping Cart</a></li>
                        <li><a href="<c:url value="/assets/user/./checkout.html"/>">Check Out</a></li>
                        <li><a href="<c:url value="/assets/user/./blog-details.html"/>">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="<c:url value="/assets/user/./blog.html"/>">Blog</a></li>
                <li><a href="<c:url value="/assets/user/./contact.html"/>">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="<c:url value="/assets/user/#"/>"><i class="fa fa-facebook"></i></a>
            <a href="<c:url value="/assets/user/#"/>"><i class="fa fa-twitter"></i></a>
            <a href="<c:url value="/assets/user/#"/>"><i class="fa fa-linkedin"></i></a>
            <a href="<c:url value="/assets/user/#"/>"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
      <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="<c:url value="/assets/user/./index.html"/>"><img src="<c:url value="/assets/user/img/logo.png"/>" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="<c:url value="/home"/>">Home</a></li>
                            <li><a href="<c:url value="/assets/user/./shop-grid.html"/>">Shop</a></li>
                            <li><a href="<c:url value="/assets/user/#"/>">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="<c:url value="/assets/user/./shop-details.html"/>">Shop Details</a></li>
                                    <li><a href="<c:url value="/assets/user/./shoping-cart.html"/>">Shoping Cart</a></li>
                                    <li><a href="<c:url value="/assets/user/./checkout.html"/>">Check Out</a></li>
                                    <li><a href="<c:url value="/assets/user/./blog-details.html"/>">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="<c:url value="/assets/user/./contact.html"/>">Contact</a></li>
                            <li><a href="<c:url value="/login"/>">Login</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="<c:url value="/assets/user/#"/>"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="<c:url value="/assets/user/#"/>"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
