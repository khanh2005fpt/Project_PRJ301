<%-- 
    Document   : Add
    Created on : Mar 8, 2025, 7:11:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                            <form id="register-form" class="form" action="edit" method="post">
                                <h3 class="text-center text-info">Sửa sản phẩm</h3>

                                 <div class="form-group">
                                    <label for="id" class="text-info">ID sản phẩm</label>
                                    <input value="${detail.id}" type="text" name="id" id="id" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="name" class="text-info">Tên sản phẩm</label>
                                    <input value="${detail.name}" type="text" name="name" id="name" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="image" class="text-info">Link ảnh</label>
                                    <input value="${detail.image}" type="text" name="image" id="image" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="price" class="text-info">Giá sản phẩm</label>
                                    <input value="${detail.price}" type="text" name="price" id="price" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="description" class="text-info">Mô tả sản phẩm</label>
                                    <textarea type="" name="description" id="description" class="form-control" required>${detail.description}</textarea>
                               
                                        
                                    
                                </div>


                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select ">
                                        <c:forEach items="${listcc}" var="o">
                                            <option value="${o.cid}" ${tag == o.cid ? "selected" : ""}>${o.cname}</option>
                                        </c:forEach>
                                    </select>
                                </div>


                                <div class="form-group text-center">

                                    <input type="submit" name="submit" class="btn btn-info btn-md" value="Thay đổi">

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                      <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
