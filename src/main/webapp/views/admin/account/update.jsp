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
                                        <i class="fa-solid fa-rotate-left"></i> Tr??? l???i
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/account/update-password?id=${item.id}" class="btn btn-warning waves-effect waves-light" style="color: #fff">
                                        <i class="fa-solid fa-key"></i> ?????i m???t kh???u
                                    </a>
                                    <button type="submit" class="btn btn-success waves-effect waves-light">
                                        <i class="fa-solid fa-floppy-disk"></i> L??u
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
                                    <h5>Nh???p th??ng tin</h5>
                                </div>
                                <div class="card-block">
                                    <div class="form-group">
                                        <label class="form-static-label" for="name">H??? t??n <span style="color:red">(*)</span></label>
                                        <input type="text" name="name" value="${item.name}" class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="phone">S??? ??i???n tho???i <span style="color:red">(*)</span></label>
                                        <input type="text" name="phone" value="${item.phone}" class="form-control" id="phone">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5>Nh???p th??ng tin</h5>
                                </div>
                                <div class="card-block">
                                    <div class="form-group">
                                        <label class="form-static-label" for="address">?????a ch??? <span style="color:red">(*)</span></label>
                                        <input type="text" name="address" value="${item.address}" class="form-control" id="address">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="email">Email <span style="color:red">(*)</span></label>
                                        <input type="email" name="email" value="${item.email}" class="form-control" id="email">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="datepicker">Ng??y sinh (th??ng/ng??y/n??m) <span style="color:red">(*)</span></label>
                                        <input type="date" name="birthdate" value="${item.birthdateFormat}" class="form-control" id="datepicker">
                                    </div>
                                    <div class="form-group">
                                        <label for="image">H??nh ???nh <span style="color:red">(*)</span></label>
                                        <input type="file" name="image" class="form-control" id="image">
                                    </div>
                                    <div class="form-group">
                                        <img src="/upload/img/${item.image}" id="imagePreview" alt="H??nh ???nh xem tr?????c" style="width: 100px"/>
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
                    required: "Vui l??ng nh???p t??n t??i kho???n",
                    minlength: "T??n t??i kho???n kh??ng ???????c b?? h??n 8 k?? t???"
                },
                password: {
                    required: "Vui l??ng nh???p m???t kh???u",
                    minlength: "M???t kh???u kh??ng ???????c d?????i 8 k?? t???"
                },
                name: {
                    required: "Vui l??ng nh???p h??? t??n"
                },
                phone: {
                    required: "Vui l??ng nh???p s??? ??i???n tho???i",
                    digits: "S??? ??i???n tho???i kh??ng h???p l???",
                    rangelength: "S??? ??i???n tho???i kh??ng ???????c ??t h??n 8 s??? v?? l???n h??n 11"
                },
                email: {
                    required: "Email c???a b???n l?? g???",
                    email: "Email kh??ng h???p l???"
                },
                address: {
                    required: "Vui l??ng nh???p ?????a ch???",
                },
                birthdate: {
                    required: "Vui l??ng nh???p ng??y sinh",
                    date: true
                }
            }
        });
    })
</script>