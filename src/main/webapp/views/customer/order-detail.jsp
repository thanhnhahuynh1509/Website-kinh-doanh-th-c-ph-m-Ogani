<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="order" value="${requestScope.order}"/>
<jsp:include page="${pageContext.request.contextPath}/views/customer/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
         data-setbg="${pageContext.request.contextPath}/views/customer/assets/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Chi Tiết</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
                        <a href="${pageContext.request.contextPath}/customer-info">Tài Khoản</a>
                        <a href="${pageContext.request.contextPath}/orders">Đơn Hàng</a>
                        <span>Chi Tiết</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="mb-5">
                    <h4 class="text-center m-5">Đơn Hàng</h4>
                    <table class="table table-bordered tb">
                        <tr>
                            <th>Mã Hóa Đơn</th>
                            <td>#${order.id}</td>
                        </tr>
                        <tr>
                            <th>Họ Tên</th>
                            <td>${order.recipientName}</td>
                        </tr>
                        <tr>
                            <th>Số điện thoại</th>
                            <td>${order.recipientPhone}</td>
                        </tr>
                        <tr>
                            <th>Địa Chỉ</th>
                            <td>${order.recipientAddress}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>${order.recipientEmail}</td>
                        </tr>
                        <tr>
                            <th>Ngày Đặt</th>
                            <td><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy, HH:mm" /></td>
                        </tr>
                        <tr>
                            <th>Tổng Giá</th>
                            <td>${order.formatPrices(order.totalPrices)} đ</td>
                        </tr>
                        <tr>
                            <th>Tổng Số Lượng</th>
                            <td>${order.totalQuantity}</td>
                        </tr>
                        <tr>
                            <th>Trạng Thái</th>
                            <td>
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
                <div class="shoping__cart__table mt-5">
                    <h4 class="text-center m-5">Chi Tiết</h4>
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng giá</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${order.orderDetails}">
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="/upload/img/${item.product.image}" alt=""
                                         style="width: 110px; height: 110px; object-fit: cover">
                                    <h5>${item.product.name}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                        ${item.product.formatPrices(item.product.prices - item.product.pricesSale)} đ <p style="font-size: 16px; font-weight: 600; color: #ef3030">(-${item.product.sale} %)</p>
                                </td>
                                <td class="shoping__cart__quantity">
                                        ${item.quantity}
                                </td>
                                <td class="shoping__cart__total">
                                        ${item.subTotalPrices} đ
                                </td>
                                <td>
                                    <c:if test="${order.status.equals('Giao hàng thành công')}">
                                        <a class="btn btn-info btn-sm text-light" href="${pageContext.request.contextPath}/review?orderId=${order.id}&orderDetailId=${item.id}">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <c:if test="${order.status.equals('Chờ xử lý')}">
                        <a id="btn-delete" data-id="${order.id}" class="btn btn-danger text-light"><i class="fa fa-times"></i> Hủy Đặt Hàng</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->


<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>

<script>
    $(document).ready(function() {
        $("#btn-delete").on("click", function() {
            if(confirm("Bạn có chắc chắn muốn hủy đơn hàng ?")) {
                window.location.href = '/cancel-order?id=' + $(this).attr("data-id");
            }
        })
    })
</script>
