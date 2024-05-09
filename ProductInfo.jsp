<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NIKA - Trang web bán gậy bi a</title>
        <!-- Liên kết tệp CSS -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/header.css" type="text/css" >
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/style.css" type="text/css" >
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/footer.css" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/menu.css" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/detail.css" type="text/css">

    </head>
    <body>
        <jsp:include page="Head.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5">
                                        <article class="gallery-wrap">
                                            <div class="img-big-wrap">
                                                <div><a href="#"><img src="${p.image}"></a></div>
                                        </div>
                                    </article>
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-text">
                                        <h3 class="title mb-3">${p.name}</h3>

                                        <p class="price-detail-wrap">
                                            <span class="price h3 text-warning">
                                                <span class="currency">US $</span><span class="num">${p.price}</span>
                                            </span>
                                        </p>
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${p.description}</p></dd>
                                        </dl>

                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <c:if test="${sessionScope.account ==null}">
                                                    <a href="<%=request.getContextPath ()%>/Views/Login.jsp" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                                                </c:if>
                                                <c:if test="${sessionScope.account.isAdmin==0}">
                                                    <a href="LoadDB" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                                                </c:if>

                                            </div>
                                        </div>
                                    </article>
                                </aside>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!-- Thẻ footer để tạo phần chân trang -->
    <jsp:include page="Footer.jsp"></jsp:include>

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</html>