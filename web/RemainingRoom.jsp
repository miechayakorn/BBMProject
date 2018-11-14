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

        <div class="seats">
            <table>
                <tr>

                </tr>
            </table>
            <div class="seatSelection">
                <p class="seatSection">
                    Your first
                    <span class="freeSeats">2</span> seats selected will be Free.<br /> You can add more seats and proceed to check out.
                </p>

                <table>
                    <tr>
                        <td>
                            <div class="seatsChart">
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Row 1
                                    </div>
                                    <div id="1_1" title="" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">1</div>
                                    <div id="1_2" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">2</div>
                                    <div id="1_3" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">3</div>
                                    <div id="1_4" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">4</div>
                                    <div id="1_5" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">5</div>
                                    <div id="1_6" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">6</div>
                                    <div id="1_7" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                    <div id="1_8" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">8</div>


                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Row 2
                                    </div>
                                    <div id="2_1" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">1</div>
                                    <div id="2_2" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">2</div>
                                    <div id="2_3" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">3</div>
                                    <div id="2_4" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">4</div>
                                    <div id="2_5" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">5</div>
                                    <div id="2_6" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">6</div>
                                    <div id="2_7" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                    <div id="2_8" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">8</div>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Row 3
                                    </div>
                                    <div id="3_1" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">1</div>
                                    <div id="3_2" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">2</div>
                                    <div id="3_3" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">3</div>
                                    <div id="3_4" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">4</div>
                                    <div id="3_5" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">5</div>
                                    <div id="3_6" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">6</div>
                                    <div id="3_7" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                    <div id="3_8" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">8</div>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Row 4
                                    </div>
                                    <div id="4_1" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">1</div>
                                    <div id="4_2" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">2</div>
                                    <div id="4_3" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">3</div>
                                    <div id="4_4" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">4</div>
                                    <div id="4_5" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">5</div>
                                    <div id="4_6" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable ">6</div>
                                    <div id="4_7" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                    <div id="4_8" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">8</div>

                                </div>
                                <div class="seatRow">
                                    <div class="seatRowNumber">
                                        Row 5
                                    </div>
                                    <div id="5_1" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">1</div>
                                    <div id="5_2" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">2</div>
                                    <div id="5_3" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">3</div>
                                    <div id="5_4" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">4</div>
                                    <div id="5_5" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">5</div>
                                    <div id="5_6" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable ">6</div>
                                    <div id="5_7" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                    <div id="5_8" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">8</div>
                                </div>
                        </td>
                        <td>
                            <div class="seatsReceipt">
                                <p><strong>Selected Seats: <span class="seatsAmount" />0 </span></strong> <button id="btnClear" class="btn">Clear</button></p>
                                <ul id="seatsList" class="nav nav-stacked"></ul>
                            </div>
                        </td>
                    </tr>
                </table>



            </div>
        </div>

        <div class="checkout col-lg-offset-6">
            <span>Subtotal: CA$</span><span class="txtSubTotal">0.00</span><br /><button id="btnCheckout" name="btnCheckout" class="btn btn-primary"> Check out </button>
        </div>
    </div>







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
                        var seatDetails = "Row: " + id[0] + " Seat:" + id[1] + " Price:CA$:" + price;


                        var freeSeats = parseInt($('.freeSeats').first().text());
                        var selectedSeats = parseInt($(".seatSelected").length);

                        // If you have free seats available the price of this one will be 0.
                        if (selectedSeats < freeSeats) {
                            price = 0;
                        }

                        // Adding this seat to the list
                        var seatDetails = "Row: " + id[0] + " Seat:" + id[1] + " Price:CA$:" + price;
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
                    var tooltip = "Row: " + id[0] + " Seat:" + id[1] + " Price:CA$:" + price;

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
</script>
