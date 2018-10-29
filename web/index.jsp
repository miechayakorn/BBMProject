<%-- 
    Document   : index
    Created on : 08-Oct-2018, 22:55:48
    Author     : Acer_E5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.8.6, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/bbm-logo-122x122.png" type="image/x-icon">
  <meta name="description" content="">
  <title>Home</title>
  <link href="https://fonts.googleapis.com/css?family=Athiti" rel="stylesheet">
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
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
        <c:choose>
            <c:when test="${status == 'RecoveryTrue'}">
                <div class="alert alert-success">
                    <strong>ยินดีต้อนรับการกลับมาของท่าน!!</strong> ในตอนนี้ท่านสามารถใช้รหัสผ่านใหม่ได้เรียบร้อยแล้ว
                </div>
            </c:when>
            <c:when test="${status == 'notEmail'}">
                <div class="alert alert-danger">
                    <strong>Error!</strong> ไม่มี Email นี้ในระบบของเรา กรุณาลองใหม่
                </div>
            </c:when>
            <c:when test="${status == 'ActivateTrue'}">
                <div class="alert alert-success">
                    <strong>ActivateKey success!!</strong> ในตอนนี้ท่านสามารถใช้งานระบบของเราได้อย่างเต็มรูปแบบ
                </div>
            </c:when>
            <c:when test="${status == 'ActivateFalse'}">
                <div class="alert alert-danger">
                    <strong>Activate Error!!</strong> คุณอาจเคยActivateไปแล้ว..
                </div>
            </c:when>
            <c:otherwise>

            </c:otherwise>
        </c:choose>
        <section class="menu cid-r6ZFttHx66" id="menu2-c">



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
                                <img src="assets/images/bbm-logo-122x122.png" alt="Mobirise" title="">
                            </a>
                        </span>
                        <span class="navbar-caption-wrap"><a class="navbar-caption display-4 text-white" href="index.html">
                                BBM</a></span>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav nav-dropdown display-4" data-app-modern-menu="true"><li class="nav-item"><a class="nav-link link text-white" href="Room.html" aria-expanded="false">รายละเอียดห้อง</a></li><li class="nav-item"><a class="nav-link link text-white" href="index.html#form4-k" aria-expanded="false">ข้อมูลโครงการ</a></li><li class="nav-item"><a class="nav-link link text-white" href="RemainingRoom.html" aria-expanded="false">จำนวนห้องที่เหลืออยู่</a></li></ul>
                    <div class="navbar-buttons mbr-section-btn"><a class="btn btn-sm btn-primary" href="Register.html">Register</a> <a class="btn btn-sm btn-primary" href="Login.html">
                            Login</a> <a class="btn btn-sm btn-primary" href="MyAccount.html"><span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>
                            My Account</a> <a class="btn btn-sm btn-secondary" href="https://mobirise.com/mobirise-free-mac.zip"><span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span></a></div>
                </div>
            </nav>
        </section>

        <section class="engine"><a href="https://mobirise.info/k">how to develop free website</a></section><section class="carousel slide cid-r6ZEUwHLOQ" data-interval="false" id="slider1-a">



            <div class="full-screen"><div class="mbr-slider slide carousel" data-pause="true" data-keyboard="false" data-ride="carousel" data-interval="4000"><ol class="carousel-indicators"><li data-app-prevent-settings="" data-target="#slider1-a" class=" active" data-slide-to="0"></li><li data-app-prevent-settings="" data-target="#slider1-a" data-slide-to="1"></li><li data-app-prevent-settings="" data-target="#slider1-a" data-slide-to="2"></li></ol><div class="carousel-inner" role="listbox"><div class="carousel-item slider-fullscreen-image active" data-bg-video-slide="false" style="background-image: url(assets/images/1.jpg);"><div class="container container-slide"><div class="image_wrapper"><div class="mbr-overlay"></div><img src="assets/images/1.jpg"><div class="carousel-caption justify-content-center"><div class="col-10 align-center"><h2 class="mbr-fonts-style display-1">BBM - Condominium</h2><p class="lead mbr-text mbr-fonts-style display-5">รังสรรค์ความสุขกับทุกจังหวะของชีวิต ให้คุณได้เพลิดเพลินไปกับทุกกิจกรรมที่หลากหลาย ตลอด 24 ชั่วโมง พร้อมดื่มด่ำกับทัศนียภาพวิวเมืองที่ตัดเส้นขอบฟ้าในมุมมองที่ไม่เหมือนใคร</p><div class="mbr-section-btn" buttons="0"><a class="btn btn-success display-4" href="Room.html"><span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>View Room</a> </div></div></div></div></div></div><div class="carousel-item slider-fullscreen-image" data-bg-video-slide="https://www.youtube.com/watch?v=fwkKc6M60-0"><div class="mbr-overlay"></div><div class="container container-slide"><div class="image_wrapper"><img src="assets/images/2.jpg" style="opacity: 0;"><div class="carousel-caption justify-content-center"><div class="col-10 align-left"><h2 class="mbr-fonts-style display-1">THE Sculpture</h2><p class="lead mbr-text mbr-fonts-style display-5">สุนทรีย์แห่งประสบการณ์การใช้ชีวิตที่ผสมผสานการออกแบบอย่างมีเอกลักษณ์ระดับโรงแรม เนรมิตให้ทุกช่วงเวลาสำคัญของชีวิตเป็นช่วงเวลาสุดพิเศษ ด้วยสิ่งอำนวยความสะดวกที่ครบครันตอบสนองทุกฟังก์ชั่นการใช้งาน มอบประสบการณ์การใช้ชีวิตอย่างสมบูรณ์แบบ</p></div></div></div></div></div><div class="carousel-item slider-fullscreen-image" data-bg-video-slide="false" style="background-image: url(assets/images/3.jpg);"><div class="container container-slide"><div class="image_wrapper"><div class="mbr-overlay"></div><img src="assets/images/3.jpg"><div class="carousel-caption justify-content-center"><div class="col-10 align-right"><p class="lead mbr-text mbr-fonts-style display-5">เมื่อ “จินตนาการ” คือตัวแทนของความปรารถนา 
                                                <br>ในสังคมที่เร่งรีบและความต้องการที่หลากหลาย ก่อให้เกิดจินตนาการที่มีรูปแบบไม่ตายตัว 
                                                <br>ไร้ขีดจำกัดและบางทีก็ไม่มีเหตุผล เพียงเพื่อตอบสนองทุกความเป็นคุณ&nbsp;</p><div class="mbr-section-btn" buttons="0"><a class="btn btn-info display-4" href="https://mobirise.com"><span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>Search</a> </div></div></div></div></div></div></div><a data-app-prevent-settings="" class="carousel-control carousel-control-prev" role="button" data-slide="prev" href="#slider1-a"><span aria-hidden="true" class="mbri-left mbr-iconfont"></span><span class="sr-only">Previous</span></a><a data-app-prevent-settings="" class="carousel-control carousel-control-next" role="button" data-slide="next" href="#slider1-a"><span aria-hidden="true" class="mbri-right mbr-iconfont"></span><span class="sr-only">Next</span></a></div></div>

        </section>

        <section class="features18 popup-btn-cards cid-r6WgGm1xJj" id="features18-5">




            <div class="container">
                <h2 class="mbr-section-title pb-3 align-center mbr-fonts-style display-2"><strong>ประเภทของห้องในคอนโดมิเนียมของเรา :</strong></h2>

                <div class="media-container-row pt-5">
                    <div class="card p-3 col-12 col-md-6 col-lg-4">
                        <div class="card-wrapper ">
                            <div class="card-img">
                                <div class="mbr-overlay"></div>
                                <div class="mbr-section-btn text-center"><a href="Room.html" class="btn btn-primary">
                                        View</a></div>
                                <img src="assets/images/a1-676x526.jpg" alt="Mobirise" title="">
                            </div>
                            <div class="card-box">
                                <h4 class="card-title mbr-fonts-style display-7">Type A<br></h4>

                            </div>
                        </div>
                    </div>
                    <div class="card p-3 col-12 col-md-6 col-lg-4">
                        <div class="card-wrapper">
                            <div class="card-img">
                                <div class="mbr-overlay"></div>
                                <div class="mbr-section-btn text-center"><a href="Room.html" class="btn btn-primary">
                                        View</a></div>
                                <img src="assets/images/b1-676x526.jpg" alt="Mobirise" title="">
                            </div>
                            <div class="card-box">
                                <h4 class="card-title mbr-fonts-style display-7">Type B</h4>

                            </div>
                        </div>
                    </div>

                    <div class="card p-3 col-12 col-md-6 col-lg-4">
                        <div class="card-wrapper">
                            <div class="card-img">
                                <div class="mbr-overlay"></div>
                                <div class="mbr-section-btn text-center"><a href="Room.html" class="btn btn-primary">
                                        View</a></div>
                                <img src="assets/images/c1-676x526.jpg" alt="Mobirise" title="">
                            </div>
                            <div class="card-box">
                                <h4 class="card-title mbr-fonts-style display-7">
                                    Type C</h4>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>

        <section class="mbr-section article content10 cid-r6ZTd1n76i" id="content10-j">



            <div class="container">
                <div class="inner-container" style="width: 100%;">
                    <hr class="line" style="width: 25%;">
                    <div class="section-text align-center mbr-white mbr-fonts-style display-5"><div><strong>คอนโดหรูทองหล่อ</strong><span style="font-size: 1.5rem;"> บนพื้นที่สีเขียว 2 ไร่ ใจกลางสุขุมวิท สู่การออกแบบที่เป็นเอกลักษณ์&nbsp;</span><br></div><br><div><span style="font-size: 1.5rem;"><strong>ผสานเทคโนโลยี</strong> คอมมูนิตี้ และธรรมชาติได้อย่างลงตัว สะท้อนไลฟ์สไตล์ที่แตกต่างอย่างเหนือระดับ ให้คุณได้เติมเต็มชีวิตอย่างสมบูรณ์แบบในทุกมิติ</span></div><div><span style="font-size: 1.5rem;"><br></span><span style="font-size: 1.5rem;"><strong>สัมผัสที่สุดของชีวิต…</strong>กับคอนโดมิเนียมที่สูงที่สุดในย่านทองหล่อ-เอกมัย</span></div><div><span style="font-size: 1.5rem;"></span></div></div>
                    <hr class="line" style="width: 25%;">
                </div>
            </div>
        </section>

        <section class="mbr-section form4 cid-r6ZZHv1vwP mbr-parallax-background" id="form4-k">



            <div class="mbr-overlay" style="opacity: 0.9; background-color: rgb(239, 239, 239);">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="google-map"><iframe frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0Dx_boXQiwvdz8sJHoYeZNVTdoWONYkU&amp;q=place_id:ChIJn6wOs6lZwokRLKy1iqRcoKw" allowfullscreen=""></iframe></div>
                    </div>
                    <div class="col-md-6">
                        <h2 class="pb-3 align-left mbr-fonts-style display-2">ที่ตั้ง และข้อมูลการติดต่อ</h2>
                        <div>
                            <div class="icon-block pb-3">
                                <span class="icon-block__icon">
                                    <span class="mbri-letter mbr-iconfont"></span>
                                </span>
                                <h4 class="icon-block__title align-left mbr-fonts-style display-5">
                                    Don't hesitate to contact us
                                </h4>
                            </div>
                            <div class="icon-contacts pb-3">
                                <h5 class="align-left mbr-fonts-style display-7"><strong>
                                        ที่อยู่
                                    </strong></h5>
                                <p class="mbr-text align-left mbr-fonts-style display-7">บริษัท บีบีเอม คอนโดมิเนียม จำกัด (มหาชน) 
                                    <br>126 ถนน ประชาอุทิศ แขวง บางมด เขต ทุ่งครุ กรุงเทพมหานคร 10140&nbsp;<br>
                                    <br><strong>โทร</strong> : 01 234 5555,02 345 6666-1 ,02 345 6666-2<br><strong>แฟกซ์</strong> : 01 234 5555,02 345 6666-33<br><strong>อีเมล์</strong> :&nbsp;bbmproject.noreply@gmail.com</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="mbr-section info2 cid-r6ZO0joKpB" id="info2-g">



            <div class="mbr-overlay" style="opacity: 0.8; background-color: rgb(51, 51, 51);">
            </div>

            <div class="container">
                <div class="row main justify-content-center">
                    <div class="media-container-column col-12 col-lg-3 col-md-4">
                        <div class="mbr-section-btn align-left py-4"><a class="btn btn-primary display-4" href="RemainingRoom.html"><span class="mbri-rocket mbr-iconfont mbr-iconfont-btn"></span>Let Go!</a></div>
                    </div>
                    <div class="media-container-column title col-12 col-lg-7 col-md-6">

                        <h3 class="mbr-section-subtitle align-right mbr-light mbr-white mbr-fonts-style display-5">เลือกชมห้องคอนโดมิเนียมที่เหลืออยู่ ณ ตอนนี้</h3>
                    </div>
                </div>
            </div>
        </section>

        <section class="clients cid-r6WhSlujae mbr-parallax-background" id="clients-6">


            <div class="mbr-overlay" style="opacity: 0.9; background-color: rgb(230, 230, 230);">
            </div>
            <div class="container mb-5">
                <div class="media-container-row">
                    <div class="col-12 align-center">
                        <h2 class="mbr-section-title pb-3 mbr-fonts-style display-1">
                            ข้อมูลผู้ถือหุ้น</h2>
                        <h3 class="mbr-section-subtitle mbr-light mbr-fonts-style display-5">มุ่งมั่นพัฒนาและจัดหาที่พักอาศัย รวมถึงส่งเสริมกิจกรรมไลฟ์สไตล์ 
                            <div>และประสบการณ์ที่มีเอกลักษณ์เฉพาะตัว เราพร้อมเป็นส่วนหนึ่งของชุมชนของคุณ 
                            </div><div>และพร้อมที่จะดูแลคุณทั้งในวันนี้ พรุ่งนี้ และตลอดไป</div></h3>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="carousel slide" data-ride="carousel" role="listbox">
                    <div class="carousel-inner" data-visible="5">





                        <div class="carousel-item ">
                            <div class="media-container-row">
                                <div class="col-md-12">
                                    <div class="wrap-img ">
                                        <img src="assets/images/1.png" class="img-responsive clients-img">
                                    </div>
                                </div>
                            </div>
                        </div><div class="carousel-item ">
                            <div class="media-container-row">
                                <div class="col-md-12">
                                    <div class="wrap-img ">
                                        <img src="assets/images/2.png" class="img-responsive clients-img">
                                    </div>
                                </div>
                            </div>
                        </div><div class="carousel-item ">
                            <div class="media-container-row">
                                <div class="col-md-12">
                                    <div class="wrap-img ">
                                        <img src="assets/images/3.png" class="img-responsive clients-img">
                                    </div>
                                </div>
                            </div>
                        </div><div class="carousel-item ">
                            <div class="media-container-row">
                                <div class="col-md-12">
                                    <div class="wrap-img ">
                                        <img src="assets/images/4.png" class="img-responsive clients-img">
                                    </div>
                                </div>
                            </div>
                        </div><div class="carousel-item ">
                            <div class="media-container-row">
                                <div class="col-md-12">
                                    <div class="wrap-img ">
                                        <img src="assets/images/5.png" class="img-responsive clients-img">
                                    </div>
                                </div>
                            </div>
                        </div></div>
                    <div class="carousel-controls">
                        <a data-app-prevent-settings="" class="carousel-control carousel-control-prev" role="button" data-slide="prev">
                            <span aria-hidden="true" class="mbri-left mbr-iconfont"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a data-app-prevent-settings="" class="carousel-control carousel-control-next" role="button" data-slide="next">
                            <span aria-hidden="true" class="mbri-right mbr-iconfont"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <section class="footer4 cid-r6ZN1bz4el" id="footer4-f">





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
                                <input type="hidden" value="NILGD4dOQy2N8D67w9zacK4PvfiZ3n2nI1hOhUWLOPgNEjYIO27VN74DzA1/1AR+s2LSfkxOVhNNKkuZfNvPNIwC2NwvFlI/aZE87Ny6ReDNSl3nbGHN4jlD87GHvQxK" data-form-email="true">
                                <div class="form-group">
                                    <input type="email" class="form-control input-sm input-inverse my-2" name="email" required="" data-form-field="Email" placeholder="Email" id="email-footer4-f">
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
        <script src="assets/ytplayer/jquery.mb.ytplayer.min.js"></script>
        <script src="assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
        <script src="assets/bootstrapcarouselswipe/bootstrap-carousel-swipe.js"></script>
        <script src="assets/parallax/jarallax.min.js"></script>
        <script src="assets/theme/js/script.js"></script>
        <script src="assets/slidervideo/script.js"></script>
        <script src="assets/formoid/formoid.min.js"></script>
    </body>
</html>
