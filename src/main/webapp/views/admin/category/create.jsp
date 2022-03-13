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
                            <a href="${pageContext.request.contextPath}/admin/category">Danh sách thể loại </a>
                        </li>
                        <li class="breadcrumb-item">
                            Thêm
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Page-header end -->

    <form id="formInput" method="post" action="${pageContext.request.contextPath}/admin/category/create" enctype="multipart/form-data">
        <!-- Page-feature -->
        <div class="pcoded-inner-content text-right" style="margin-bottom: -80px">
            <div class="main-body">
                <div class="page-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <a href="javascript:history.go(-1)" class="btn btn-primary waves-effect waves-light" style="color: #fff">
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
                    <div class="row justify-content-center">
                        <div class="col-md-6 d-flex flex-column">
                            <div class="card" style="flex: 1">
                                <div class="card-header">
                                    <h5>Nhập thông tin</h5>
                                </div>
                                <div class="card-block">
                                    <div class="form-group">
                                        <label class="form-static-label" for="name">Tên thể loại</label>
                                        <input type="text" name="name" class="form-control" id="name">
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
                                        <label for="image">Hình ảnh</label>
                                        <input type="file" name="image" class="form-control" id="image">
                                    </div>
                                    <div class="form-group">
                                        <img src="" id="imagePreview" alt="Hình ảnh xem trước" style="width: 100px"/>
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
                name: {
                    required: true
                },
                image: {
                    required: true
                }
            },
            messages: {
                name: {
                    required: "Vui lòng nhập tên thể loại"
                },
                image: {
                    required: "Vui lòng chọn hình ảnh"
                }
            }
        });
    })
</script>