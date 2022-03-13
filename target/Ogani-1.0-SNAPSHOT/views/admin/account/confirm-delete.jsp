<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="${pageContext.request.contextPath}/views/admin/header.jsp"/>
<c:set var="item" value="${requestScope.admin}"/>
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
                                <button onclick="javascript:history.go(-1)"
                                        class="btn btn-primary waves-effect waves-light">
                                    <i class="fa-solid fa-rotate-left"></i> Trở về
                                </button>
                                <button onclick="window.location.href='/admin/account/delete?id=${item.id}'"
                                        class="btn btn-danger waves-effect waves-light">
                                    <i class="fa-solid fa-trash"></i> Xóa
                                </button>
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
                                    <h5>Bạn có chắc chắn muốn xóa</h5>
                                </div>
                                <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th class="align-middle">Mã số</th>
                                                <td>#${item.id}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Hình ảnh</th>
                                                <td>
                                                    <img src="${pageContext.request.contextPath}/upload/img/${item.image}"
                                                         alt="hinh anh"
                                                         onerror="this.src = '${pageContext.request.contextPath}/upload/img/error.png'"
                                                         style="width: 100px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Tên</th>
                                                <td>${item.name}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Địa chỉ</th>
                                                <td>${item.address}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Số điện thoại</th>
                                                <td>${item.phone}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Email</th>
                                                <td>${item.email}</td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Ngày tháng năm sinh</th>
                                                <td>
                                                    <fmt:formatDate value="${item.birthdate}" pattern="dd/MM/yyy"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Loại tài khoản</th>
                                                <td>
                                                    <c:if test="${item.highLevel}">
                                                        <span>Tài khoản bậc cao</span>
                                                    </c:if>
                                                    <c:if test="${!item.highLevel}">
                                                        <span>Tài khoản bậc thấp</span>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">Trạng thái</th>
                                                <td>
                                                    <c:if test="${item.status.equals('Hoạt động')}">
                                                        <label class="badge badge-success">${item.status}</label>
                                                    </c:if>
                                                    <c:if test="${item.status.equals('Không hoạt động')}">
                                                        <label class="badge badge-warning">${item.status}</label>
                                                    </c:if>
                                                    <c:if test="${item.status.equals('Rác')}">
                                                        <label class="badge badge-danger">${item.status}</label>
                                                    </c:if>
                                                </td>
                                            </tr>
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
