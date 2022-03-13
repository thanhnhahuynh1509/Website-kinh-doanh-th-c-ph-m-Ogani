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
                                <button onclick="window.location.href = '/admin/account/not-active'"
                                        class="btn btn-warning waves-effect waves-light"><i class="fa-solid fa-ban"></i>
                                    Không hoạt động
                                </button>
                                <button onclick="window.location.href = '/admin/account/trash'"
                                        class="btn btn-danger waves-effect waves-light"><i
                                        class="fa-solid fa-trash"></i> Thùng rác
                                </button>
                                <button onclick="window.location.href = '/admin/account/create'"
                                        class="btn btn-success waves-effect waves-light"><i
                                        class="fa-solid fa-plus"></i> Thêm
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
                                    <h5>${requestScope.titlePage}</h5>
                                </div>
                                <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                            <tr class="text-center">
                                                <th class="align-middle">Mã số</th>
                                                <th class="align-middle">Hình ảnh</th>
                                                <th class="align-middle">Tên</th>
                                                <th class="align-middle">SĐT</th>
                                                <th class="align-middle">Ngày sinh</th>
                                                <th class="align-middle">Loại TK</th>
                                                <th class="align-middle">Trạng thái</th>
                                                <th class="align-middle">Chức năng</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${requestScope.admins}" var="item">
                                                <c:if test="${item.id != sessionScope.admin.id}">
                                                    <tr class="text-center">
                                                        <td style="cursor: pointer"
                                                            onclick="window.location.href = '/admin/account/detail?id=${item.id}'"
                                                            class="align-middle">#${item.id}</td>
                                                        <td style="cursor: pointer"
                                                            onclick="window.location.href = '/admin/account/detail?id=${item.id}'"
                                                            class="align-middle">
                                                            <img src="${pageContext.request.contextPath}/upload/img/${item.image}"
                                                                 alt="hinh anh"
                                                                 onerror="this.src = '${pageContext.request.contextPath}/upload/img/error.png'"
                                                                 style="width: 100px"/>
                                                        </td>
                                                        <td style="cursor: pointer"
                                                            onclick="window.location.href = '/admin/account/detail?id=${item.id}'"
                                                            class="align-middle">${item.name}</td>
                                                        <td style="cursor: pointer"
                                                            onclick="window.location.href = '/admin/account/detail?id=${item.id}'"
                                                            class="align-middle">
                                                                ${item.phone}
                                                        </td>
                                                        <td class="align-middle">
                                                            <c:if test="${item.birthdate != null}">
                                                                <fmt:formatDate value="${item.birthdate}" pattern="dd/MM/yyy"/>
                                                            </c:if>
                                                        </td>
                                                        <td class="align-middle">
                                                            <c:if test="${item.highLevel}">
                                                                <span>Tài khoản bậc cao</span>
                                                            </c:if>
                                                            <c:if test="${!item.highLevel}">
                                                                <span>Tài khoản bậc thấp</span>
                                                            </c:if>
                                                        </td>
                                                        <td class="align-middle">
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
                                                        <td class="align-middle">
                                                            <button class="btn btn-sm btn-round btn-success waves-effect waves-light js-not-active"
                                                                    data-id="${item.id}">
                                                                <i class="fa-solid fa-toggle-on"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-round btn-danger waves-effect waves-light js-trash"
                                                                    data-id="${item.id}">
                                                                <i class="fa-solid fa-trash" style="margin: 0"></i>
                                                            </button>
                                                        </td>

                                                    </tr>
                                                </c:if>
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
    $(document).ready(function () {
        $(".js-not-active").on('click', function (e) {
            const btn = $(this);

            if (confirm("Bạn có chắc chắn muốn chuyển trạng thái của dữ liệu sang không hoạt động?")) {
                $.ajax({
                    url: '/admin/account/not-active?id=' + btn.attr("data-id"),
                    type: 'POST'
                }).done(function (data) {
                    btn.closest("tr").remove();
                });
            }
        });

        $(".js-trash").on('click', function (e) {
            const btn = $(this);

            if (confirm("Bạn có chắc chắn muốn chuyển dữ liệu vào thùng rác?")) {
                $.ajax({
                    url: '/admin/account/trash?id=' + btn.attr("data-id"),
                    type: 'POST'
                }).done(function (data) {
                    btn.closest("tr").remove();
                });
            }
        });
    });
</script>
