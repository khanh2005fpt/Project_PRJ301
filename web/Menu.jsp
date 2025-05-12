<%-- 
    Document   : Menu
    Created on : Mar 7, 2025, 12:45:36 AM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<nav class="navbar navbar-expand-lg">

    <div class="logo">
        <img class="logo-img" src="https://img.pikbest.com/png-images/20241016/fruit-refreshment-and-soft-drinks-in-glasses-juice-logo_10966561.png!bwr800">
        <li class="juice">Juicemark</li>
    </div>

    <form class="d-flex" action="search" method="get">
    <input value="${txtS}" name="txt" class="form-control me-2" 
           type="search" placeholder="Tìm kiếm sản phẩm" aria-label="Search">
    <button class="btn btn-outline-success" type="submit">Search</button>
    
</form>


    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    
        <c:if test="${sessionScope.account.admin == 1}">
            <li class="nav-item">
                <a class="nav-link" href="manager">Quản lý sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="show">Giỏ hàng của bạn</a>
            </li>
        </c:if>
        <c:if test="${sessionScope.account.admin == 0}">
                <li class="nav-item">
                <a class="nav-link" href="">Thông tin</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="show">Giỏ hàng của bạn</a>
            </li>
        </c:if>
            
        <c:if test="${(sessionScope.account == null)}">
              <li class="nav-item">
                <a class="nav-link" href="">Thông tin</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login">Giỏ hàng của bạn</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login">Đăng nhập</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register">Đăng ký</a>
            </li>
        </c:if>
        <c:if test="${(sessionScope.account != null)}">
            <li class="nav-item">
                <a class="nav-link" href="#">Xin chào ${sessionScope.account.username}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout">Đăng xuất</a>
            </li>

        </c:if>     

    </div>
</nav>

<nav class="br" aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
        <li class="breadcrumb-item active" aria-current="page">Danh mục</li>
        <li class="breadcrumb-item active" aria-current="page">Nước ngọt</li>
    </ol>
</nav>