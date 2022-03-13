<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="${pageContext.request.contextPath}/views/admin/header.jsp"/>
<c:set var="item" value="${requestScope.admin}"/>
<c:set var="birthdate" value="${item.birthdate.toLocalDateTime()}"/>
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
                            <a href="${pageContext.request.contextPath}/admin/account/update?id=${item.id}">Cập nhật tài khoản </a>
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

    <form id="formInput" method="post" action="${pageContext.request.contextPath}/admin/account/update-password">
        <input type="hidden" value="${item.id}" name="id">
        <!-- Page-feature -->
        <div class="pcoded-inner-content text-right" style="margin-bottom: -80px">
            <div class="main-body">
                <div class="page-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <a href="${pageContext.request.contextPath}/admin/account"
                                       class="btn btn-primary waves-effect waves-light" style="color: #fff">
                                        <i class="fa-solid fa-rotate-left"></i> Trở lại
                                    </a>
                                    <button type="submit" class="btn btn-success waves-effect waves-light">
                                        <i class="fa-solid fa-floppy-disk"></i> Lưu
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page-feature end -->

        <!--  Page create  -->

        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">
                    <p class="text-center text-danger" style="font-size: 16px">${requestScope.message}</p>
                    <div class="row justify-content-center">
                        <div class="col-md-6 d-flex flex-column">
                            <div class="card" style="flex: 1">
                                <div class="card-header">
                                    <h5>Nhập thông tin</h5>
                                </div>
                                <div class="card-block">
                                    <div class="form-group">
                                        <label class="form-static-label" for="name">Tên tài khoản</label>
                                        <input type="text" name="name" value="${item.username}" disabled
                                               class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="password">Mật khẩu cũ <span
                                                style="color:red">(*)</span></label>
                                        <input type="password" name="password"
                                               class="form-control" id="password">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="passwordNew">Mật khẩu mới <span
                                                style="color:red">(*)</span></label>
                                        <input type="password" name="passwordNew"
                                               class="form-control" id="passwordNew">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="passwordAgain">Nhập lại mật khẩu mới <span
                                                style="color:red">(*)</span></label>
                                        <input type="password" name="passwordAgain"
                                               class="form-control" id="passwordAgain">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Page create end -->


</div>

<jsp:include page="${pageContext.request.contextPath}/views/admin/footer.jsp"/>

<script>
    $(document).ready(function () {
        $("#formInput").validate({
            rules: {

                password: {
                    required: true,
                },
                passwordNew: {
                    required: true,
                    minlength: 8
                },
                passwordAgain: {
                    required: true,
                    minlength: 8,
                    equalTo: "#passwordNew"
                }
            },
            messages: {
                password: {
                    required: "Vui lòng nhập mật khẩu",
                },
                passwordNew: {
                    required: "Vui lòng nhập mật khẩu mới",
                    minlength: "Vui lòng nhập mật khẩu từ 8 ký tự trở lên"
                },
                passwordAgain: {
                    required: "Vui lòng nhập lại mật khẩu",
                    equalTo: "Mật khẩu không trùng khớp"
                }

            }
        });
    })
</script>