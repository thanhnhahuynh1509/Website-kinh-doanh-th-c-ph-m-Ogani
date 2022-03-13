<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Ogani Admin</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <meta name="keywords"
          content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="Codedthemes"/>
    <!-- Favicon icon -->
    <link rel="icon" href="${pageContext.request.contextPath}/views/common/img/icon.png"
          type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/views/admin/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/pages/waves/css/waves.min.css"
          type="text/css" media="all">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/views/admin/assets/icon/themify-icons/themify-icons.css">
    <!-- feather icon -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/views/admin/assets/icon/feather/css/feather.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/views/admin/assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/admin/assets/css/style.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/views/admin/assets/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/common/css/common.css">
</head>

<body>
<style>
    .fixed-button {
        display: none;
    }

    .error {
        color: #ff3838;
    }
</style>
<!-- Pre-loader start -->
<div class="theme-loader">
    <div class="loader-track">
        <div class="preloader-wrapper">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Pre-loader end -->

<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
        <nav class="navbar header-navbar pcoded-header bg-ogani-main">
            <div class="navbar-wrapper">
                <div class="navbar-logo">
                    <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                        <i class="ti-menu"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin">
                        <img class="img-fluid"
                             src="${pageContext.request.contextPath}/views/admin/assets/images/logo.png"
                             alt="Theme-Logo"/>
                    </a>
                    <a class="mobile-options waves-effect waves-light">
                        <i class="ti-more"></i>
                    </a>
                </div>
                <div class="navbar-container container-fluid">
                    <ul class="nav-left">
                        <li>
                            <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                        </li>
                        <li>
                            <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                <i class="ti-fullscreen"></i>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav-right">
                        <li class="user-profile header-notification">
                            <a href="#" class="waves-effect waves-light">
                                <img src="${pageContext.request.contextPath}/upload/img/${sessionScope.admin.image}"
                                     onerror="this.src = '/upload/img/error.png'"
                                     class="img-radius" alt="User-Profile-Image"
                                style="height: 40px; object-fit: cover">
                                <span>${sessionScope.admin.name}</span>
                                <i class="ti-angle-down"></i>
                            </a>
                            <ul class="show-notification profile-notification">
                                <li class="waves-effect waves-light">
                                    <a href="${pageContext.request.contextPath}/admin/account/update?id=${sessionScope.admin.id}">
                                        <i class="ti-settings"></i> Cài đặt
                                    </a>
                                </li>
                                <li class="waves-effect waves-light">
                                    <a href="${pageContext.request.contextPath}/admin/account/detail?id=${sessionScope.admin.id}">
                                        <i class="ti-user"></i> Thông tin tài khoản
                                    </a>
                                </li>
                                <li class="waves-effect waves-light">
                                    <a href="${pageContext.request.contextPath}/admin/logout">
                                        <i class="ti-layout-sidebar-left"></i> Đăng xuất
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <nav class="pcoded-navbar">
                    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                    <div class="pcoded-inner-navbar main-menu">
                        <div class="">
                            <div class="main-menu-header">
                                <img class="img-80 img-radius"
                                     src="${pageContext.request.contextPath}/upload/img/${sessionScope.admin.image}"
                                     onerror="this.src = '/upload/img/error.png'"
                                     style="height: 60px; object-fit: cover"
                                     alt="User-Profile-Image">
                                <div class="user-details">
                                    <span id="more-details">${sessionScope.admin.name}</span>
                                </div>
                            </div>
                        </div>
                        <div class="pcoded-navigation-label">Tổng quát</div>
                        <ul class="pcoded-item pcoded-left-item">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/admin" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                    <span class="pcoded-mtext">Trang chủ</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                        </ul>
                        <div class="pcoded-navigation-label">Chức năng</div>
                        <ul class="pcoded-item pcoded-left-item">
                            <li class="pcoded-hasmenu">
                                <a href="javascript:void(0)" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>BC</b></span>
                                    <span class="pcoded-mtext">Quản lý</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class=" ">
                                        <a href="${pageContext.request.contextPath}/admin/category" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext">Thể loại</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="${pageContext.request.contextPath}/admin/product" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext">Sản phẩm</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="${pageContext.request.contextPath}/admin/order" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext">Hóa đơn</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="${pageContext.request.contextPath}/admin/review" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext">Đánh giá</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="${pageContext.request.contextPath}/admin/customer" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext">Tài khoản người dùng</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <c:if test="${sessionScope.admin.highLevel}">
                                        <li class=" ">
                                            <a href="${pageContext.request.contextPath}/admin/account" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="fa-solid fa-folder-gear"></i></span>
                                                <span class="pcoded-mtext">Tài khoản quản trị</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>