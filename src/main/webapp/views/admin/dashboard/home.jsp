<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="${pageContext.request.contextPath}/views/admin/header.jsp"/>

<div class="pcoded-content">
    <!-- Page-header start -->
    <div class="page-header">
        <div class="page-block">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="page-header-title">
                        <h5 class="m-b-10">${requestScope.titlePage}</h5>
                        <p class="m-b-0">Chào mừng quay trở lại</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/admin"> <i class="fa fa-home"></i> </a>
                        </li>
                        <li class="breadcrumb-item"> ${requestScope.titlePage}
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Page-header end -->
    <div class="pcoded-inner-content">
        <!-- Main-body start -->
        <div class="main-body">
            <div class="page-wrapper">
                <!-- Page-body start -->
                <div class="page-body">
                    <div class="row">
                        <!-- Material statustic card start -->
                        <div class="col-xl-4 col-md-12">
                            <div class="card mat-stat-card">
                                <div class="card-block">
                                    <div class="row align-items-center b-b-default">
                                        <div class="col-sm-6 b-r-default p-b-20 p-t-20">
                                            <div class="row align-items-center text-center">
                                                <div class="col-4 p-r-0">
                                                    <i class="fa-solid fa-user text-c-purple f-24"></i>
                                                </div>
                                                <div class="col-8 p-l-0">
                                                    <h5>${requestScope.totalUser}</h5>
                                                    <p class="text-muted m-b-0">Người Dùng</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 p-b-20 p-t-20">
                                            <div class="row align-items-center text-center">
                                                <div class="col-4 p-r-0">
                                                    <i class="fa-solid fa-hammer text-c-green f-24"></i>
                                                </div>
                                                <div class="col-8 p-l-0">
                                                    <h5>${requestScope.totalAdmin}</h5>
                                                    <p class="text-muted m-b-0">Quản trị viên</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-sm-6 p-b-20 p-t-20 b-r-default">
                                            <div class="row align-items-center text-center">
                                                <div class="col-4 p-r-0">
                                                    <i class="fa-solid fa-heart text-c-red f-24"></i>
                                                </div>
                                                <div class="col-8 p-l-0">
                                                    <h5>${requestScope.totalWishList}</h5>
                                                    <p class="text-muted m-b-0">Lượt Thích</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 p-b-20 p-t-20">
                                            <div class="row align-items-center text-center">
                                                <div class="col-4 p-r-0">
                                                    <i class="fa-solid fa-store text-c-blue f-24"></i>
                                                </div>
                                                <div class="col-8 p-l-0">
                                                    <h5>${requestScope.totalProduct}</h5>
                                                    <p class="text-muted m-b-0">Tổng sản phẩm</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-12">
                            <div class="card mat-stat-card">
                                <div class="card-block">
                                    <div class="row align-items-center b-b-default">
                                        <div class="col-sm-6 b-r-default p-b-20 p-t-20">
                                            <div class="row align-items-center text-center">
                                                <div class="col-4 p-r-0">
                                                    <i class="fa-solid fa-box text-c-purple f-24"></i>
                                                </div>
                                                <div class="col-8 p-l-0">
                                                    <h5>${requestScope.totalOrder}</h5>
                                                    <p class="text-muted m-b-0">Tổng đơn hàng</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 p-b-20 p-t-20">
                                            <div class="row align-items-center text-center">
                                                <div class="col-4 p-r-0">
                                                    <i class="fas fa-sitemap text-c-green f-24"></i>
                                                </div>
                                                <div class="col-8 p-l-0">
                                                    <h5>${requestScope.totalCategory}</h5>
                                                    <p class="text-muted m-b-0">Tổng thể loại</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-sm-6 p-b-20 p-t-20 b-r-default">
                                            <div class="row align-items-center text-center">
                                                <div class="col-4 p-r-0">
                                                    <i class="fa-solid fa-ban text-c-red f-24"></i>
                                                </div>
                                                <div class="col-8 p-l-0">
                                                    <h5>${requestScope.totalOrderCancel}</h5>
                                                    <p class="text-muted m-b-0">Đơn hàng bị hủy</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 p-b-20 p-t-20">
                                            <div class="row align-items-center text-center">
                                                <div class="col-4 p-r-0">
                                                    <i class="fa-solid fa-pen text-c-blue f-24"></i>
                                                </div>
                                                <div class="col-8 p-l-0">
                                                    <h5>${requestScope.totalReview}</h5>
                                                    <p class="text-muted m-b-0">Tổng đánh giá</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-12">
                            <div class="card mat-clr-stat-card text-white green ">
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-3 text-center bg-c-green">
                                            <i class="fas fa-trophy mat-icon f-24"></i>
                                        </div>
                                        <div class="col-9 cst-cont">
                                            <h5>${requestScope.totalRevenues} đ</h5>
                                            <p class="m-b-0">Tổng doanh thu</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mat-clr-stat-card text-white blue">
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-3 text-center bg-c-blue">
                                            <i class="fas fa-star mat-icon f-24"></i>
                                        </div>
                                        <div class="col-9 cst-cont">
                                            <h5>${requestScope.averageReview}</h5>
                                            <p class="m-b-0">Đánh giá trung bình các sản phẩm</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Material statustic card end -->
                        <!-- order-visitor start -->


                        <!-- order-visitor end -->

                        <!--  sale analytics start -->
                        <div class="col-xl-6 col-md-12">
                            <div class="card table-card">
                                <div class="card-header">
                                    <h5>Sản phẩm bán chạy nhất</h5>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                            <li><i class="fa fa-window-maximize full-card"></i></li>
                                            <li><i class="fa fa-minus minimize-card"></i></li>
                                            <li><i class="fa fa-refresh reload-card"></i></li>
                                            <li><i class="fa fa-trash close-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="table-responsive">
                                        <table class="table table-hover m-b-0 without-header">
                                            <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th class="text-right">Số lượng</th>
                                                <th class="text-right">Tổng giá</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${requestScope.productBestSeller}">
                                                <tr>
                                                    <td>
                                                        <div class="d-inline-block align-middle">
                                                            <img src="/upload/img/${item.product.image}" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                            <div class="d-inline-block">
                                                                <h6>${item.product.name}</h6>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <h6 class="f-w-700">${item.quantity}</h6>
                                                    </td>
                                                    <td class="text-right">
                                                        <h6 class="f-w-700">${item.formatPrices(item.totalPrices)} đ</h6>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-12">
                            <div class="row">
                                <!-- sale card start -->

                                <div class="col-md-6">
                                    <div class="card text-center order-visitor-card" onclick="window.location.href = '/admin/order/waiting'">
                                        <div class="card-block">
                                            <h6 class="m-b-0">Đơn hàng đang chờ</h6>
                                            <h4 class="m-t-15 m-b-15"><i class="fa-solid fa-spinner m-r-15 text-c-yellow"></i>${requestScope.totalOrderWaiting}</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card text-center order-visitor-card" onclick="window.location.href = '/admin/order/shipping'">
                                        <div class="card-block">
                                            <h6 class="m-b-0">Đơn hàng đang giao</h6>
                                            <h4 class="m-t-15 m-b-15"><i class="fa-solid fa-truck m-r-15 text-c-blue"></i>${requestScope.totalOrderShipping}</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card bg-c-yellow total-card">
                                        <div class="card-block">
                                            <div class="text-left">
                                                <h4>${requestScope.totalRevenuesWaiting} đ</h4>
                                                <p class="m-0">Tổng tiền hàng đang chờ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card bg-c-green total-card">
                                        <div class="card-block">
                                            <div class="text-left">
                                                <h4>${requestScope.totalRevenuesShipping} đ</h4>
                                                <p class="m-0">Tổng tiền hàng đang giao</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- sale card end -->
                            </div>
                        </div>
                        <!--  sale analytics end -->

                    </div>
                </div>
                <!-- Page-body end -->
            </div>
            <div id="styleSelector"> </div>
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/views/admin/footer.jsp"/>
