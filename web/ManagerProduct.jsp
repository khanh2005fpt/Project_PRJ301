<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Management</title>
        <link rel="stylesheet" href="styles.css">
        <link href="stylecss.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container d-flex justify-content-center">
                <div class="col-md-12">
                    <h2 class="text-primary text-center">Product Management</h2>
                    <div class="text-end mb-3">
                        <a class="btn btn-success" href="add">Add New Product</a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover text-center">
                            <thead class="table table-info">
                                <tr>
                                    <th>ID</th>
                                    <th>Tên</th>
                                    <th>Hình ảnh</th>
                                    <th>Giá</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listp}" var="o">
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="${o.image}" class="img-thumbnail" style="width: 150px; height: 150px; object-fit: cover;">
                                    </td>

                                    <td>${o.price}00đ</td>
                                    <td>
                                        <a class="btn btn-warning btn-sm" href="load?lid=${o.id}">Update</a>
                                        <a class="btn btn-danger btn-sm" href="delete?pid=${o.id}" onclick="return confirmDelete(${o.id})">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center align-items-center">
                        <c:if test = "${indexPvsN > 1}">
                            <li class="page-item"><a class="page-link" href="manager?index=${indexPvsN - 1}">Previous</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${numpage}" var="i">

                            <a class="page-link" href="manager?index=${i}"> ${i}</a>

                        </c:forEach>
                        <c:if test = "${indexPvsN < numpage}">
                            <li class="page-item"><a class="page-link" href="manager?index=${indexPvsN + 1}">Next</a></li>
                            </c:if>

                    </ul>
                </nav> 
            </div>
        </div>

        <script>
            function confirmDelete(id) {
                return confirm('Are you sure you want to delete this product?');
            }

        </script>

  <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

