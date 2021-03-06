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
                            <div class="card-header"></div>
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
                                                <th class="align-middle">Ng?????i D??ng</th>
                                                <th class="align-middle">S???n Ph???m</th>
                                                <th class="align-middle" style="width: 220px">N???i Dung</th>
                                                <th class="align-middle">??i???m</th>
                                                <th class="align-middle">Ng??y ????nh Gi??</th>
                                                <th class="align-middle">Ch???c N??ng</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${requestScope.reviews}" var="item">
                                                <tr class="text-center" >
                                                    <td class="align-middle">
                                                        ${item.customer.username}
                                                    </td>
                                                    <td class="align-middle">
                                                        <a href="${pageContext.request.contextPath}/admin/product/detail?id=${item.product.id}">${item.product.name}</a>
                                                    </td>
                                                    <td class="align-middle">
                                                            ${item.content}
                                                    </td>
                                                    <td class="align-middle">
                                                            ${item.rating}
                                                    </td>
                                                    <td class="align-middle">
                                                        <fmt:formatDate value="${item.createdAt}" pattern="dd/MM/yyyy, HH:mm"/>
                                                    </td>
                                                    <td class="align-middle">
                                                        <button class="btn btn-sm btn-round btn-danger waves-effect waves-light js-delete" data-id="${item.id}">
                                                            <i class="fa-solid fa-trash"></i>
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
        $(".js-delete").on("click", function() {
            const btn = $(this);
            const id = $(this).attr("data-id");
            if(confirm("B???n c?? ch???c ch???n mu???n x??a ????nh gi?? n??y ?")) {
                $.ajax({
                    url: '/admin/review/delete?id=' + id,
                    type: 'post'
                }).done(function() {
                    btn.closest("tr").remove();
                })
            }
        })
    });
</script>
