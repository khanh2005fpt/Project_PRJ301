<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <title>Đăng Nhập</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">       
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        
        <link href="logincss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div id="login">
            <div class="container"> 


                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12" style = "height: 360px;">

                            <form id="login-form" class="form" action="login" method="post" >
                                <h3 class="text-center text-info">Đăng nhập</h3>
                                <div class="form-group">
                                    <label for="username" class="text-info">Tên đăng nhập:</label><br>
                                    <input value="${username}" type="text" name="username" id="username" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Mật khẩu:</label><br>
                                    <input value="${password}" type="password" name="password" id="password" class="form-control">
                                </div>



                                <div class="form-group h-100">
                                    <div class="message-box">
                                        <p class = "text-danger">${mess}</p>
                                    </div>
                                    <label for="remember-me" class="text-info">
                                        <span>Ghi nhớ đăng nhập</span> 
                                        <span><input id="remember-me" name="remember-me" type="checkbox"></span>
                                    </label><br>
                                    <input type="submit" name="submit" class="btn btn-info btn-md" value="Đăng nhập">

                                </div>
                                <div id="register-link" class="text-right">
                                    <a href="register" class="text-info">Đăng ký tại đây</a>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
