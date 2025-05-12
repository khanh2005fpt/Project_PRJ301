<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
    <head>
        <title>Website ban nuoc ngot</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="stylecss.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <section class="py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6">
                            <img class="card-img-top mb-5 mb-md-0" src="${detail.image}" />
                    </div>

                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${detail.name}</h1>
                        <div class="fs-5 mb-5">
                            <span class="product-price">${detail.price}00đ</span>
                        </div>
                        <p class="lead">${detail.description}</p>



                        <!--                        <div class="d-flex quantity-box quantity-container">
                                                    <button class="btn btn-outline-dark decrease" onclick="decreaseValue()">-</button>
                                                    <input type="text" id="quantity" value="1" readonly>
                                                    <button class="btn btn-outline-dark decrease" onclick="increaseValue()">+</button>
                                                </div>
                        
                                                <script>
                                                    function increaseValue() {
                                                        let quantity = document.getElementById("quantity");
                                                        let currentValue = parseInt(quantity.value);
                                                        quantity.value = currentValue + 1;
                                                    }
                        
                                                    function decreaseValue() {
                                                        let quantity = document.getElementById("quantity");
                                                        let currentValue = parseInt(quantity.value);
                                                        if (currentValue > 1) {
                                                            quantity.value = currentValue - 1;
                                                        }
                                                    }
                                                </script>-->
                        <c:if test="${(sessionScope.account == null)}">
                            <li class="nav-item">
                                <a class="nav-link" href="login"> <button class="btn btn-dark flex-shrink-0" type="submit">
                                        🛒 Thêm vào giỏ hàng
                                    </button></a>
                            </li>
                        </c:if>
                        <c:if test="${(sessionScope.account != null)}">

<!--                            <input type="hidden" name="id" value="${detail.id}">-->
                            <a class="nav-link" href="show?id=${detail.id}"> 
                                <button class="btn btn-dark flex-shrink-0" type="submit">
                                    🛒 Thêm vào giỏ hàng
                                </button>
                            </a>
                        </c:if>    

                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
<script type="text/javascript">
    function buy(id) {
        var m = document.f.num.value;
        document.f.action = "buy?id=" + id + "&num=" + m;
        document.f.submit();
    }
</script>