<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <title>Đăng ký tài khoản</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="registercss.css" rel="stylesheet" type="text/css"/>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
        <div id="register">
            <div class="container">
                <div id="register-row" class="row justify-content-center align-items-center">
                    <div id="register-column" class="col-md-6">
                        <div id="register-box" class="col-md-12">
                            <form id="register-form" class="form" action="" method="post">
                                <h3 class="text-center text-info">Đăng ký tài khoản</h3>

                                <div class="form-group">
                                    <label for="fullname" class="text-info">Họ và tên:</label>
                                    <input type="text" name="fullname" id="fullname" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="email" class="text-info">Email:</label>
                                    <input type="email" name="email" id="email" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="username" class="text-info">Tên đăng nhập:</label>
                                    <input type="text" name="username" id="username" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="password" class="text-info">Mật khẩu:</label>
                                    <input type="password" name="password" id="password" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="confirm-password" class="text-info">Xác nhận mật khẩu:</label>
                                    <input type="password" name="confirm-password" id="confirm-password" class="form-control" required>
                                </div>

                                <div class="form-group text-center">
                                    <input type="submit" name="submit" class="btn btn-info btn-md" value="Đăng ký">
                                </div>
                                <div class="message-box">
                                        <p class = "text-danger">${mess1}</p>
                                        <p class = "text-danger">${mess2}</p>
                                    </div>
                                <div id="login-link" class="text-center">
                                    <p>Đã có tài khoản? <a href="login" class="text-info">Đăng nhập tại đây</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</body>
</html>
