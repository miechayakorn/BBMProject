<%-- 
    Document   : ShowCart
    Created on : 16-Nov-2018, 11:53:04
    Author     : Acer_E5
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
    </head>
    <style>
        html,
        body {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            letter-spacing: 1.5px;
            background-repeat: repeat;
            background-size: 150px 150px;
        }

        .paypal {
            position: relative;
            left: 50%;
            display: inline-block;
            /*min-width: 500px;*/
            max-width: 100%;
            width: auto;
            margin: 50px auto 25px;
            padding: 20px 0;
            clear: both;

            -webkit-transform: translateX(-50%);
            -ms-transform: translateX(-50%);
            -o-transform: translateX(-50%);
            transform: translateX(-50%);
        }

        .paypal__header {
            display: flex;
            -ms-align-items: flex-start;
            align-items: flex-start;

            padding: 30px 30px 45px;
            background: #fff;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
        }

        .paypal__logo-wrapper {
            flex: 1 0 40%;
        }

        .paypal__logo {
            display: block;
            width: 50px;
            height: auto;
            margin-left: 15px;
        }

        .paypal__header-info {
            flex: 1 0 50%;
        }

        .paypal__date,
        .paypal__ref {
            display: block;
            font-size: 19px;
            color: #aaa;
            font-weight: 300;
        }

        .paypal__date {
            margin-bottom: 5px;
        }

        .paypal__subheader-wrapper {
            background: #fff;
            padding-bottom: 20px;
        }

        .paypal__subheader {
            padding: 0 45px 0 40px;
            border-left: 5px solid #029de0;
        }

        .paypal__username {
            margin: 0 0 10px 0;
            font-size: 22px;
            font-weight: 600;
        }

        .paypal__help-text {
            color: #aaa;
            font-weight: 300;
        }

        .paypal__cart {
            display: block;
            padding: 25px 30px 45px;
        }

        .paypal__cart-title {
            display: block;
            margin-top: 0;
            margin-bottom: 25px;
            text-align: center;
        }

        .paypal__cart-list {
            margin: 0;
            padding: 0 15px;
            list-style: none;
        }

        .paypal__cart-item {
            display: block;
            padding-top: 20px;
            margin-bottom: 20px;
            border-top: 2px dashed #aaa;

            font-size: 18px;
        }

        .paypal__cart-item:first-child {
            border-top: 0;
        }

        .paypal__cart-item:last-child {
            margin-bottom: 0;
            border-top: 2px solid #FFE155;
        }

        .paypal__index {
            padding-right: 15px;
            color: #aaa;
            font-weight: 300;
        }

        .paypal__item-name {
            color: #aaa;
            font-weight: 300;
        }

        .paypal__item-price {
            float: right;
            letter-spacing: 1px;
        }

        .paypal__cart-total {
            font-size: 20px;
            text-transform: uppercase;
        }

        .paypal__footer {
            position: relative;
            padding: 30px 20px;
            border-top: 2px dashed #FF84A1;

            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        .paypal__footer::before,
        .paypal__footer::after {
            content: '';
            position: absolute;
            top: 0;
            border: 4px solid transparent;

            -webkit-transform: translateY(calc(-50% - 1px));
            -ms-transform: translateY(calc(-50% - 1px));
            -o-transform: translateY(calc(-50% - 1px));
            transform: translateY(calc(-50% - 1px));
        }

        .paypal__footer::before {
            left: 0;
            border-left: 7px solid #ff85a1;
        }

        .paypal__footer::after {
            right: 0;
            border-right: 7px solid #ff85a1;
        }

        .paypal__barcode {
            display: block;
            margin: 0 auto;
            max-width: 300px;
            height: auto;
        }

        /**
         * Paypal Animations
         */

        @keyframes show-paypal {
            0% {
                opacity: 0;
                transform: scale(0) translateX(-50%);
            }

            85% {
                opacity: 0;
            }

            100% {
                opacity: 1;
                transform: scale(1) translateX(-50%);
            }
        }

        .paypal {
            transform-origin: top left;
            animation: show-paypal 1s ease-out forwards;
        }

        @keyframes show-subheader {
            0% {
                opacity: 0;
                transform: scale(0);
            }

            65% {
                opacity: 0;
            }

            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .paypal__subheader {
            opacity: 0;
            animation: show-subheader 1s 0.5s ease-out forwards;
        }

        @keyframes slide-down {
            to {
                transform: perspective(100px) rotateX(0) translate3d(0, 0, 0);
            }
        }

        .paypal__cart {
            background-color: #fff;

            transform-style: preserve-3d;
            transform-origin: top center;
            transform: perspective(100px) rotateX(-90deg) translate3d(0, 0, 0);

            animation: slide-down 0.4s 2s ease-out forwards;
        }

        .paypal__footer {
            background-color: #fff;

            transform-style: preserve-3d;
            transform-origin: top center;
            transform: perspective(100px) rotateX(-90deg) translate3d(0, 0, 0);

            animation: slide-down 0.4s 2.5s ease-out forwards;
        }

        @keyframes show-cart-title {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .paypal__cart-title {
            opacity: 0;
            transform: translateY(10px);

            animation: show-cart-title 0.5s 2.25s ease-in forwards;
        }

        @keyframes show-cart-item {
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .paypal__cart-item {
            opacity: 0;
            transform: translateX(-30px);

            animation: show-cart-item 0.3s 2.75s ease-in forwards;
        }

        .paypal__cart-item:nth-child(2) {
            animation-delay: 2.9s;
        }

        .paypal__cart-item:nth-child(3) {
            animation-delay: 3.05s;
        }

        .paypal__cart-item:nth-child(4) {
            animation-delay: 3.2s;
        }

    </style>
    <body>
        <jsp:include page="include/Header.jsp"/>
        <section class="cid-r7074fmFzC">
            <div class="container">
                <div class="paypal">

                    <div class="paypal__header">
                        <div class="paypal__logo-wrapper">
                            <img src="assets/images/bbm-logo-122x122.png" alt="Paypal" class="paypal__logo">
                        </div>

                        <div class="paypal__header-info">
                            <span class="paypal__date">BBM - Condominium</span>
                        </div>
                    </div>

                    <div class="paypal__subheader-wrapper">
                        <div class="paypal__subheader">
                            <h1 class="paypal__username">${sessionScope.customer.name}  ${sessionScope.customer.surname}, Hi </h1>
                            <span class="paypal__help-text">You've purchased one (1) item from our store:</span>
                        </div>
                    </div>

                    <div class="paypal__cart">
                        <h2 class="paypal__cart-title">Cart:</h2>

                        <ul class="paypal__cart-list">
                            <li class="paypal__cart-item">
                                <span class="paypal__index">1</span>
                                <span class="paypal__item-name">$10 Balance</span>
                                <span class="paypal__item-price">$10.00</span>
                            </li>
                            <!--
                                      <li class="paypal__cart-item">
                                        <span class="paypal__index">2</span>
                                        <span class="paypal__item-name">Snickers Nike</span>
                                        <span class="paypal__item-price">$125.00</span>
                                      </li>
                            
                                      <li class="paypal__cart-item">
                                        <span class="paypal__index">3</span>
                                        <span class="paypal__item-name">All Stars</span>
                                        <span class="paypal__item-price">$95.00</span>
                                      </li>
                            -->
                            <li class="paypal__cart-item">
                                <span class="paypal__cart-total">Total</span>
                                <span class="paypal__item-price">$10.00</span>
                            </li>
                        </ul>
                    </div>

                    <div class="paypal__footer">
                        <center>
                            <button class="btn btn-primary btn-secondary">Check Out</button>
                        </center>
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
