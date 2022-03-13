<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="${pageContext.request.contextPath}/views/customer/header.jsp"/>

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Thể loại</span>
                    </div>
                    <ul>
                        <c:forEach var="item" items="${requestScope.categories}">
                            <li><a href="${pageContext.request.contextPath}/shop?categoryId=${item.id}">${item.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="${pageContext.request.contextPath}/shop" method="get">
                            <div class="hero__search__categories">
                                Sản phẩm
                            </div>
                            <input type="text" name="key" placeholder="Bạn cần gì?">
                            <button type="submit" class="site-btn">Tìm kiếm</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+84 383.310.977</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/views/customer/assets/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Giỏ Hàng</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
                        <span>Giỏ Hàng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <c:if test="${requestScope.confirmAlert != null}">
            <div class="alert-success text-center mb-5 p-3">
                <span>${requestScope.confirmAlert}</span>
            </div>
        </c:if>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
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
                        <c:forEach var="item" items="${sessionScope.shoppingCart.carts}">
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="/upload/img/${item.key.image}" alt="" style="width: 110px; height: 110px; object-fit: cover">
                                    <h5>${item.key.name}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    ${item.key.formatPrices(item.key.prices - item.key.pricesSale)} đ <p style="font-size: 16px; font-weight: 600; color: #ef3030">(-${item.key.sale} %)</p>
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="number" name="quantity" min="1" max="1000" value="${item.value}">
                                        </div>
                                    </div>
                                </td>
                                <td class="shoping__cart__total">
                                    ${item.key.formatPrices((item.key.prices - item.key.pricesSale) * item.value)}
                                </td>
                                <td class="shoping__cart__item__close">
                                    <span class="icon_close js-delete-item" data-id="${item.key.id}"></span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="${pageContext.request.contextPath}/" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>
                    <a style="cursor: pointer" class="primary-btn cart-btn cart-btn-right" id="btn-update"><span class="icon_loading"></span>
                        Cập nhật giỏ hàng</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div class="shoping__discount">
                        <h5>Mã Giảm Giá</h5>
                        <form action="#">
                            <input type="text" placeholder="Nhập Mã Giảm giá">
                            <button type="submit" class="site-btn">ÁP DỤNG</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Tổng giá giỏ hàng</h5>
                    <ul>
                        <li>Tổng giá sản phẩm <span class="subtotal-price">${sessionScope.shoppingCart.totalPrices != null ? sessionScope.shoppingCart.totalPrices : "0"} đ</span></li>
                        <li>Phí vận chuyển <span>0 đ</span></li>
                        <li>Tổng tiền <span class="total-price">${sessionScope.shoppingCart.totalPrices != null ? sessionScope.shoppingCart.totalPrices : "0"} đ</span></li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/check-out" class="primary-btn">TIẾN HÀNH THANH TOÁN</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>
<script>
    $(document).ready(function() {
        $("#btn-update").on('click', function () {
            let params = "";
            $("input[name='quantity']").each(function() {
                params += "quantity=" + $(this).val() + "&";
            });
            params = params.substring(0, params.length - 1);
            window.location.href = '/update-cart?' + params;
        })
        $(".js-delete-item").on('click', function() {
            const btn = $(this);
            if(confirm("Bạn có chắc chắn muốn xóa sản phẩm ra khỏi giỏ hàng?")) {
              $.ajax({
                  url: '/delete-item-to-cart?id=' + btn.attr("data-id"),
                  type: "POST"
              }).done(function(data) {
                  if(data !== "fail") {
                      btn.closest("tr").remove();
                      $(".carts").empty().append(data[0]);
                      $(".subtotal-price").empty().append(data[1]);
                      $(".total-price").empty().append(data[1]);
                  }
              })
            }
        })
    })
</script>