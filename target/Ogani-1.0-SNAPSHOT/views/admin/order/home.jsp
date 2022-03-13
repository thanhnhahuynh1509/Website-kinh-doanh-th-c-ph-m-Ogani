<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    </div>
                </div>
                <div class="col-md-4">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/admin"> <i class="fa fa-home"></i> </a>
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
                                <button onclick="window.location.href = '/admin/order/waiting'" class="btn btn-warning waves-effect waves-light"><i class="fa-solid fa-spinner"></i> Chờ Xử Lý</button>
                                <button onclick="window.location.href = '/admin/order/shipping'" class="btn btn-primary waves-effect waves-light"><i class="fa-solid fa-truck"></i> Đang Giao Hàng</button>
                                <button onclick="window.location.href = '/admin/order/success'" class="btn btn-success waves-effect waves-light"><i class="fa-solid fa-check"></i> Giao Hàng Thành Công</button>
                                <button onclick="window.location.href = '/admin/order/cancel'" class="btn btn-danger waves-effect waves-light"><i class="fa-solid fa-circle-xmark"></i> Hủy</button>
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
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                            <tr class="text-center">
                                                <th class="align-middle">Mã HĐ</th>
                                                <th class="align-middle">Họ Tên</th>
                                                <th class="align-middle">Địa Chỉ</th>
                                                <th class="align-middle">Ngày Đặt</th>
                                                <th class="align-middle">Trạng Thái</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${requestScope.orders}" var="item">
                                                <tr class="text-center" style="cursor: pointer" onclick="window.location.href = '/admin/order/detail?id=${item.id}'">
                                                    <td class="align-middle">
                                                        #${item.id}
                                                    </td>
                                                    <td class="align-middle">
                                                            ${item.recipientName}
                                                    </td>
                                                    <td class="align-middle">
                                                            ${item.recipientAddress}
                                                    </td>
                                                    <td class="align-middle">
                                                        <fmt:formatDate value="${item.orderDate}" pattern="dd/MM/yyyy, HH:mm"/>
                                                    </td>
                                                    <td class="align-middle">
                                                        <c:if test="${item.status.equals('Chờ xử lý')}">
                                                            <span class="badge badge-pill badge-warning"><i class="fa fa-spinner"></i> ${item.status}</span>
                                                        </c:if>
                                                        <c:if test="${item.status.equals('Đang giao hàng')}">
                                                            <span class="badge badge-primary"><i class="fa fa-truck-moving"></i> ${item.status}</span>
                                                        </c:if>
                                                        <c:if test="${item.status.equals('Giao hàng thành công')}">
                                                            <span class="badge badge-success"><i class="fa fa-check-circle"></i> ${item.status}</span>
                                                        </c:if>
                                                        <c:if test="${item.status.equals('Hủy')}">
                                                            <span class="badge badge-pill badge-danger"><i class="fa fa-times"></i> ${item.status}</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
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

    });
</script>
