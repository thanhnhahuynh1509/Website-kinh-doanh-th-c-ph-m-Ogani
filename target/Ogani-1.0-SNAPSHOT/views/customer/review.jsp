<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="item" value="${requestScope.orderDetail}"/>
<jsp:include page="${pageContext.request.contextPath}/views/customer/header.jsp"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
         data-setbg="${pageContext.request.contextPath}/views/customer/assets/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Đánh Giá</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
                        <a href="${pageContext.request.contextPath}/customer-info">Tài Khoản</a>
                        <a href="${pageContext.request.contextPath}/orders">Đơn Hàng</a>
                        <span>Đánh Giá</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table mt-5">
                    <h4 class="text-center m-5">Đơn Hàng</h4>
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng giá</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="/upload/img/${item.product.image}" alt=""
                                         style="width: 110px; height: 110px; object-fit: cover">
                                    <h5>${item.product.name}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                        ${item.product.formatPrices(item.product.prices)} đ
                                </td>
                                <td class="shoping__cart__quantity">
                                        ${item.quantity}
                                </td>
                                <td class="shoping__cart__total">
                                        ${item.subTotalPrices} đ
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row flex-column align-items-center">
                    <h4 class="text-center m-3 py-3">Đánh giá</h4>
                    <div class="col-md-6">
                        <form action="${pageContext.request.contextPath}/review" method="post" id="formInput">
                            <input type="hidden" name="reviewId" value="${requestScope.review.id}">
                            <input type="hidden" name="productId" value="${requestScope.review.product.id}">
                            <div class="mb-3 checkout__input">
                                <div id="rateYo"></div>
                                <input type="hidden" id="star" name="star" value="${requestScope.review.rating}">
                            </div>
                            <div class="mb-3 checkout__input">
                                <label for="content" class="form-label">Nội dung</label>
                                <textarea id="content" rows="5" name="content" class="form-control">${requestScope.review.content}</textarea>
                            </div>
                            <div class="mb-3 text-right">

                                <button class="btn" style="width: 100%; background-color: #98cb4d; color: #fefef9">Đánh giá</button>
                                <c:if test="${requestScope.review.id != 0}">
                                    <a data-id="${requestScope.review.id}" class="btn" id="btn-delete" style="width: 18%; background-color: #cd3e3e; color: #fefef9; margin-top: 10px">Xóa</a>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->


<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script>
    $(document).ready(function() {
        $("#rateYo").rateYo({
            rating: $("#star").val(),
            halfStar: true,
            onSet: function(rating, rateYoInstance) {
                $("#star").val(rating);
            }
        });

        $("#btn-delete").on("click", function() {
            const id = $(this).attr("data-id");
            const btn = $(this)
            if(confirm("Bạn có chắc chắn muốn xóa đánh giá này ?")) {
                $.ajax({
                    url: '/delete-review?id=' + id,
                    type: 'get'
                }).done(function() {
                    btn.remove()
                    $("#content").empty();
                })
            }
        })
    })
</script>
