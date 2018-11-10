<%-- 
    Document   : Room
    Created on : Oct 29, 2018, 4:15:28 PM
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
        <meta name="description" content="Room detail">
        <title>Search</title>
        <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/socicon/css/styles.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
        <link rel="stylesheet" href="assets/mobirise/css/Search.css" type="text/css">
    </head>
    <style>
        input[type='number'] {
            -moz-appearance:textfield;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
        }
    </style>
    <body>
        <jsp:include page="include/Header.jsp"/>
        <section class="cid-r7074fmFzB">
            <div class=container>
                <div class="row">
                    <div class="col-md-12">
                        <div class="body">
                            
                            <h1>Search..</h1><br><br><br>
                            <form action="Search">
                            <div class="col-12 col-md-12">
                                Room Number  : &nbsp;&nbsp;
                                <div id="search-wrapper">
                                    <input type="number" name="roomNumber" id="search" placeholder="Search something..." />
                                    <div id="close-icon"></div>
                                </div>
                            </div><br>
                            <div class="col-12 col-md-12">
                                Room Number  : &nbsp;&nbsp;
                                <div id="search-wrapper">
                                    <input type="number" name="roomNumber" id="search" placeholder="Search something..." />
                                    <div id="close-icon"></div>
                                </div>
                            </div><br>
                            <div class="col-12 col-md-12">
                                Room Number  : &nbsp;&nbsp;
                                <div id="search-wrapper">
                                    <input type="number" name="roomNumber" id="search" placeholder="Search something..." />
                                    <div id="close-icon"></div>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
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
        <script src="assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
        <script src="assets/parallax/jarallax.min.js"></script>
        <script src="assets/sociallikes/social-likes.js"></script>
        <script src="assets/theme/js/script.js"></script>
        <script src="assets/formoid/formoid.min.js"></script>
    </body>
    <script>
        'use strict';

        var search = document.getElementById('search'),
                searchWrapper = document.getElementById('search-wrapper'),
                closeIcon = document.getElementById('close-icon');

// Input focus
        search.onfocus = function () {
            searchWrapper.classList.add('search-expanded');
            this.addEventListener('transitionend', function () {
                closeIcon.style.display = 'block';
            });
        }

// Input blur
        search.onblur = function () {

            searchWrapper.classList.remove('search-expanded');
            closeIcon.classList.add('closing');

            this.addEventListener('transitionend', function () {
                closeIcon.classList.remove('closing');
                closeIcon.style.display = 'none';
            });

        }


    </script>
</html>
