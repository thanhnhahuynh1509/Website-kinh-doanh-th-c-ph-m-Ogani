<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="item" value="${requestScope.product}"/>
<jsp:include page="${pageContext.request.contextPath}/views/customer/header.jsp"/>

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
                        <span>${item.name}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="/upload/img/${item.image}" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${item.name}</h3>
                    <div class="product__details__rating">
                        <c:forTokens items="${item.stars()}" delims="," var="token">
                            <i class="fa fa-${token}"></i>
                        </c:forTokens>
                        <span>(${item.reviews.size()} reviews)</span>
                    </div>
                    <div class="product__details__price">${item.formatPrices(item.prices)} đ <span style="color: #333; font-weight: 400; font-size: 16px"> / ${item.weight} kg</span></div>
                    <p>${item.description}</p>
                    <form action="${pageContext.request.contextPath}/add-to-cart" method="get" id="formInput">
                        <input type="hidden" name="id" value="${item.id}">
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="number" min="1" value="1" name="quantity" id="quantity">
                                </div>
                            </div>
                        </div>
                        <button style="border: none" type="submit" class="primary-btn">THÊM VÀO GIỎ HÀNG</button>
                        <c:if test="${sessionScope.customerSession != null}">
                            <c:set var="idContain" value="${sessionScope.customerSession.checkWishlistContainProduct(item)}"/>
                            <c:if test="${idContain > 0}">
                                <a style="cursor: pointer" class="heart-icon js-wishlist text-danger" data-p-id="${item.id}" data-id="${idContain}"><span class="icon_heart_alt"></span></a>
                            </c:if>
                            <c:if test="${idContain == 0}">
                                <a style="cursor: pointer" class="heart-icon js-wishlist" data-p-id="${item.id}"><span class="icon_heart_alt"></span></a>
                            </c:if>
                        </c:if>
                        <c:if test="${sessionScope.customerSession == null}">
                            <a style="cursor: pointer" class="heart-icon js-wishlist" data-p-id="${item.id}"><span class="icon_heart_alt"></span></a>
                        </c:if>
                    </form>

                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">Mô Tả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                               aria-selected="false">Đánh Giá <span>(${item.reviews.size()})</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô Tả</h6>
                                <p>${item.description}</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Đánh Giá</h6>
                                <c:forEach var="r" items="${item.reviews}">
                                    <div class="mb-4">
                                        <p style="font-weight: 700">
                                            ${r.customer.username} | <fmt:formatDate value="${r.createdAt}" pattern="dd/MM/yyyy"/>
                                            <span style="color: #EDBB0E; margin-left: 5px;">
                                                <c:forTokens items="${item.stars()}" delims="," var="token">
                                                    <i class="fa fa-${token}"></i>
                                                </c:forTokens>
                                            </span>
                                        </p>
                                        <p style="margin-left: 5px">${r.content}</p>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Các Sản Phẩm Liên Quan</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach var="p" items="${requestScope.productRelated}">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="/upload/img/${p.image}">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a style="cursor:pointer;" class="js-add-to-cart" data-id="${item.id}" data-quantity="1"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="">${p.name}</a></h6>
                            <h5>${p.formatPrices(p.prices)} đ</h5>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</section>
<!-- Related Product Section End -->


<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>
<script>
    $(document).ready(function() {
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