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
          <h2>Đơn Hàng</h2>
          <div class="breadcrumb__option">
            <a href="${pageContext.request.contextPath}/">Trang Chủ</a>
            <a href="${pageContext.request.contextPath}/customer-info">Tài Khoản</a>
            <span>Đơn Hàng</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="shoping__cart__table">
          <table>
            <thead>
            <tr>
              <th>Mã HĐ</th>
              <th>Họ Tên</th>
              <th>Địa Chỉ</th>
              <th>Ngày Đặt</th>
              <th>Trạng Thái</th>
              <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${requestScope.customer.orders}">
              <tr>
                <td class="shoping__cart__quantity">
                  #${item.id}
                </td>
                <td class="shoping__cart__quantity">
                    ${item.recipientName}
                </td>
                <td class="shoping__cart__quantity">
                    ${item.recipientAddress}
                </td>
                <td class="shoping__cart__quantity">
                    <fmt:formatDate value="${item.orderDate}" pattern="dd/MM/yyyy, HH:mm"/>
                </td>
                <td class="shoping__cart__quantity">
                  <c:if test="${item.status.equals('Chờ xử lý')}">
                    <span class="badge badge-pill badge-warning"><i class="fa fa-spinner"></i> ${item.status}</span>
                  </c:if>
                  <c:if test="${item.status.equals('Đang giao hàng')}">
                    <span class="badge badge-primary"><i class="fa fa-truck-moving"></i> ${item.status}</span>
                  </c:if>
                  <c:if test="${item.status.equals('Giao hàng thành công')}">
                    <span class="badge badge-success"><i class="fa fa-check-circle"></i> ${item.status}</span>
                  </c:if>
                  <c:if test="${item.status.equals('Hủy')}">
                    <span class="badge badge-pill badge-danger"><i class="fa fa-times"></i> ${item.status}</span>
                  </c:if>
                </td>
                <td>
                  <a href="${pageContext.request.contextPath}/order-details?id=${item.id}" class="btn btn-info btn-sm text-light">
                    <i class="fa fa-eye"></i>
                  </a>
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
