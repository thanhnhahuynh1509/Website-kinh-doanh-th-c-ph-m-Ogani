<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="${pageContext.request.contextPath}/views/customer/header.jsp"/>

<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header" style="background-color: #7fad39">
                    <h4 class="text-center"
                        style="color: #fefef9; text-transform: uppercase; font-weight: 600">
                        Đăng Ký
                    </h4>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/register" method="post" id="formInput">
                        <div class="mb-3 text-center">
                            <span style="color: red">${requestScope.message}</span>
                        </div>
                        <div class="mb-3 checkout__input">
                            <label for="username" class="form-label">Tên đăng nhập</label>
                            <input style="color: #333" type="text" id="username" value="${requestScope.username}" name="username" placeholder="Nhập tên đăng nhập...">
                        </div>
                        <div class="mb-3 checkout__input">
                            <label for="password" class="form-label">Mật khẩu</label>
                            <input style="color: #333" type="password" id="password" name="password" placeholder="Nhập mật khẩu...">
                        </div>
                        <div class="mb-3 checkout__input">
                            <label for="rePassword" class="form-label">Nhập lại mật khẩu</label>
                            <input style="color: #333" type="password" id="rePassword" name="rePassword" placeholder="Nhập lại mật khẩu...">
                        </div>
                        <div class="mb-3">
                            <button class="btn" id="btn-register" style="width: 100%; background-color: #98cb4d; color: #fefef9">Đăng Ký</button>
                        </div>
                    </form>
                </div>
                <div class="card-header" style="background-color: #7fad39">
                    <div style="display: flex; justify-content: space-between">
                        <a style="color: #fefef9" href="${pageContext.request.contextPath}/">Trở lại</a>
                        <a style="color: #fefef9" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/views/customer/footer.jsp"/>
<script>
    $(document).ready(function () {
        $("#formInput").validate({
           rules: {
               username: {
                   required: true,
                   minlength: 8
               },
               password: {
                   required: true,
                   minlength: 8
               },
               rePassword: {
                   equalTo: "#password"
               }
           },
            messages: {
                username: {
                    required: "Vui lòng nhập tên tài khoản",
                    minlength: "Tên tài khoản không được dưới 8 ký tự"
                },
                password: {
                    required: "Vui lòng nhập mật khẩu",
                    minlength: "Mật khẩu không được dưới 8 ký tự"
                },
                rePassword: {
                    equalTo: "Mật khẩu không trùng khớp"
                }
            }
        });

    });
</script>

