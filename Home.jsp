<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NIKA - Trang web bán gậy bi a</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/header.css" type="text/css" >
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/footer.css" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/menu.css" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/product.css" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/category.css" type="text/css">

    </head>
    <body>
        <jsp:include page="Head.jsp"></jsp:include>
            <!-- Noi dung chinh -->
            <main>
                <div class="container">
                    <div class="cd">
                        <h2 class="cn">Danh mục</h2>
                        <ul class="category-list">
                        <c:forEach items="${listC}" var="o">
                            <li class="category-item">
                                <a href="category?cid=${o.cid}">
                                    <img src="${o.cimg}">
                                    <p>${o.cname}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- san pham gia cao nhat -->
                <div class="fnd">
                    <h2 class="fn">SẢN PHẨM HẠNG SANG </h2>
                    <article class="featured-product row">
                        <div class="fp col-md-4">
                            <img src="${p.image}" alt="${p.name}">
                        </div>
                        <div class="product-info col-md-8">
                            <div>
                                <h2>${p.name}</h2>
                                <span class="price">${p.price}$</span>
                                <p>${p.description}</p>
                            </div>
                            <c:if test="${sessionScope.account ==null}">
                                <div class="mh">
                                    <a href="<%=request.getContextPath ()%>/Views/Login.jsp" class="btn btn-primary">Thêm vào giỏ hàng</a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.account.isAdmin==0}">
                                <div class="mh">
                                    <a href="LoadDB" class="btn btn-primary">Thêm vào giỏ hàng</a>                            
                                </div>
                            </c:if>
                        </div>
                    </article>
                </div>

                <!-- Thong tin cac san pham trong shop -->
                <h2 class="fn1">CÁC SẢN PHẨM KHÁC TRONG NIKA BILLIARD SHOP</h2>
                <section class="products">
                    <c:forEach items="${listP}" var="o">
                        <article class="product">
                            <img src="${o.image}" alt="${o.name}">
                            <h3><a href="detail?pid=${o.pid}" title="View Product" class="ph3">${o.name}</a></h3>
                            <span class="price">${o.price}$</span></br>
                            <c:if test="${sessionScope.account ==null}">
                                <div class="mh">
                                    <a href="<%=request.getContextPath ()%>/Views/Login.jsp" class="btn btn-primary">Mua hàng</a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.account.isAdmin==0}">
                                <div class="mh">
                                    <a href="LoadDB" class="btn btn-primary">Mua hàng</a>                            
                                </div>
                            </c:if>
                        </article>
                    </c:forEach>
                </section>
            </div>
        </main>
    </body>

    <!-- link phan footer.jsp -->
    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</html>