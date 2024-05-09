<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUD Data for Admin</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<%=request.getContextPath ()%>/CSS/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>Manage Product</b> of Nika Billiard Shop</h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn " data-toggle="modal"><!--btn-success-->
                                <i class="material-icons">&#xE147;</i> <span>Add New Product</span>
                            </a>
                            </a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr id="tr">
                            <th>ProductId</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Control</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td>${o.pid}</td>
                                <td>${o.name}</td>
                                <td>
                                    <img src="${o.image}">
                                </td>
                                <td>${o.description}</td>
                                <td>${o.price}$</td>
                                <td>
                                    <a href="#editEmployeeModal"  class="edit" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                    </a>
                                    <a href="delete?pid=${o.pid}" class="delete" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <a href="<%=request.getContextPath ()%>/LoadDB"><button type="button" class="btn btn-primary">Back to home</button></a>
        </div>

        <!-- Add Product -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="insert" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm sản phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Id (không trùng với id sẵn có ở trong list sản phẩm)</label>
                                <input name="pid" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="pname" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh</label>
                                <input name="pimage" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Giá tiền ($)</label>
                                <input name="pprice" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mô tả sản phẩm</label>
                                <textarea name="pdescription" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Danh mục: </label><br>
                                <c:forEach items="${listC}" var="o">
                                    <input type="radio" name="pcategory" value="${o.cid}">
                                    <label>${o.cname}</label><br>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <input type="submit" class="btn btn-success" value="Thêm">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Product -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="edit" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Chỉnh sửa</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Id (phải là id sẵn có ở trong list sản phẩm)</label>
                                <input name="pid" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="pname" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh</label>
                                <input name="pimage" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Giá tiền ($)</label>
                                <input name="pprice" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mô tả sản phẩm</label>
                                <textarea name="pdescription" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Danh mục: </label><br>
                                    <c:forEach items="${listC}" var="o">
                                    <input type="radio" name="pcategory" value="${o.cid}">
                                    <label>${o.cname}</label><br>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <input type="submit" class="btn btn-info" value="Lưu">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="JS/manager.js" type="text/javascript"></script>
    </body>
</html>