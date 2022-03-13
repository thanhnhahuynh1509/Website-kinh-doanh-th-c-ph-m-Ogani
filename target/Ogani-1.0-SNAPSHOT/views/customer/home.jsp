<%@ page import="java.util.List" %>
<%@ page import="com.ogani.entity.Wishlist" %>
<%@ page import="com.ogani.entity.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>

<jsp:include page="${pageContext.request.contextPath}/views/customer/header.jsp"/>

<!-- Hero Section Begin -->
<section class="hero">
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
                <div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath}/views/customer/assets/img/hero/banner.jpg">
                    <div class="hero__text">
                        <span>FRUIT FRESH</span>
                        <h2>Vegetable <br />100% Organic</h2>
                        <p>Free Pickup and Delivery Available</p>
                        <a href="#" class="primary-btn">SHOP NOW</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Categories Section Begin -->
<section class="categories mt-5">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <c:forEach items="${requestScope.categories}" var="item">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${pageContext.request.contextPath}/upload/img/${item.image}">
                            <h5><a href="${pageContext.request.contextPath}/shop?categoryId=${item.id}">${item.name}</a></h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Thực phẩm sức khỏe phổ biến</h2>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <c:forEach var="item" items="${requestScope.products}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat mt-4">
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
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="${pageContext.request.contextPath}/views/customer/assets/img/banner/banner-1.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="${pageContext.request.contextPath}/views/customer/assets/img/banner/banner-2.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Sản phẩm mới nhất</h4>
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
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Đánh Giá Cao Nhất</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <c:forEach items="${requestScope.productsTopRate}" var="item" varStatus="status">
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
                            <c:forEach items="${requestScope.productsTopRate}" var="item" varStatus="status">
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
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Đánh Giá Nhiều Nhất</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <c:forEach items="${requestScope.productsTopReviews}" var="item" varStatus="status">
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
                            <c:forEach items="${requestScope.productsTopReviews}" var="item" varStatus="status">
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
</section>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title from-blog__title">
                    <h2>From The Blog</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="${pageContext.request.contextPath}/views/customer/assets/img/blog/blog-1.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">Cooking tips make cooking simple</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="${pageContext.request.contextPath}/views/customer/assets/img/blog/blog-2.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="${pageContext.request.contextPath}/views/customer/assets/img/blog/blog-3.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">Visit the clean farm in the US</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

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