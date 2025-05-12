<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Website Bán Nước Ngọt</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="stylecss.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <!-- Slider -->
            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://drinkocany.com/wp-content/uploads/2022/07/nuoc-ngot-co-ga-1.jpg" class="d-block mx-auto w-70 h-90">
                    </div>
                    <div class="carousel-item">
                        <img src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/10/2/neu-moi-ngay-uong-mot-lon-nuoc-ngot-co-the-ban-bi-huy-hoai-nhu-the-nao-4-16331122198881292950569.jpg" class="d-block mx-auto w-70 h-90">
                    </div>
                    <div class="carousel-item">
                        <img src="https://lirp.cdn-website.com/1fdafd38/dms3rep/multi/opt/softdrinks-77cd0018-640w.jpg" class="d-block mx-auto w-70 h-90">
                    </div>
                </div>

                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>

            <div class="container mt-4">
                <div class="row">
                    <!-- Sidebar -->
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase">
                                <i class="fa fa-list"></i> Danh mục
                            </div>
                            
                            <ul class="list-group">
                                <a href="category?cateid=0" class="list-group-item list-group-item-action ${tag == 0 ? "active" : ""}">
                                <i class="fa fa-tag"></i>Tất cả</a>
                                
                            <c:forEach items="${listcc}" var="o" varStatus="loop">
                                <a href="category?cateid=${o.cid}" class="list-group-item list-group-item-action ${tag == o.cid ? "active" : ""}">
                                    <i class="fa fa-tag"></i> ${loop.index + 1}. ${o.cname}
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                </div>


                <!-- Danh sách sản phẩm -->
                <div class="col-sm-9">
                    <div class="row">
                        <c:choose>
                            <c:when test="${not empty listp}">
                                <c:forEach items="${listp}" var="o">
                                    <div class="col-md-4 mb-4">
                                        <div class="card h-100">
                                            <img src="${o.image}" class="card-img-top" alt="${o.name}">
                                            <div class="card-body">
                                                <h5 class="card-title">${o.name}</h5>
                                                <p class="card-text text-danger fw-bold">${o.price}00đ</p>
                                                <a href="detail?pid=${o.id}" class="btn btn-primary">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="text-center text-muted">Không có sản phẩm nào!</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${index > 1}">
                    <li class="page-item">
                        <a class="page-link" href="search?txt=${txtS}&index=${index - 1}">Trước</a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${numpage}" var="i">
                    <li class="page-item ${i == index ? "active" : ""}">
                        <a class="page-link" href="search?txt=${txtS}&index=${i}">${i}</a>
                    </li>
                </c:forEach>

                <c:if test="${index < numpage}">
                    <li class="page-item">
                        <a class="page-link" href="search?txt=${txtS}&index=${index + 1}">Tiếp</a>
                    </li>
                </c:if>
            </ul>
        </nav>
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
