<%-- 
    Document   : Register
    Created on : 08-Oct-2018, 16:00:53
    Author     : Acer_E5
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Mobirise v4.8.6, mobirise.com">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <link rel="shortcut icon" href="assets/images/logo2.png" type="image/x-icon">
    <meta name="description" content="Web Site Creator Description">
    <title>Register Page</title>
    <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="assets/tether/tether.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="assets/dropdown/css/style.css">
    <link rel="stylesheet" href="assets/socicon/css/styles.css">
    <link rel="stylesheet" href="assets/theme/css/style.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
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
        
        <jsp:include page="include/Header.jsp"/>

        <section class="engine"><a href="https://mobirise.info/j">website templates</a></section>
        <section class="header11 cid-r706ZXr5MO" id="header11-o">
            <div class="container align-left">
                <div class="media-container-column mbr-white col-md-12">
                    <h1 class="mbr-section-title py-3 mbr-fonts-style display-1" style="color: #F2F2F2">
                        <strong>Register - สมัครสมาชิก</strong></h1>
                </div>
            </div>


        </section>
<c:choose>
            <c:when test="${status == 'statusTrue'}">
                <div class="alert alert-success">
                    <strong>Success!!</strong> กรุณา.. เช็คที่อีเมล์เพื่อ Activate | อีเมล์ของท่านที่ใช้ในการสมัคร คือ ${getEmailInDB}
                </div>
            </c:when>
            <c:when test="${status == 'UserHaveInDB'}">
                <div class="alert alert-warning">
                    <strong>Warning!</strong> มี ${email} นี้ ในระบบของเราแล้ว
                </div>
            </c:when>
            <c:when test="${status == 'errorException'}">
                <div class="alert alert-danger">
                    <strong>Something went wrong!</strong> มีบางอย่างผิดปกติ กรุณาลองใหม่อีกครั้ง
                </div>
            </c:when>
        </c:choose>
        <div id="myOverlay" class="overlay">
            <center><div class="loader"></div></center>
        </div>
        <section class="mbr-section form1 cid-r7074fmFzA" id="form1-p">




            <div class="container">
                <div class="row justify-content-center">
                    <div class="title col-12 col-lg-8">
                        <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2" style="font-weight:bold">
                            ACCOUNT FORM
                        </h2>

                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="media-container-column col-lg-8">
                        <form class="mbr-form" action="Register" method="post">
                            <div class="row row-sm-offset">
                                <div class="col-md-6 multi-horizontal">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7">Name</label>
                                        <input type="text" class="form-control" name="name" required="">
                                    </div>
                                </div>
                                <div class="col-md-6 multi-horizontal">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7">Surname</label>
                                        <input type="text" class="form-control" name="surname"required="" >
                                    </div>
                                </div>
                                <div class="col-md-6 multi-horizontal">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7">Email</label>
                                        <input type="email" class="form-control" name="email"  required="">
                                    </div>
                                </div>
                                <div class="col-md-6 multi-horizontal" data-for="password">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7">Password</label>
                                        <input type="password" class="form-control" name="password" required="">
                                    </div>
                                </div>
                                <div class="col-md-6 multi-horizontal">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7">Phone</label>
                                        <input type="tel" class="form-control" name="phone">
                                    </div>
                                </div>
                                <div class="col-md-6 multi-horizontal">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7">IDCard</label>
                                        <input type="number" class="form-control" name="idcard" min="0" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label mbr-fonts-style display-7">Address</label>
                                <textarea type="text" class="form-control" name="address" rows="7"></textarea>
                            </div>

                            <span class="input-group-btn"><button type="submit" onclick="openSearch()" class="btn btn-primary btn-form display-4">สมัครสมาชิก</button></span>
                        </form>
                </div>
            </div>
        </section>

        <jsp:include page="include/Footer.jsp"/>

        <script src="assets/web/assets/jquery/jquery.min.js"></script>
        <script src="assets/popper/popper.min.js"></script>
        <script src="assets/tether/tether.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/smoothscroll/smooth-scroll.js"></script>
        <script src="assets/dropdown/js/script.min.js"></script>
        <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
        <script src="assets/theme/js/script.js"></script>
        <script src="assets/formoid/formoid.min.js"></script>
        
       
    </body>
    <script>
        function openSearch() {
            document.getElementById("myOverlay").style.display = "block";
        }

        function closeSearch() {
            document.getElementById("myOverlay").style.display = "none";
        }
    </script>
</html>

