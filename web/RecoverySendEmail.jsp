<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Forget Password - BBMProject</title>
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

    </head>
    <body>
        <jsp:include page="include/Header.jsp"/>
        <div id="myOverlay" class="overlay">
            <center><div class="loader"></div></center>
        </div>
        <section class="engine"><a href="https://mobirise.info/t">amp templates</a></section><section class="cid-r7McK3Rb9n mbr-fullscreen mbr-parallax-background" id="header15-12">
            <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(7, 59, 76);"></div>

            <div class="container align-center">
                <div class="row">
                    <div class="mbr-white col-lg-12 col-md-12 content-container">
                        <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">Forget Password
                            <p class="mbr-text pb-3 mbr-fonts-style display-5">ลืมรหัสผ่าน</p></h1>
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
                            <c:when test="${status == 'notEmail'}">
                                <div class="alert alert-danger">
                                    <strong>Error!</strong> ไม่มี Email นี้ในระบบของเรา กรุณาลองใหม่
                                </div>
                            </c:when>
                            <c:when test="${status == 'ActivateKeyError'}">
                                <div class="alert alert-danger">
                                    <strong>ActivateKey Error!</strong> กรุณาทำรายการของท่านที่เว็บของเราใหม่อีกครั้ง
                                </div>
                            </c:when>
                        </c:choose>
                        
                    </div>
                    <div class="col-12 form-container mbr-white">
                        <form class="form-signin" action="Recovery">
                            <div class="form-label-group">
                                <label>Email address</label>
                                <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                                <br>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg"  onclick="ShowLoad()">Reset your password</button>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.1/dist/sweetalert2.all.min.js"></script>


    </body>
    <script>
    function ShowLoad() {
                swal({
                                        title: 'ระบบกำลังประมวลผล',
                                        html: 'โปรดรอสักครู่..',
                                        timer: 9800,
                                        onOpen: () => {
                                            swal.showLoading()
                                        }
                                    })
    }
    </script>
</html>

