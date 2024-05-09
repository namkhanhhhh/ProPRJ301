<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="<%=request.getContextPath ()%>/CSS/register.css" type="text/css">
        <title>Signup Form</title>
    </head>
    <body>
        <div id="signup">
            <h3 class="text-center text-black pt-5">Nika Billiard</h3>
            <br/>
            <br/>
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="register-column" class="col-md-6">
                        <div id="register-box" class="col-md-12">
                            <form id="register-form" class="form" action="<%=request.getContextPath ()%>/SignUpControl" method="post">
                                <h3 class="text-center">Register</h3>
                                <p class="text-danger">${notisignup}</p>
                                <p class="text-danger">${notirepass}</p>
                                <p class="text-danger">${nullnoti}</p>
                                <div class="form-group">
                                    <label for="username">Username:</label><br>
                                    <input type="text" name="username" id="username" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password:</label><br>
                                    <input type="password" name="password" id="password" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="repassword">Repeat Password:</label><br>
                                    <input type="password" name="repassword" id="repassword" class="form-control">
                                </div>
                                <div>
                                    <input type="submit" name="submit" class="btn btn-info btn-md " value="Register">
                                    <a href="<%=request.getContextPath ()%>/Views/Login.jsp" class="text-info text-right" id="backlogin">Back to Login</a>
                                </div>
                                <div id="back-link" class="text-center">
                                    <a href="<%=request.getContextPath ()%>/LoadDB" class="btn btn-info btn-md" id="back-link-btn">Back to home</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

