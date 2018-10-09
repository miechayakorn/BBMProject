<%-- 
    Document   : Register
    Created on : 08-Oct-2018, 16:00:53
    Author     : Acer_E5
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <c:choose>
            <c:when test="${status == 'statusTrue'}">
                <div class="alert alert-success">
                    <strong>Success!!</strong> กรุณา.. เช็คที่อีเมล์เพื่อ Activate | อีเมล์ของท่านที่ใช้ในการสมัคร คือ ${getEmailInDB}
                </div>
            </c:when>
            <c:when test="${status == 'UserHaveInDB'}">
                <div class="alert alert-warning">
                    <strong>Warning!</strong> มีชื่อผู้ใช้นี้ในระบบแล้ว
                </div>
            </c:when>
        </c:choose>
        <div class="">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <a href="/BBMProject" class="btn btn-danger">Back</a>
                            <h5 class="card-title text-center">Register Page</h5>
                            <form class="form-signin" action="Register">
                                <div class="form-label-group">
                                    <label>Email address</label>
                                    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                                    <br>
                                </div>
                                <div class="form-label-group">
                                    <label>Password</label>
                                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                                    <br>
                                </div>
                                <div class="form-label-group">
                                    <label>Name</label>
                                    <input type="text" name="name" class="form-control" placeholder="Name" required autofocus>
                                    <br>
                                </div>
                                <div class="form-label-group">
                                    <label>Surname</label>
                                    <input type="text" name="surname" class="form-control" placeholder="Surname" required autofocus>
                                    <br>
                                </div>
                                <div class="form-label-group">
                                    <label>Phone number</label>
                                    <input type="tel" name="phone" class="form-control" placeholder="0812345678" pattern="[0]{1}[0-9]{9}" required />
                                    <br>
                                </div>
                                <br>
                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div></div>
        </div>
    </body>
</html>

