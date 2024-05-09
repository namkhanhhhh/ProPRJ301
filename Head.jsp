<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Thẻ nav để tạo menu điều hướng -->
<nav class="navbar navbar-expand-md" id="header">
    <!--    navbar-dark bg-dark-->
    <div class="container row">
        <!-- Thẻ a để tạo liên kết đến trang chủ -->
        <a class="navbar-brand col-md-4" href="LoadDB" id="nika">NIKA Billiard</a>

        <form action="search" method="post" class="col-md-4">
            <div class="input-group input-group-sm">
                <input name="searchtxt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-light btn-number">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>

        <ul class="navbar-nav m-auto col-md-4" id="right-menu">
            <c:if test="${sessionScope.account.isAdmin == 1}">
                <li class="nav-item">
                    <a id="textheader" class="nav-link" href="productcrud">Manager Product</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.account !=null}">
                <li class="nav-item">
                    <a id="textheader" class="nav-link" href="#">${sessionScope.account.username}</a>
                </li>    
                <li class="nav-item">
                    <a id="textheader" class="nav-link" href="Logout">Logout</a>
                </li>    
            </c:if>
            <c:if test="${sessionScope.account ==null}">
                <li class="nav-item">
                    <a id="textheader" class="nav-link" href="Views/Login.jsp">Login</a>
                </li>    
                <li class="nav-item">
                    <a id="textheader" class="nav-link" href="Views/Signup.jsp">SignUp</a>
                </li>    
            </c:if>
        </ul>

    </div>
</nav>
<header>
    <div class="container">
        <h1>Chào mừng bạn đến với NIKA Billiard Shop</h1>
        <p>NIKA là trang web bán gậy bi a uy tín và chất lượng hàng đầu Việt Nam. Chúng tôi cung cấp các loại gậy bi a cao cấp, đa dạng và phù hợp với mọi nhu cầu của khách hàng. Luôn đáp ứng và lắng nghe nhu cầu của khách hàng!</p>
    </div>
</header>

