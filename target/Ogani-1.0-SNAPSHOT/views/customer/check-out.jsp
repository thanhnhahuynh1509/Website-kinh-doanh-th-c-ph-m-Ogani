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
                    <h2>Thanh Toán</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/">Home</a>
                        <a href="${pageContext.request.contextPath}/shopping-cart">Giỏ Hàng</a>
                        <span>Thanh Toán</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->


<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h6><span class="icon_tag_alt"></span> Vui lòng điền thông tin bên dưới
                </h6>
            </div>
        </div>
        <div class="checkout__form">
            <h4>Chi tiết đơn hàng</h4>
            <form action="${pageContext.request.contextPath}/place-order" method="post" id="formInput">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Họ tên người nhận<span>*</span></p>
                                    <input style="color: #333" type="text" name="name" placeholder="Huỳnh Thanh Nhã">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Số điện thoại người nhận<span>*</span></p>
                                    <input style="color: #333" type="text" name="phone" placeholder="0383310977">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Địa chỉ người nhận<span>*</span></p>
                            <input style="color: #333" type="text" name="address" placeholder="Châu Đốc, An Giang">
                        </div>
                        <div class="checkout__input">
                            <p>Email người nhận</p>
                            <input style="color: #333" type="email" name="email" placeholder="thanhnha@gmail.com" class="checkout__input__add">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Giỏ hàng của bạn</h4>
                            <div class="checkout__order__products">Sản phẩm <span>Tổng</span></div>
                            <ul>
                                <c:forEach var="item" items="${sessionScope.shoppingCart.carts}">
                                    <li>${item.key.name} <span>${item.key.formatPrices(item.key.prices * item.value)} đ</span></li>
                                </c:forEach>
                            </ul>
                            <div class="checkout__order__total">Tổng giá <span>${sessionScope.shoppingCart.totalPrices} đ</span></div>
                            <button type="submit" class="site-btn">ĐẶT HÀNG</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>
<script>
    $(document).ready(function() {
        $("#formInput").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2
                },
                phone: {
                    required: true,
                    digits: true,
                    rangelength: [8, 11],
                },
                address: {
                    required: true,
                }
            },
            messages: {
                name: {
                    required: "Vui lòng nhập họ tên",
                    minlength: "Họ tên không được dưới 2 ký tự"
                },
                phone: {
                    required: "Vui lòng nhập số điện thoại",
                    digits: "Số điện thoại không hợp lệ",
                    rangelength: "Số điện thoại phải từ 8 - 11 số",
                },
                address: {
                    required: "Vui lòng nhập địa chỉ",
                }
            }
        })
    })
</script>