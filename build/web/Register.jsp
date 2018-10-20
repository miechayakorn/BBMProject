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
        
        <section class="menu cid-r6ZFttHx66" id="menu2-n">



            <nav class="navbar navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm bg-color transparent">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <div class="hamburger">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </button>
                <div class="menu-logo">
                    <div class="navbar-brand">
                        <span class="navbar-logo">
                            <a href="index.html">
                                <img src="assets/images/logo2.png" alt="Mobirise" title="">
                            </a>
                        </span>
                        <span class="navbar-caption-wrap"><a class="navbar-caption display-4 text-white" href="index.html">
                                BBM</a></span>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav nav-dropdown display-4" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white" href="index.html#features18-5" aria-expanded="false">ประเภทห้อง</a></li><li class="nav-item"><a class="nav-link link text-white" href="index.html#form4-k" aria-expanded="false">ข้อมูลโครงการ</a></li><li class="nav-item"><a class="nav-link link text-white" href="RemainingRoom.html" aria-expanded="false">จำนวนห้องที่เหลืออยู่</a></li></ul>
                    <div class="navbar-buttons mbr-section-btn"><a class="btn btn-sm btn-primary" href="https://mobirise.com/mobirise-free-win.zip">Sign up</a> <a class="btn btn-sm btn-primary" href="https://mobirise.com/mobirise-free-mac.zip">
                            Login</a> <a class="btn btn-sm btn-primary" href="https://mobirise.com/mobirise-free-mac.zip"><span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>
                            My Account</a> <a class="btn btn-sm btn-secondary" href="https://mobirise.com/mobirise-free-mac.zip"><span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span></a></div>
                </div>
            </nav>
        </section>

        <section class="engine"><a href="https://mobirise.info/j">website templates</a></section><section class="header11 cid-r706ZXr5MO" id="header11-o">

            <!-- Block parameters controls (Blue "Gear" panel) -->     

            <!-- End block parameters -->


            <div class="container align-left">
                <div class="media-container-column mbr-white col-md-12">

                    <h1 class="mbr-section-title py-3 mbr-fonts-style display-1"><strong>Register - สมัครสมาชิก</strong></h1>


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
                        <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">
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

        <section class="footer4 cid-r70cW4J9tT" id="footer4-v">





            <div class="container">
                <div class="media-container-row content mbr-white">
                    <div class="col-md-3 col-sm-4">
                        <div class="mb-3 img-logo">
                            <a href="https://mobirise.co/">
                                <img src="assets/images/logo2.png" alt="Mobirise">
                            </a>
                        </div>
                        <p class="mb-3 mbr-fonts-style foot-title display-7">
                            HOME</p>
                        <p class="mbr-text mbr-fonts-style mbr-links-column display-7"><strong><a href="index.html#form4-k" class="text-white">ข้อมูลโครงการ</a></strong><br><a href="room.html" class="text-white">ประเภทห้อง</a>
                            <br><a href="RemainingRoom.html" target="_blank" class="text-white">จำนวนห้องที่เหลืออยู่</a></p>
                    </div>
                    <div class="col-md-4 col-sm-8">
                        <p class="mb-4 foot-title mbr-fonts-style display-7"><strong>BBM -&nbsp;Condominium</strong></p>
                        <p class="mbr-text mbr-fonts-style foot-text display-7">เติมเต็มทุกจินตนาการ สนุกสนานทุกการใช้ชีวิต</p>
                    </div>
                    <div class="col-md-4 offset-md-1 col-sm-12">
                        <p class="mb-4 foot-title mbr-fonts-style display-7">
                            SUBSCRIBE
                        </p>
                        <p class="mbr-text mbr-fonts-style form-text display-7">
                            Get monthly updates and free resources.
                        </p>
                        <div class="media-container-column" data-form-type="formoid">
                            <div data-form-alert="" hidden="" class="align-center">Thanks for filling out the form!</div>

                            <form class="form-inline" action="https://mobirise.com/" method="post" data-form-title="Mobirise Form">
                                <input type="hidden" value="BSSD5OA88jmeNwqgyltuc8zrMxO5+Oh/VsfGlwjo8PK8onMzv8Bs393WIINWC2ZpdMFUunAdZUZEHdy1Aocqx0dWo4nWl+rVa3u8DXr2ME7P4+8dKAQFXJyWz3yUNOfw" data-form-email="true">
                                <div class="form-group">
                                    <input type="email" class="form-control input-sm input-inverse my-2" name="email" required="" data-form-field="Email" placeholder="Email" id="email-footer4-v">
                                </div>
                                <div class="input-group-btn m-2"><button href="" class="btn btn-primary display-4" type="submit" role="button">Subscribe</button></div>
                            </form>
                        </div>
                        <p class="mb-4 mbr-fonts-style foot-title display-7">
                            CONNECT WITH US
                        </p>
                        <div class="social-list pl-0 mb-0">
                            <div class="soc-item">

                                <span class="mbr-iconfont mbr-iconfont-social socicon-twitter socicon" style="color: rgb(118, 118, 118); fill: rgb(118, 118, 118);"></span>

                            </div>
                            <div class="soc-item">

                                <span class="mbr-iconfont mbr-iconfont-social socicon-facebook socicon" style="color: rgb(118, 118, 118); fill: rgb(118, 118, 118);"></span>

                            </div>
                            <div class="soc-item">

                                <span class="mbr-iconfont mbr-iconfont-social socicon-youtube socicon" style="color: rgb(118, 118, 118); fill: rgb(118, 118, 118);"></span>

                            </div>
                            <div class="soc-item">

                                <span class="mbr-iconfont mbr-iconfont-social socicon-instagram socicon" style="color: rgb(118, 118, 118); fill: rgb(118, 118, 118);"></span>

                            </div>
                            <div class="soc-item">

                                <span class="mbr-iconfont mbr-iconfont-social socicon-googleplus socicon" style="color: rgb(118, 118, 118); fill: rgb(118, 118, 118);"></span>

                            </div>
                            <div class="soc-item">

                                <span class="mbr-iconfont mbr-iconfont-social socicon-behance socicon" style="color: rgb(118, 118, 118); fill: rgb(118, 118, 118);"></span>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-lower">
                    <div class="media-container-row">
                        <div class="col-sm-12">
                            <hr>
                        </div>
                    </div>
                    <div class="media-container-row mbr-white">
                        <div class="col-sm-12 copyright">
                            <p class="mbr-text mbr-fonts-style display-7">
                                © Copyright 2018 (BBM)Condominium- All Rights Reserved
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


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

