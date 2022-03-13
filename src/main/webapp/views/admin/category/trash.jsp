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
                            <a href="${pageContext.request.contextPath}/admin/category">Danh sách thể loại</a>
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
                                <button onclick="window.location.href = '/admin/category'" class="btn btn-primary waves-effect waves-light">
                                    <i class="fa-solid fa-rotate-left"></i> Trở về
                                </button>
                            </div>
                            <div class="card-body">
                                <p style="color:#ff2828; font-size: 16px" class="text-center">${requestScope.message}</p>
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
                                                <th class="align-middle">Ngày tạo</th>
                                                <th class="align-middle">Trạng thái</th>
                                                <th class="align-middle">Chức năng</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${requestScope.categories}" var="item">
                                                <tr class="text-center" >
                                                    <td style="cursor: pointer" onclick="window.location.href = '/admin/category/detail?id=${item.id}'" class="align-middle">#${item.id}</td>
                                                    <td style="cursor: pointer" onclick="window.location.href = '/admin/category/detail?id=${item.id}'" class="align-middle">
                                                        <img src="${pageContext.request.contextPath}/upload/img/${item.image}" alt="hinh anh" onerror="this.src = '${pageContext.request.contextPath}/upload/img/error.png'" style="width: 100px"/>
                                                    </td>
                                                    <td style="cursor: pointer" onclick="window.location.href = '/admin/category/detail?id=${item.id}'" class="align-middle">${item.name}</td>
                                                    <td class="align-middle">
                                                        <fmt:formatDate value="${item.createdAt}" pattern="dd/MM/yyy" />
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
                                                        <button class="btn btn-sm btn-round btn-secondary waves-effect waves-light js-restore" data-id="${item.id}">
                                                            <i class="fa-solid fa-trash-arrow-up"></i>
                                                        </button>
                                                        <button onclick="window.location.href = '/admin/category/confirm-delete?id=${item.id}'" class="btn btn-sm btn-round btn-danger waves-effect waves-light" data-id="${item.id}">
                                                            <i class="fa-solid fa-xmark"></i>
                                                        </button>
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
        $(".js-restore").on('click', function(e) {
            const btn = $(this);

            if(confirm("Bạn có chắc chắn muốn khôi phục dữ liệu?")) {
                $.ajax({
                    url: '/admin/category/active?id=' + btn.attr("data-id"),
                    type: 'POST'
                }).done(function (data) {
                    btn.closest("tr").remove();
                });
            }
        });
    });
</script>
