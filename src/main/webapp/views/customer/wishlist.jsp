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
                    <h2>Yêu Thích</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
                        <span>Yêu Thích</span>
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
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${sessionScope.customerSession.wishlist}">
                            <tr>
                                <td class="shoping__cart__item" style="cursor: pointer" onclick="window.location.href = '/detail?id=${item.product.id}'">
                                    <img src="/upload/img/${item.product.image}" alt="" style="width: 110px; height: 110px; object-fit: cover">
                                    <h5>${item.product.name}</h5>
                                </td>
                                <td class="shoping__cart__price" style="cursor: pointer" onclick="window.location.href = '/detail?id=${item.product.id}'">
                                        ${item.product.formatPrices(item.product.prices - item.product.pricesSale)} đ <p style="font-size: 16px; font-weight: 600; color: #ef3030">(-${item.product.sale} %)</p>
                                </td>
                                <td class="shoping__cart__item__close">
                                    <span class="icon_close js-remove-to-wishlist" data-id="${item.id}"></span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>
<script>
    $(document).ready(function() {
        $(".js-remove-to-wishlist").on("click", function () {
            const btn = $(this);
            let sizeWishlist = $(".wishlist").first().text();
            if(confirm("Xóa sản phẩm ra khỏi danh sách yêu thích ?")) {
                $.ajax({
                    url: '/remove-to-wishlist?id=' + btn.attr("data-id"),
                    type: 'POST'
                }).done(function() {
                    btn.closest("tr").remove();
                    $(".wishlist").empty().append(parseInt(sizeWishlist) - 1);
                })
            }
        })
    })
</script>