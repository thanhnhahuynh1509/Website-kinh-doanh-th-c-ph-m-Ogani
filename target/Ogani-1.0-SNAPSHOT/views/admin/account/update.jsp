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
                            ${requestScope.titlePage}
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Page-header end -->

    <form id="formInput" method="post" action="${pageContext.request.contextPath}/admin/account/update" enctype="multipart/form-data">
        <input type="hidden" value="${item.id}" name="id">
        <!-- Page-feature -->
        <div class="pcoded-inner-content text-right" style="margin-bottom: -80px">
            <div class="main-body">
                <div class="page-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <a href="${pageContext.request.contextPath}/admin/account" class="btn btn-primary waves-effect waves-light" style="color: #fff">
                                        <i class="fa-solid fa-rotate-left"></i> Trở lại
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/account/update-password?id=${item.id}" class="btn btn-warning waves-effect waves-light" style="color: #fff">
                                        <i class="fa-solid fa-key"></i> Đổi mật khẩu
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
                    <div class="row justify-content-center">
                        <div class="col-md-6 d-flex flex-column">
                            <div class="card" style="flex: 1">
                                <div class="card-header">
                                    <h5>Nhập thông tin</h5>
                                </div>
                                <div class="card-block">
                                    <div class="form-group">
                                        <label class="form-static-label" for="name">Họ tên <span style="color:red">(*)</span></label>
                                        <input type="text" name="name" value="${item.name}" class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="phone">Số điện thoại <span style="color:red">(*)</span></label>
                                        <input type="text" name="phone" value="${item.phone}" class="form-control" id="phone">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5>Nhập thông tin</h5>
                                </div>
                                <div class="card-block">
                                    <div class="form-group">
                                        <label class="form-static-label" for="address">Địa chỉ <span style="color:red">(*)</span></label>
                                        <input type="text" name="address" value="${item.address}" class="form-control" id="address">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="email">Email <span style="color:red">(*)</span></label>
                                        <input type="email" name="email" value="${item.email}" class="form-control" id="email">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="datepicker">Ngày sinh (tháng/ngày/năm) <span style="color:red">(*)</span></label>
                                        <input type="date" name="birthdate" value="${item.birthdateFormat}" class="form-control" id="datepicker">
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Hình ảnh <span style="color:red">(*)</span></label>
                                        <input type="file" name="image" class="form-control" id="image">
                                    </div>
                                    <div class="form-group">
                                        <img src="/upload/img/${item.image}" id="imagePreview" alt="Hình ảnh xem trước" style="width: 100px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!--  Page create end -->


</div>

<jsp:include page="${pageContext.request.contextPath}/views/admin/footer.jsp"/>

<script>

    $(document).ready(function () {

        $("#image").on('change', function () {

            const file = this.files[0];
            const reader = new FileReader();

            reader.onload = (e) => {
                $("#imagePreview").attr('src', e.target.result);
            }

            reader.readAsDataURL(file);
        })


        $("#formInput").validate({
            rules: {
                username: {
                    required: true,
                    minlength: 8
                },
                password: {
                    required: true,
                    minlength: 8
                },
                name: {
                    required: true
                },
                phone: {
                    required: true,
                    digits: true,
                    rangelength: [8, 11]
                },
                email: {
                    required: true,
                    email: true
                },
                address: {
                    required: true,
                },
                birthdate: {
                    required: true,
                    date: true
                }
            },
            messages: {
                username: {
                    required: "Vui lòng nhập tên tài khoản",
                    minlength: "Tên tài khoản không được bé hơn 8 ký tự"
                },
                password: {
                    required: "Vui lòng nhập mật khẩu",
                    minlength: "Mật khẩu không được dưới 8 ký tự"
                },
                name: {
                    required: "Vui lòng nhập họ tên"
                },
                phone: {
                    required: "Vui lòng nhập số điện thoại",
                    digits: "Số điện thoại không hợp lệ",
                    rangelength: "Số điện thoại không được ít hơn 8 số và lớn hơn 11"
                },
                email: {
                    required: "Email của bạn là gì?",
                    email: "Email không hợp lệ"
                },
                address: {
                    required: "Vui lòng nhập đỉa chỉ",
                },
                birthdate: {
                    required: "Vui lòng nhập ngày sinh",
                    date: true
                }
            }
        });
    })
</script>