<%-- 
    Document   : RemainingRoom
    Created on : Oct 29, 2018, 4:14:13 PM
    Author     : Student
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="https://fonts.googleapis.com/css?family=Athiti" rel="stylesheet">

        <style> 
            .seats {
                font-family: 'Athiti', sans-serif;
                font-size: 16pt;
            }
            .seatSelection {
                text-align: center;
                padding: 5px;
                margin: 15px;
            }

            .seatsReceipt {text-align: center;}

            .seatNumber {
                display: inline;
                padding: 10px;
                background-color: #5c86eb;
                color: #FFF;
                border-radius: 5px;
                cursor: default;
                height: 25px;
                width: 25px;
                line-height: 25px;
                text-align: center;
            }

            .seatRow {
                margin: 10px;
                padding: 10px;}

            .seatSelected {
                background-color: lightgreen;
                color: black;
            }

            .seatUnavailable {background-color: gray;}

            .seatRowNumber {
                clear: none;
                display: inline;
            }

            .hidden {display: none;}

            .seatsAmount {max-width: 2em;}
            .checkout col-lg-offset-6 {
                display: flex;
                justify-content: center;
                align-items: center;
            }

        </style>

    </head>
    <body>
        <jsp:include page="include/Header.jsp"/>

        <section class="engine"><a href="https://mobirise.info/k">how to develop own website</a></section>
        <section class="header11 cid-r70beVYQb0" id="header11-u">
            <div class="container align-left">
                <div class="media-container-column mbr-white col-md-12">
                    <h1 class="mbr-section-title py-3 mbr-fonts-style display-2"><strong>Remaining Room - จำนวนห้องที่เหลืออยู่</strong></h1>
                    <div class="container">
                        <div class="media-container-row">
                            <div class="col-md-8 align-center">
                                <div style="width: 30; margin-top: 10px;">
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
        <section class="cid-r7074fmFzA">
            <div class="container">
                <div class="row p-4">    
                    <div class="col-12">
                        <form action="Search">
                            <div class="input-group">
                                <div class="input-group-btn search-panel">

                                    <select name="search" id="mySearch" class = "btn dropdown-toggle border" >
                                        <option value="size">Size</option>
                                        <option value="type">Type</option>
                                        <option value="grather_than">Greather than</option>
                                        <option value="less_than">Less than</option>
                                    </select>
                                </div>


                                <input type="text" class="form-control" name="value" placeholder="Search term...">
                                <span class="input-group-btn">
                                    <button class="btn btn-sm" type="submit"><img src="https://png.icons8.com/color/search" width="50%"></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-md-8">
                        <div class="seatSelection">
                            <div class="seatsChart">
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Floor 8
                                    </div>
                                    <c:forEach  items="${floor8List}" var="floor8List" varStatus="vs">
                                        <div id="8_${vs.count}_${floor8List.roomnumber}" title="" role="checkbox" value="${floor8List.price}" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber ${floor8List.available == 1 ?"seatUnavailable":""}">${floor8List.roomnumber}</div>
                                    </c:forEach>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Floor 7
                                    </div>
                                    <c:forEach  items="${floor7List}" var="floor7List" varStatus="vs">
                                        <div id="7_${vs.count}_${floor7List.roomnumber}" title="" role="checkbox" value="${floor7List.price}" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber ${floor7List.available == 1 ?"seatUnavailable":""}">${floor7List.roomnumber}</div>
                                    </c:forEach>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Floor 6
                                    </div>
                                    <c:forEach  items="${floor6List}" var="floor6List" varStatus="vs">
                                        <div id="6_${vs.count}_${floor6List.roomnumber}" title="" role="checkbox" value="${floor6List.price}" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber ${floor6List.available == 1 ?"seatUnavailable":""}">${floor6List.roomnumber}</div>
                                    </c:forEach>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Floor 5
                                    </div>
                                    <c:forEach  items="${floor5List}" var="floor5List" varStatus="vs">
                                        <div id="5_${vs.count}_${floor5List.roomnumber}" title="" role="checkbox" value="${floor5List.price}" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber ${floor5List.available == 1 ?"seatUnavailable":""}">${floor5List.roomnumber}</div>
                                    </c:forEach>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Floor 4
                                    </div>
                                    <c:forEach  items="${floor4List}" var="floor4List" varStatus="vs">
                                        <div id="4_${vs.count}_${floor4List.roomnumber}" title="" role="checkbox" value="${floor4List.price}" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber ${floor4List.available == 1 ?"seatUnavailable":""}">${floor4List.roomnumber}</div>
                                    </c:forEach>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Floor 3
                                    </div>
                                    <c:forEach  items="${floor3List}" var="floor3List" varStatus="vs">
                                        <div id="3_${vs.count}_${floor3List.roomnumber}" title="" role="checkbox" value="${floor3List.price}" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber ${floor3List.available == 1 ?"seatUnavailable":""}">${floor3List.roomnumber}</div>
                                    </c:forEach>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Floor 2
                                    </div>
                                    <c:forEach  items="${floor2List}" var="floor2List" varStatus="vs">
                                        <div id="2_${vs.count}_${floor2List.roomnumber}" title="" role="checkbox" value="${floor2List.price}" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber ${floor2List.available == 1 ?"seatUnavailable":""}">${floor2List.roomnumber}</div>
                                    </c:forEach>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Floor 1
                                    </div>
                                    <c:forEach  items="${floor1List}" var="floor1List" varStatus="vs">
                                        <div id="1_${vs.count}_${floor1List.roomnumber}" title="" role="checkbox" value="${floor1List.price}" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber ${floor1List.available == 1 ?"seatUnavailable":""}">${floor1List.roomnumber}</div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="seatsReceipt">
                            <p><strong>Selected Room: <span class="seatsAmount" />0 </span></strong> <button id="btnClear" class="btn">Clear</button></p>
                            <form action="AddRoomToCart" method="post">
                                <ul id="seatsList" class="nav nav-stacked"></ul>
                                <br>
                                <p>-------------------------------</p>
                                <span>Total Price : </span><span class="txtSubTotal">0.00</span>฿<br />
                            </form>
                        </div>
                    </div>
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
                    data: ['${sold}', '${remaining}'],
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
    // Clicking any seat
    $(".seatNumber").click(
            function () {
                if (!$(this).hasClass("seatUnavailable")) {
                    // If selected, unselect it
                    if ($(this).hasClass("seatSelected")) {
                        var thisId = $(this).attr('id');
                        var price = $('#seatsList .' + thisId).val();
                        $(this).removeClass("seatSelected");
                        $('#seatsList .' + thisId).remove();
                        // Calling functions to update checkout total and seat counter.
                        removeFromCheckout(price);
                        refreshCounter();
                    } else {
                        // else, select it
                        // getting values from Seat
                        var thisId = $(this).attr('id');
                        var id = thisId.split("_");
                        var price = $(this).attr('value');
                        var seatDetails = " ROOMNUMBER:" + id[2] + " Price:" + price +"Baht";


                        var freeSeats = parseInt($('.freeSeats').first().text());
                        var selectedSeats = parseInt($(".seatSelected").length);

                        // If you have free seats available the price of this one will be 0.
                        if (selectedSeats < freeSeats) {
                            price = 0;
                        }

                        // Adding this seat to the list
                        var seatDetails = '<input type="hidden"  name="roomnumber" value=' + id[2] + '>' + " ROOMNUMBER:" + id[2] + " Price:" + price +' ฿'+ '<br> <input id="btnCheckout" type="submit" class="btn-sm btn-primary" value="Add Room">';
                        $("#seatsList").append('<li value=' + price + ' class=' + thisId + '>' + seatDetails + "  " + "<button id='remove:" + thisId + "'+ class='btn btn-default btn-sm removeSeat' value='" + price + "'><strong>X</strong></button></li>");
                        $(this).addClass("seatSelected");

                        addToCheckout(price);
                        refreshCounter();
                    }
                }
            }
    );
    // Clicking any of the dynamically-generated X buttons on the list
    $(document).on('click', ".removeSeat", function () {
        // Getting the Id of the Seat
        var id = $(this).attr('id').split(":");
        var price = $(this).attr('value')
        $('#seatsList .' + id[1]).remove();
        $("#" + id[1] + ".seatNumber").removeClass("seatSelected");
        removeFromCheckout(price);
        refreshCounter();
    }
    );
    // Show tooltip on hover.
    $(".seatNumber").hover(
            function () {
                if (!$(this).hasClass("seatUnavailable")) {
                    var id = $(this).attr('id');
                    var id = id.split("_");
                    var price = $(this).attr('value');
                    var tooltip = "FLOOR: " + id[0] + " ROOM:" + id[1] + " Price:Baht:" + price;

                    $(this).prop('title', tooltip);
                } else
                {
                    $(this).prop('title', "Seat unavailable");
                }
            }
    );

    // Function to refresh seats counter
    function refreshCounter() {
        $(".seatsAmount").text($(".seatSelected").length);
    }
    // Add seat to checkout
    function addToCheckout(thisSeat) {
        var seatPrice = parseInt(thisSeat);
        var num = parseInt($('.txtSubTotal').text());
        num += seatPrice;
        num = num.toString();
        $('.txtSubTotal').text(num);
    }
    // Remove seat from checkout
    function removeFromCheckout(thisSeat) {
        var seatPrice = parseInt(thisSeat);
        var num = parseInt($('.txtSubTotal').text());
        num -= seatPrice;
        num = num.toString();
        $('.txtSubTotal').text(num);
    }

    // Clear seats.
    $("#btnClear").click(
            function () {
                $('.txtSubTotal').text(0);
                $(".seatsAmount").text(0);
                $('.seatSelected').removeClass('seatSelected');
                $('#seatsList li').remove();
            }
    );
    $(document).ready(function (e) {
        $('.search-panel .dropdown-menu').find('a').click(function (e) {
            e.preventDefault();
            var param = $(this).attr("href").replace("#", "");
            var concept = $(this).text();
            $('.search-panel span#search_concept').text(concept);
            $('.input-group #search_param').val(param);
        });
    });
</script>
