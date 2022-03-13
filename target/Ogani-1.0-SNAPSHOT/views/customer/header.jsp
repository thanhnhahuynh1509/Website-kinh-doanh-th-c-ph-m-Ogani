<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/7/2022
  Time: 3:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
<c:set value="${sessionScope.customerSession}" var="customerSession" />
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani Shop</title>
    <link rel="icon" href="${pageContext.request.contextPath}/views/common/img/icon.png"
          type="image/x-icon">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/customer/assets/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/customer/assets/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/customer/assets/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/customer/assets/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/customer/assets/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/customer/assets/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/customer/assets/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/customer/assets/css/style.css" type="text/css">

</head>

<body>
<style>
    .error {
        margin-top: 5px;
        color: #ff2f2f;
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
        <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/views/customer/assets/img/logo.png" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="${pageContext.request.contextPath}/wishlist"><i class="fa fa-heart"></i> <span class="wishlist">${sessionScope.customerSession.wishlist.size()}</span></a></li>
            <li><a href="${pageContext.request.contextPath}/shopping-cart"><i class="fa fa-shopping-bag"></i> <span class="carts">${requestScope.cartSize}</span></a></li>
        </ul>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__auth">
            <c:if test="${customerSession == null}">
                <a href="${pageContext.request.contextPath}/login"><i class="fa fa-user"></i> Đăng nhập</a>
            </c:if>
            <c:if test="${customerSession != null}">
                <a href="${pageContext.request.contextPath}/customer-info"><i class="fa fa-user"></i> ${customerSession.username}</a>
            </c:if>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/shop">Cửa hàng</a></li>
            <li><a href="./blog.html">Bài viết</a></li>
            <li><a href="./contact.html">Liên hệ</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> thanhnhahuynh1509@gmail.com</li>
            <li>Chào mừng bạn đến với Ogani</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> thanhnhahuynh1509@gmail.com</li>
                            <li>Chào mừng bạn đến với Ogani</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__auth">
                            <c:if test="${customerSession == null}">
                                <a href="${pageContext.request.contextPath}/login"><i class="fa fa-user"></i> Đăng nhập</a>
                            </c:if>
                            <c:if test="${customerSession != null}">
                                <a href="${pageContext.request.contextPath}/customer-info"><i class="fa fa-user"></i> ${customerSession.username}</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/views/customer/assets/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                        <li><a href="${pageContext.request.contextPath}/shop">Cửa hàng</a></li>
                        <li><a href="./blog.html">Bài viết</a></li>
                        <li><a href="./contact.html">Liên hệ</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/wishlist"><i class="fa fa-heart"></i> <span class="wishlist">${sessionScope.customerSession.wishlist.size()}</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/shopping-cart"><i class="fa fa-shopping-bag"></i> <span class="carts">${requestScope.cartSize}</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->
