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
    <style>
        .overlay {
            height: 100%;
            width: 100%;
            display: none;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0, 0.9);
        }


        .loader {
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite; /* Safari */
            animation: spin 2s linear infinite;
        }

        /* Safari */
        @-webkit-keyframes spin {
            0% { -webkit-transform: rotate(0deg); }
            100% { -webkit-transform: rotate(360deg); }
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
    <body>
        <c:choose>
            <c:when test="${status == 'RecoveryTrue'}">
                <div class="alert alert-success">
                    <strong>Success!!</strong> กรุณาตรวจสอบที่ Email ของท่านเพื่อเปลี่ยนรหัสผ่าน
                </div>
            </c:when>
            <c:when test="${status == 'RecoveryFalse'}">
                <div class="alert alert-warning">
                    <strong>Warning!</strong> ไม่มี Email นี้ในระบบของเรา กรุณาลองใหม่
                </div>
            </c:when>
            <c:when test="${status == 'ActivateKeyError'}">
                <div class="alert alert-danger">
                    <strong>ActivateKey Error!</strong> กรุณาทำรายการของท่านที่เว็บของเราใหม่อีกครั้ง
                </div>
            </c:when>
        </c:choose>
        <div id="myOverlay" class="overlay">
            <center><div class="loader"></div></center>
        </div>
        <div class="">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                        <div class="card card-signin my-5">
                            <div class="card-body">
                                <a href="/BBMProject" class="btn btn-danger">Back</a>
                                <h5 class="card-title text-center">Recovery Page</h5>
                                <form class="form-signin" action="Recovery">
                                    <div class="form-label-group">
                                        <label>Email address</label>
                                        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                                        <br>
                                    </div>
                                    <button class="btn btn-lg btn-primary btn-block text-uppercase" onclick="openSearch()" type="submit">Recovery</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
function openSearch() {
    document.getElementById("myOverlay").style.display = "block";
}

function closeSearch() {
    document.getElementById("myOverlay").style.display = "none";
}
</script>

