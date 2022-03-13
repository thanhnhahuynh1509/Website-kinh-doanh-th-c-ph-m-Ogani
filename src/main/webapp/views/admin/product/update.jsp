<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<jsp:include page="${pageContext.request.contextPath}/views/admin/header.jsp"/>
<c:set var="item" value="${requestScope.product}"/>

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
                            <a href="${pageContext.request.contextPath}/admin/product">Danh sách sản phẩm </a>
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

    <form id="formInput" method="post" action="${pageContext.request.contextPath}/admin/product/update" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${item.id}">
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
                                        <label class="form-static-label" for="name">Tên sản phẩm <span style="color:red">(*)</span></label>
                                        <input type="text" value="${item.name}" name="name" class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="categoryId">Thể loại <span style="color:red">(*)</span></label>
                                        <select type="text" name="categoryId" class="form-control" id="categoryId">
                                            <c:forEach var="c" items="${requestScope.categories}">
                                                <c:if test="${c.id == item.category.id}">
                                                    <option value="${c.id}" selected>${c.name}</option>
                                                </c:if>
                                                <c:if test="${c.id != item.category.id}">
                                                    <option value="${c.id}">${c.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="prices">Giá (đ) <span style="color:red">(*)</span></label>
                                        <input type="number" name="prices" value="${item.prices}" class="form-control" min="0" id="prices">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="sale">Giảm giá (%) <span style="color:red">(*)</span></label>
                                        <input type="number" name="sale" value="${item.sale}" class="form-control" min="0" id="sale">
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
                                        <label class="form-static-label" for="weight">Cân nặng (kg) <span style="color:red">(*)</span></label>
                                        <input type="number" name="weight" value="${item.weight}" class="form-control" min="0" id="weight">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-static-label" for="description">Mô tả <span style="color:red">(*)</span></label>
                                        <textarea class="form-control" rows="3" id="description" name="description">${item.description}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Hình ảnh</label>
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
                name: {
                    required: true
                },
                categoryId: {
                    required: true
                },
                prices: {
                    required: true,
                    min: 1000
                },
                sale: {
                    required: true,
                    range: [0, 100]
                },
                weight: {
                    required: true
                },
                description: {
                    required: true
                }
            },
            messages: {
                name: {
                    required: "Vui lòng nhập tên thể loại"
                },
                categoryId: {
                    required: "Vui lòng chọn loại cho sản phẩm"
                },
                prices: {
                    required: "Vui lòng nhập giá sản phẩm",
                    min: "Giá phải từ 1000 đ trở lên"
                },
                sale: {
                    required: "Vui lòng nhập giảm giá",
                    range: "Giảm giá từ 0% - 100%"
                },
                weight: {
                    required: "Vui lòng nhập cân nặng",
                    min: "Cân nặng không hợp lệ"
                },
                description: {
                    required: "Vui lòng nhập mô tả sản phẩm"
                }
            }
        });
    })
</script>