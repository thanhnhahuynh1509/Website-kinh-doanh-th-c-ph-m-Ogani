<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="customer" value="${requestScope.customer}"/>
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
<section class="breadcrumb-section set-bg"
         data-setbg="${pageContext.request.contextPath}/views/customer/assets/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Tài Khoản</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
                        <span>Tài Khoản</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<form id="formInput" action="${pageContext.request.contextPath}/update-customer" method="post">
    <section class="spad">
        <div class="container">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header text-right">
                        <a href="${pageContext.request.contextPath}/orders" class="btn btn-primary text-light"><i
                                class="fa fa-shopping-cart"></i> Đơn hàng</a>
                        <a class="btn btn-danger text-light"><i class="fa fa-heart"></i> Yêu Thích</a>
                        <button type="submit" class="btn btn-warning text-light"><i class="fa fa-cog"></i> Cập nhật
                        </button>
                    </div>
                    <div class="card-body">
                        <input type="hidden" value="${customer.id}" name="id"/>
                        <div class="mb-3 checkout__input">
                            <label for="username">
                                Tên đăng nhập
                            </label>
                            <input style="color: #535353" name="username" type="text" disabled id="username"
                                   value="${customer.username}">
                        </div>
                        <div class="mb-3 checkout__input">
                            <label for="password">
                                Mật khẩu
                            </label>
                            <input style="color: #333" name="password" type="password" id="password"
                                   placeholder="Nhập mật khẩu...">
                        </div>
                        <div class="mb-3 checkout__input">
                            <label for="rePassword">
                                Nhập lại mật khẩu
                            </label>
                            <input style="color: #333" name="rePassword" type="password" id="rePassword"
                                   placeholder="Nhập lại mật khẩu...">
                        </div>
                    </div>
                    <div class="card-footer text-right">
                        <a class="btn btn-success" href="/logout"><i class="fa fa-sign-out"></i> Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>
<!-- Shoping Cart Section End -->

<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>
<script>
    $(document).ready(function () {
        $("#formInput").validate({
            rules: {
                password: {
                    required: true,
                    minlength: 8
                },
                rePassword: {
                    equalTo: "#password"
                }
            },
            messages: {
                password: {
                    required: "Vui lòng nhập mật khẩu",
                    minlength: "Mật khẩu không được dưới 8 ký tự"
                },
                rePassword: {
                    equalTo: "Mật khẩu không trùng khớp"
                }
            }
        });
    })
</script>
