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
        <title>Change Password - BBMProject</title>
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

    </head>
    <body>
        <jsp:include page="include/Header.jsp"/>

        <section class="engine"><a href="https://mobirise.info/t">amp templates</a></section><section class="cid-r7McK3Rb9n mbr-fullscreen mbr-parallax-background" id="header15-12">
            <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(7, 59, 76);"></div>

            <div class="container align-center">
                <div class="row">
                    <div class="mbr-white col-lg-12 col-md-12 content-container">
                        <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">Change Password
                            <p class="mbr-text pb-3 mbr-fonts-style display-5">เปลี่ยนรหัสผ่าน</p></h1>
                    </div>
                    <div class="col-12 mbr-white">
                        <form class="form-signin" action="Recovery">
                            <div class="form-label-group">
                                <label>Email address</label>
                                <input type="email" name="email" value="${email}" readonly="readonly" id="inputEmail" class="form-control" placeholder="Email address">
                                <br>
                            </div>
                            <input type="hidden" name="activateKey" value="${activateKey}" class="form-control" required autofocus>
                            <div class="form-label-group">
                                <label>Password</label>
                                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                                <br>
                            </div>
                            <button class="btn btn-primary btn-lg" type="submit">Change Password</button>
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