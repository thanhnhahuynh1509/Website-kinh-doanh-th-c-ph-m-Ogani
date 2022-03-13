<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="customer" value="${requestScope.customer}"/>
<jsp:include page="${pageContext.request.contextPath}/views/customer/header.jsp"/>

<style>
    .shoping__cart__table table tbody tr td.shoping__cart__quantity {
        width: auto
    }
    .shoping__cart__table table thead th {
        font-size: 16px;
    }
</style>

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
                    <h2>Cửa Hàng</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
                        <span>Cửa Hàng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">

                    <div class="sidebar__item">
                        <h4>Thể Loại</h4>
                        <ul>
                            <c:forEach items="${requestScope.categories}" var="item">
                                <li><a href="${pageContext.request.contextPath}/shop?categoryId=${item.id}">${item.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Mới Nhất</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${requestScope.productsNew}" var="item" varStatus="status">
                                        <c:if test="${status.index < 3}">
                                            <a href="${pageContext.request.contextPath}/detail?id=${item.id}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="${pageContext.request.contextPath}/upload/img/${item.image}" alt="" style="width: 110px; height: 110px; object-fit: cover">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${item.name}</h6>
                                                    <span>${item.formatPrices(item.prices)} đ</span>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${requestScope.productsNew}" var="item" varStatus="status">
                                        <c:if test="${status.index >= 3}">
                                            <a href="${pageContext.request.contextPath}/detail?id=${item.id}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="${pageContext.request.contextPath}/upload/img/${item.image}" alt="" style="width: 110px; height: 110px; object-fit: cover">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${item.name}</h6>
                                                    <span>${item.formatPrices(item.prices)} đ</span>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <c:if test="${requestScope.productsDiscount.size() > 0}">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Giảm Giá</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <c:forEach var="item" items="${requestScope.productsDiscount}">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/upload/img/${item.image}">
                                            <c:if test="${item.sale > 0}">
                                                <div class="product__discount__percent">-${item.sale}%</div>
                                            </c:if>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="${pageContext.request.contextPath}/detail?id=${item.id}"><i class="fa fa-eye"></i></a></li>
                                                <c:if test="${sessionScope.customerSession != null}">
                                                    <c:set var="idContain" value="${sessionScope.customerSession.checkWishlistContainProduct(item)}"/>
                                                    <c:if test="${idContain > 0}">
                                                        <li><a style="cursor: pointer" class="js-wishlist text-danger" data-p-id="${item.id}" data-id="${idContain}"><i class="fa fa-heart"></i></a></li>
                                                    </c:if>
                                                    <c:if test="${idContain == 0}">
                                                        <li><a style="cursor: pointer" class="js-wishlist" data-p-id="${item.id}"><i class="fa fa-heart"></i></a></li>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${sessionScope.customerSession == null}">
                                                    <li><a style="cursor: pointer" class="js-wishlist" data-p-id="${item.id}"><i class="fa fa-heart"></i></a></li>
                                                </c:if>
                                                <li><a style="cursor:pointer;" class="js-add-to-cart" data-id="${item.id}" data-quantity="1"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <h6><a href="${pageContext.request.contextPath}/detail?id=${item.id}">${item.name}</a></h6>
                                            <c:if test="${item.sale > 0}">
                                                <div class="product__item__price">${item.formatPrices(item.prices - item.pricesSale)} đ <span>${item.formatPrices(item.prices)} đ</span></div>
                                            </c:if>
                                            <c:if test="${item.sale == 0}">
                                                <div class="product__item__price">${item.formatPrices(item.prices - item.pricesSale)} đ</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                </c:if>

                <div class="filter__item">
                    <div class="row justify-content-center">
                        <div class="col-lg-12 col-md-12">
                            <div class="filter__found">
                                <h6> Sản phẩm tìm thấy
                                    <c:if test="${requestScope.keySearch != null}">
                                        cho từ khóa: <span style="color: #333; font-weight: 600">${requestScope.keySearch}</span>
                                    </c:if>
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <c:forEach var="item" items="${requestScope.products}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="/upload/img/${item.image}">
                                    <c:if test="${item.sale > 0}">
                                        <div class="product__discount__percent" style="background: #e42424;display: inline-block;padding: 10px 3px;border-radius: 50%;color: #fff;">-${item.sale}%</div>
                                    </c:if>
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${pageContext.request.contextPath}/detail?id=${item.id}"><i class="fa fa-eye"></i></a></li>
                                        <c:if test="${sessionScope.customerSession != null}">
                                            <c:set var="idContain" value="${sessionScope.customerSession.checkWishlistContainProduct(item)}"/>
                                            <c:if test="${idContain > 0}">
                                                <li><a style="cursor: pointer" class="js-wishlist text-danger" data-p-id="${item.id}" data-id="${idContain}"><i class="fa fa-heart"></i></a></li>
                                            </c:if>
                                            <c:if test="${idContain == 0}">
                                                <li><a style="cursor: pointer" class="js-wishlist" data-p-id="${item.id}"><i class="fa fa-heart"></i></a></li>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${sessionScope.customerSession == null}">
                                            <li><a style="cursor: pointer" class="js-wishlist" data-p-id="${item.id}"><i class="fa fa-heart"></i></a></li>
                                        </c:if>
                                        <li><a style="cursor:pointer;" class="js-add-to-cart" data-id="${item.id}" data-quantity="1"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${pageContext.request.contextPath}/detail?id=${item.id}">${item.name}</a></h6>
                                    <c:if test="${item.sale > 0}">
                                        <div class="product__item__price">${item.formatPrices(item.prices - item.pricesSale)} đ <span style="text-decoration: line-through; font-weight: 400; font-size: 12px; margin-left: 5px">${item.formatPrices(item.prices)} đ</span></div>
                                    </c:if>
                                    <c:if test="${item.sale == 0}">
                                        <div class="product__item__price">${item.formatPrices(item.prices - item.pricesSale)} đ</div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                <div class="product__pagination">
                    <c:forEach var="i" begin="1" end="${requestScope.allNumberPage}">
                        <a href="${pageContext.request.contextPath}/shop?page=${i}">${i}</a>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>
<script>
    $(document).ready(function() {
        $(".js-add-to-cart").on('click', function() {
            const btn = $(this);
            $.ajax({
                url: '/add-to-cart?id='+ btn.attr("data-id") + "&quantity=" + btn.attr("data-quantity"),
                type: 'POST'
            }).done(function(data) {
                $(".carts").empty().append(data);
            })
        });

        $(".js-wishlist").on("click", function() {
            const btn = $(this);
            let sizeWishlist = $(".wishlist").first().text();

            if(btn.hasClass("text-danger")) {
                console.log("remove call")
                btn.removeClass("text-danger");
                $.ajax({
                    url: '/remove-to-wishlist?id=' + btn.attr("data-id"),
                    type: 'post'
                }).done(function() {
                    if(parseInt(sizeWishlist) > 0)
                        $(".wishlist").empty().append(parseInt(sizeWishlist) - 1);
                })
            } else {
                console.log("add call")
                btn.addClass("text-danger");

                $.ajax({
                    url: '/add-to-wishlist?productId=' + btn.attr("data-p-id"),
                    type: 'post'
                }).done(function(data) {
                    if(data === "failed") {
                        window.location.href = '/login'
                    } else {
                        btn.attr("data-id", data);
                        $(".wishlist").empty().append(parseInt(sizeWishlist) + 1);
                    }
                })
            }
        });

    });
</script>