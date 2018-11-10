<%-- 
    Document   : RemainingRoom
    Created on : Oct 29, 2018, 4:14:13 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="generator" content="Mobirise v4.8.6, mobirise.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <link rel="shortcut icon" href="assets/images/bbm-logo-122x122.png" type="image/x-icon">
        <meta name="description" content="Remaining Room">
        <title>RemainingRoom</title>
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
        <jsp:include page="include/Header.jsp"/>

        <section class="engine"><a href="https://mobirise.info/k">how to develop own website</a></section><section class="header11 cid-r70beVYQb0" id="header11-u">

            <!-- Block parameters controls (Blue "Gear" panel) -->     

            <!-- End block parameters -->


            <div class="container align-left">
                <div class="media-container-column mbr-white col-md-12">
                    <h1 class="mbr-section-title py-3 mbr-fonts-style display-2"><strong>Remaining Room - จำนวนห้องที่เหลืออยู่</strong></h1>
                    <div class="container">
                        <div class="media-container-row">
                            <div class="col-md-8 align-center">
                                <div style="width: 30">
                                    <canvas id="myChart"> </canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
                <a href="#next">
                    <i class="mbri-down mbr-iconfont"></i>
                </a>
            </div>
        </section>


        <jsp:include page="include/Footer.jsp"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
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
</html>
<script>
    var ctx = document.getElementById("myChart");
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["ห้องที่ขายแล้ว", "จำนวนห้องที่เหลือ"],
            datasets: [{
                    data: ['${remaining}', '${sold}'],
                    backgroundColor: [
                        '#F17872',
                        '#00A572',
                    ],
                    borderColor: [
                        '#F17872',
                        '#00A572',
                    ],
                }]
        },
        options: {
            rotation: 1 * Math.PI,
            circumference: 1 * Math.PI,
            legend: {
            labels: {
                fontColor: "white",
                fontSize: 22,
                fontFamily: "Athiti"
               
            }
        },
        }
    });
</script>
