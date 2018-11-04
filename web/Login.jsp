<%-- 
    Document   : Login
    Created on : Oct 9, 2018, 12:38:25 PM
    Author     : Kridtakom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="generator" content="Mobirise v4.8.6, mobirise.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <link rel="shortcut icon" href="assets/images/bbm-logo-122x122.png" type="image/x-icon">
        <meta name="description" content="">
        <title>Please Sign In</title>
        <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
        <link rel="stylesheet" href="assets/web/assets/mobirise-icons2/mobirise2.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/socicon/css/styles.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">

        <title>Login Page</title>
        <style>
            .panel-heading {
                padding: 5px 15px;
            }

            .panel-footer {
                padding: 1px 15px;
                color: #A0A0A0;
            }

            .profile-img {
                width: 96px;
                height: 96px;
                margin: 0 auto 10px;
                display: block;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
            }
            #statusLogin{
                width: 96px;
                height: 50px;
                background-color: wheat;
            }
        </style>

    </head>
    <body>
        <jsp:include page="include/Header.jsp"/>

        <section class="engine"><a href="https://mobirise.info/t">amp templates</a></section><section class="cid-r7McK3Rb9n mbr-fullscreen mbr-parallax-background" id="header15-12">
            <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(7, 59, 76);"></div>

            <div class="container align-right">
                <div class="row">
                    <div class="mbr-white col-lg-8 col-md-7 content-container">
                        <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">Please Log In</h1>
                        <p class="mbr-text pb-3 mbr-fonts-style display-5">กรุณา.. เข้าสู่ระบบ</p>
                    </div>
                    <div class="col-lg-4 col-md-5">
                        <div class="form-container">
                            <form class="mbr-form" action="Login" method="post">
                                <div data-for="email">
                                    <div class="form-group">
                                        <input type="email" class="form-control px-3" name="email" placeholder="Email" required="" id="email-header15-12">
                                    </div>
                                </div>
                                <div data-for="phone">
                                    <div class="form-group">
                                        <input type="password" class="form-control px-3" name="password" placeholder="Password" id="phone-header15-12">
                                    </div>
                                </div>
                                <c:if test="${message == null}">
                                    <p style="color: red;">${message}</p>
                                </c:if>
                                <span class="input-group-btn"><button href="" type="submit" class="btn btn-form btn-success display-4"><span class="mobi-mbri mobi-mbri-user-2 mbr-iconfont mbr-iconfont-btn"></span>Login</button></span>
                            </form>
                        </div>
                    </div>
                </div>

        </section>
        <jsp:include page="include/Footer.jsp"/>

        <script src="assets/web/assets/jquery/jquery.min.js"></script>
        <script src="assets/popper/popper.min.js"></script>
        <script src="assets/tether/tether.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/dropdown/js/script.min.js"></script>
        <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
        <script src="assets/parallax/jarallax.min.js"></script>
        <script src="assets/smoothscroll/smooth-scroll.js"></script>
        <script src="assets/theme/js/script.js"></script>
        <script src="assets/formoid/formoid.min.js"></script>


    </body>
</html>
