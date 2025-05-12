<%-- 
    Document   : mycart
    Created on : Mar 16, 2025, 11:31:43 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng cua ban</title>

        <!-- Bootstrap 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="stylecss.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .cart-container {
                max-width: 900px;
                margin: 40px auto;
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }
            .cart-table img {
                width: 70px;
                border-radius: 5px;
            }
            .btn-update {
                width: 35px;
                height: 35px;
                padding: 0;
                font-size: 18px;
                border-radius: 50%;
            }
            .btn-update:hover {
                background-color: #007bff;
                color: white;
            }
            .total-container {
                background: #f8f9fa;
                border-radius: 10px;
                padding: 20px;
            }
            .btn-checkout {
                font-size: 18px;
                font-weight: bold;
            }

            .table-blue {
                width: 100%;
                border-collapse: collapse;
                background-color: #e0f7fa;
                border: 1px solid #0288d1;
            }
            .table-blue th, .table-blue td {
                border: 1px solid #0288d1;
                padding: 8px;
                text-align: left;
            }
            .table-blue th {
                background-color: #0288d1;
                color: white;
            }
            .hihi{
                margin-left: 0;
            }

        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container cart-container">
                <table class="table table-bordered table-hover text-center">
                    <thead class="table table-info">
                        <tr>
                            <th>Tên</th>
                            <th>Anh</th>
                            <th>Số Lượng</th>
                            <th>Giá</th>
                            <th>Tong so tien</th>
                        </tr>

                    </thead>
                <c:set var="o" value="${requestScope.cart}"/>
                <c:set var="tt" value="0"/>
                <c:forEach items = "${o.items}" var="i">
                    <c:set var="tt" value="${tt + 1}"/>
                    <tr>
                        <td>${i.product.name}</td>
                        <td>
                            <img src="${i.product.image}" alt="${i.product.image}" class="me-3" style="width: 150px; height: 150px; object-fit: cover;">
                        </td>

                        <td>
                            <div class="d-flex hihi">

                                <input type="hidden" name="num" value="1"> <!-- Thêm input ẩn -->
                                <a href="process?num=-1&id=${i.product.id}"><button class="btn-outline-secondary btn-update">-</button></a>
                                <strong class="mx-3">${i.quantity}</strong>
                                <a href="process?num=1&id=${i.product.id}"><button class="btn-outline-secondary btn-update">+</button></a>

                            </div>


                        </td>
                        <td>${i.price}00VND</td>
                        <td>${(i.product.price * i.quantity)}00VND</td>

                    <form action="process" method="post">
                        <input type="hidden" name="id" value="${i.product.id}"/>

                    </form>



                    </tr>
                </c:forEach>

            </table>

        </div>
        <div class="row mt-4">
            <div class="col-lg-3 offset-lg-3 total-container">
                <h5 class="text-uppercase fw-bold">🧾 Hóa đơn thanh toán</h5>
                <ul class="list-unstyled">
                    <li class="justify-content-between py-2"><strong class="text-muted">Tổng tiền hàng:</strong> <strong>${o.getTotalMoney()}00VND</strong></li>
                    <li class="justify-content-between py-2"><strong class="text-muted">Phí vận chuyển:</strong> <strong>10.000 VNĐ</strong></li>
                    <li class="justify-content-between py-2"><strong class="text-muted">VAT:</strong> <strong>10.000 VNĐ</strong></li>
                    <li class="justify-content-between py-2 border-top"><strong>Tổng thanh toán:</strong> <h5 class="fw-bold text-danger">${o.getTotalMoney() + 10.000}00VND</h5></li>
                </ul>
                <a href="buy" class="btn btn-success w-100 py-2 btn-checkout">🛍 Tiến hành thanh toán</a>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript">
        function buy(id) {
            var m = document.f.num.value;
            document.f.action = "buy?id=" + id + "&num=" + m;
            document.f.submit();
        }
    </script>
</html>


