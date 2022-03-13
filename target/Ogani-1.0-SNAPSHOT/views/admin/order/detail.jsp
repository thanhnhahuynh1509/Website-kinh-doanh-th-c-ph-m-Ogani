<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="${pageContext.request.contextPath}/views/admin/header.jsp"/>
<c:set value="${requestScope.order}" var="order"/>

<style>
    th {
        font-weight: 700;
    }
</style>

<div class="pcoded-content">
    <!-- Page-header start -->
    <div class="page-header">
        <div class="page-block">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="page-header-title">
                        <h5 class="m-b-10">${requestScope.titlePage}</h5>
                    </div>
                </div>
                <div class="col-md-4">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/admin"> <i class="fa fa-home"></i> </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/admin/order"> Danh sách hóa đơn </a>
                        </li>
                        <li class="breadcrumb-item">
                            ${requestScope.titlePage}
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Page-header end -->

    <!--  Page feature  -->
    <div class="pcoded-inner-content text-right" style="margin-bottom: -80px">
        <div class="main-body">
            <div class="page-wrapper">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <button onclick="window.location.href = '/admin/order'" class="btn btn-primary waves-effect waves-light"><i class="fa-solid fa-arrow-rotate-left"></i> Trở lại</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  Page feature end -->

    <!--  Page table  -->
    <div class="pcoded-inner-content">
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5>${requestScope.titlePage}</h5>
                                </div>
                                <div class="card-block table-border-style">
                                    <h3 class="mb-3">Đơn Hàng</h3>
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th class="align-middle">Mã Hóa Đơn</th>
                                                <td class="align-middle"> #${order.id}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Tên người nhận</th>
                                                <td class="align-middle"> ${order.recipientName}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Số điện thoại</th>
                                                <td class="align-middle"> ${order.recipientPhone}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Email</th>
                                                <td class="align-middle"> ${order.recipientEmail}</td>
                                            </tr>
                                            <tr >
                                                <th class="align-middle">Địa Chỉ</th>
                                                <td class="align-middle"> ${order.recipientAddress}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Ngày Đặt</th>
                                                <td class="align-middle"> <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy, HH:mm"/> </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Tổng Số Lượng</th>
                                                <td class="align-middle"> ${order.totalQuantity}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Tổng Tiền</th>
                                                <td class="align-middle"> ${order.formatPrices(order.totalPrices)} đ</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Được Cập Nhật Vào</th>
                                                <td class="align-middle"> <fmt:formatDate value="${order.updatedAt}" pattern="dd/MM/yyyy, HH:mm"/> </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Được Cập Nhật Bởi</th>
                                                <td class="align-middle">
                                                    <c:if test="${order.updatedBy != null}">
                                                        <a href="${pageContext.request.contextPath}/admin/account/detail?id=${order.updatedBy.id}"> ${order.updatedBy.name}</a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Trạng Thái</th>
                                                <td class="align-middle">
                                                    <c:if test="${order.status.equals('Chờ xử lý')}">
                                                        <span class="badge badge-pill badge-warning"><i class="fa fa-spinner"></i> ${order.status}</span>
                                                    </c:if>
                                                    <c:if test="${order.status.equals('Đang giao hàng')}">
                                                        <span class="badge badge-primary"><i class="fa fa-truck-moving"></i> ${order.status}</span>
                                                    </c:if>
                                                    <c:if test="${order.status.equals('Giao hàng thành công')}">
                                                        <span class="badge badge-success"><i class="fa fa-check-circle"></i> ${order.status}</span>
                                                    </c:if>
                                                    <c:if test="${order.status.equals('Hủy')}">
                                                        <span class="badge badge-pill badge-danger"><i class="fa fa-times"></i> ${order.status}</span>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <h3 class="mb-3 py-3">Chi Tiết</h3>
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th class="align-middle">Sản phẩm</th>
                                                <th class="align-middle text-center" >Số Lượng</th>
                                                <th class="align-middle text-center">Tổng Giá</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${order.orderDetails}" var="item">
                                                <tr>
                                                    <td class="align-middle">
                                                        <img src="/upload/img/${item.product.image}" alt="hinh anh" style="width: 100px; height: 100px; object-fit: cover"/>
                                                        <span> ${item.product.name}</span>
                                                    </td>
                                                    <td class="align-middle text-center">
                                                        ${item.quantity}
                                                    </td>
                                                    <td class="align-middle text-center">
                                                        ${item.subTotalPrices} đ
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="text-right">
                                        <c:if test="${!order.status.equals('Giao hàng thành công') && !order.status.equals('Hủy')}">
                                            <button class="btn btn-danger waves-effect waves-light btn-change-status" data-id="${order.id}" data-status="Hủy">
                                                <i class="fa-solid fa-xmark"></i> Hủy
                                            </button>
                                        </c:if>
                                        <c:if test="${order.status.equals('Chờ xử lý')}">
                                            <button class="btn btn-primary waves-effect waves-light btn-change-status" data-id="${order.id}" data-status="Đang giao hàng">
                                                <i class="fa-solid fa-truck"></i> Giao Hàng
                                            </button>
                                        </c:if>
                                        <c:if test="${order.status.equals('Đang giao hàng')}">
                                            <button class="btn btn-success waves-effect waves-light btn-change-status" data-id="${order.id}" data-status="Giao hàng thành công">
                                                <i class="fa-solid fa-circle-check"></i> Giao Hàng Thành Công
                                            </button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  Page end  -->

</div>

<jsp:include page="${pageContext.request.contextPath}/views/admin/footer.jsp"/>

<script>
    $(document).ready(function() {
        $(".btn-change-status").on('click', function() {
            const id = $(this).attr("data-id");
            const status = $(this).attr("data-status");

            if(confirm("Dữ liệu có mã số #" + id + " sẽ chuyển sang " + status)) {
                window.location.href = '/admin/order/change-status?id=' + id + "&status=" + status;
            }
        })
    });
</script>
