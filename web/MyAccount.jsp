<%-- 
    Document   : MyAccount
    Created on : Oct 29, 2018, 4:02:20 PM
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
        <meta name="description" content="">
        <title>MyAccount</title>
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
            @import url("https://fonts.googleapis.com/css?family=Quicksand:400,500,700&subset=latin-ext");
            html {
                position: relative;
                overflow-x: hidden !important;
            }

            * {
                box-sizing: border-box;
            }

            body {
                font-family: 'Quicksand', sans-serif;
                color: #324e63;
            }

            a, a:hover {
                text-decoration: none;
            }

            .icon {
                display: inline-block;
                width: 1em;
                height: 1em;
                stroke-width: 0;
                stroke: currentColor;
                fill: currentColor;
            }

            .wrapper {
                width: 100%;
                width: 100%;
                height: auto;
                min-height: 100vh;
                padding: 50px 20px;
                padding-top: 100px;
                display: flex;
                background-image: linear-gradient(-20deg, #ff2846 0%, #6944ff 100%);
                display: flex;
                background-image: linear-gradient(-20deg, #ff2846 0%, #6944ff 100%);
            }
            @media screen and (max-width: 768px) {
                .wrapper {
                    height: auto;
                    min-height: 100vh;
                    padding-top: 100px;
                }
            }

            .profile-card {
                width: 100%;
                min-height: 460px;
                margin: auto;
                box-shadow: 0px 8px 60px -10px rgba(13, 28, 39, 0.6);
                background: #fff;
                border-radius: 12px;
                max-width: 700px;
                position: relative;
            }
            .profile-card.active .profile-card__cnt {
                filter: blur(6px);
            }
            .profile-card.active .profile-card-message,
            .profile-card.active .profile-card__overlay {
                opacity: 1;
                pointer-events: auto;
                transition-delay: .1s;
            }
            .profile-card.active .profile-card-form {
                transform: none;
                transition-delay: .1s;
            }
            .profile-card__img {
                width: 150px;
                height: 150px;
                margin-left: auto;
                margin-right: auto;
                transform: translateY(-50%);
                border-radius: 50%;
                overflow: hidden;
                position: relative;
                z-index: 4;
                box-shadow: 0px 5px 50px 0px #6c44fc, 0px 0px 0px 7px rgba(107, 74, 255, 0.5);
            }
            @media screen and (max-width: 576px) {
                .profile-card__img {
                    width: 120px;
                    height: 120px;
                }
            }
            .profile-card__img img {
                display: block;
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 50%;
            }
            .profile-card__cnt {
                margin-top: -35px;
                text-align: center;
                padding: 0 20px;
                padding-bottom: 40px;
                transition: all .3s;
            }
            .profile-card__name {
                font-weight: 700;
                font-size: 24px;
                color: #6944ff;
                margin-bottom: 15px;
            }
            .profile-card__txt {
                font-size: 18px;
                font-weight: 500;
                color: #324e63;
                margin-bottom: 15px;
            }
            .profile-card__txt strong {
                font-weight: 700;
            }
            .profile-card-loc {
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                font-weight: 600;
            }
            .profile-card-loc__icon {
                display: inline-flex;
                font-size: 27px;
                margin-right: 10px;
            }
            .profile-card-inf {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                align-items: flex-start;
                margin-top: 35px;
            }
            .profile-card-inf__item {
                padding: 10px 35px;
                min-width: 150px;
            }
            @media screen and (max-width: 768px) {
                .profile-card-inf__item {
                    padding: 10px 20px;
                    min-width: 120px;
                }
            }
            .profile-card-inf__title {
                font-weight: 700;
                font-size: 27px;
                color: #324e63;
            }
            .profile-card-inf__txt {
                font-weight: 500;
                margin-top: 7px;
            }
            .profile-card-social {
                margin-top: 25px;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
            }
            .profile-card-social__item {
                display: inline-flex;
                width: 55px;
                height: 55px;
                margin: 15px;
                border-radius: 50%;
                align-items: center;
                justify-content: center;
                color: #fff;
                background: #405de6;
                box-shadow: 0px 7px 30px rgba(43, 98, 169, 0.5);
                position: relative;
                font-size: 21px;
                flex-shrink: 0;
                transition: all .3s;
            }
            @media screen and (max-width: 768px) {
                .profile-card-social__item {
                    width: 50px;
                    height: 50px;
                    margin: 10px;
                }
            }
            @media screen and (min-width: 768px) {
                .profile-card-social__item:hover {
                    transform: scale(1.2);
                }
            }
            .profile-card-social__item.facebook {
                background: linear-gradient(45deg, #3b5998, #0078d7);
                box-shadow: 0px 4px 30px rgba(43, 98, 169, 0.5);
            }
            .profile-card-social__item.twitter {
                background: linear-gradient(45deg, #1da1f2, #0e71c8);
                box-shadow: 0px 4px 30px rgba(19, 127, 212, 0.7);
            }
            .profile-card-social__item.instagram {
                background: linear-gradient(45deg, #405de6, #5851db, #833ab4, #c13584, #e1306c, #fd1d1d);
                box-shadow: 0px 4px 30px rgba(120, 64, 190, 0.6);
            }
            .profile-card-social__item.behance {
                background: linear-gradient(45deg, #1769ff, #213fca);
                box-shadow: 0px 4px 30px rgba(27, 86, 231, 0.7);
            }
            .profile-card-social__item.github {
                background: linear-gradient(45deg, #333333, #626b73);
                box-shadow: 0px 4px 30px rgba(63, 65, 67, 0.6);
            }
            .profile-card-social__item.codepen {
                background: linear-gradient(45deg, #324e63, #414447);
                box-shadow: 0px 4px 30px rgba(55, 75, 90, 0.6);
            }
            .profile-card-social__item.link {
                background: linear-gradient(45deg, #d5135a, #f05924);
                box-shadow: 0px 4px 30px rgba(223, 45, 70, 0.6);
            }
            .profile-card-social .icon-font {
                display: inline-flex;
            }
            .profile-card-ctr {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 40px;
            }
            @media screen and (max-width: 576px) {
                .profile-card-ctr {
                    flex-wrap: wrap;
                }
            }
            .profile-card__button {
                background: none;
                border: none;
                font-family: 'Quicksand', sans-serif;
                font-weight: 700;
                font-size: 19px;
                margin: 15px 35px;
                padding: 15px 40px;
                min-width: 201px;
                border-radius: 50px;
                min-height: 55px;
                color: #fff;
                cursor: pointer;
                backface-visibility: hidden;
                transition: all .3s;
            }
            @media screen and (max-width: 768px) {
                .profile-card__button {
                    min-width: 170px;
                    margin: 15px 25px;
                }
            }
            @media screen and (max-width: 576px) {
                .profile-card__button {
                    min-width: inherit;
                    margin: 0;
                    margin-bottom: 16px;
                    width: 100%;
                    max-width: 300px;
                }
                .profile-card__button:last-child {
                    margin-bottom: 0;
                }
            }
            .profile-card__button:focus {
                outline: none !important;
            }
            @media screen and (min-width: 768px) {
                .profile-card__button:hover {
                    transform: translateY(-5px);
                }
            }
            .profile-card__button:first-child {
                margin-left: 0;
            }
            .profile-card__button:last-child {
                margin-right: 0;
            }
            .profile-card__button.button--blue {
                background: linear-gradient(45deg, #1da1f2, #0e71c8);
                box-shadow: 0px 4px 30px rgba(19, 127, 212, 0.4);
            }
            .profile-card__button.button--blue:hover {
                box-shadow: 0px 7px 30px rgba(19, 127, 212, 0.75);
            }
            .profile-card__button.button--orange {
                background: linear-gradient(45deg, #d5135a, #f05924);
                box-shadow: 0px 4px 30px rgba(223, 45, 70, 0.35);
            }
            .profile-card__button.button--orange:hover {
                box-shadow: 0px 7px 30px rgba(223, 45, 70, 0.75);
            }
            .profile-card__button.button--gray {
                box-shadow: none;
                background: #dcdcdc;
                color: #142029;
            }
            .profile-card-message {
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                padding-top: 130px;
                padding-bottom: 100px;
                opacity: 0;
                pointer-events: none;
                transition: all .3s;
            }
            .profile-card-form {
                box-shadow: 0 4px 30px rgba(15, 22, 56, 0.35);
                max-width: 80%;
                margin-left: auto;
                margin-right: auto;
                height: 100%;
                background: #fff;
                border-radius: 10px;
                padding: 35px;
                transform: scale(0.8);
                position: relative;
                z-index: 3;
                transition: all .3s;
            }
            @media screen and (max-width: 768px) {
                .profile-card-form {
                    max-width: 90%;
                    height: auto;
                }
            }
            @media screen and (max-width: 576px) {
                .profile-card-form {
                    padding: 20px;
                }
            }
            .profile-card-form__bottom {
                justify-content: space-between;
                display: flex;
            }
            @media screen and (max-width: 576px) {
                .profile-card-form__bottom {
                    flex-wrap: wrap;
                }
            }
            .profile-card textarea {
                width: 100%;
                resize: none;
                height: 210px;
                margin-bottom: 20px;
                border: 2px solid #dcdcdc;
                border-radius: 10px;
                padding: 15px 20px;
                color: #324e63;
                font-weight: 500;
                font-family: 'Quicksand', sans-serif;
                outline: none;
                transition: all .3s;
            }
            .profile-card textarea:focus {
                outline: none;
                border-color: #8a979e;
            }
            .profile-card__overlay {
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                pointer-events: none;
                opacity: 0;
                background: rgba(22, 33, 72, 0.35);
                border-radius: 12px;
                transition: all .3s;
            }
        </style>

    </head>
    <body>
        <jsp:include page="include/Header.jsp"/>

        <section class="header11 cid-r7MmAIxkys" id="header11-1a">

            <!-- Block parameters controls (Blue "Gear" panel) -->

            <!-- End block parameters -->


            <div class="container align-left">
                <div class="media-container-column mbr-white col-md-12">

                    <h1 class="mbr-section-title py-3 mbr-fonts-style display-1"><strong>My Account</strong></h1>


                </div>
            </div>


        </section>
        <div class="wrapper">


            <div class="profile-card js-profile-card">
                <div class="profile-card__img">
                    <img src="${img}" alt="profile card">
                </div>

                <div class="profile-card__cnt js-profile-cnt">
                    <div class="profile-card__name">${name}name  surname${surname}</div>
                    <div class="profile-card__txt">IDCARD${idcard}</div>
                    <div class="profile-card-loc">
                        <div class="col-2">
                            Email: 
                        </div> 
                        <div class="col-10">
                            <input type="text" class="form-control" value="${email}"><br>
                        </div> 
                    </div>
                    <div class="profile-card-loc">
                        <div class="col-2">
                            Phone:  
                        </div> 
                        <div class="col-10">
                            <input type="text" class="form-control" value="${phone}"><br>
                        </div> 
                    </div>
                    <div class="profile-card-loc">
                        <div class="col-2">
                            Address:  
                        </div> 
                        <div class="col-10">
                            <textarea type="text" class="form-control" name="address" rows="4">${address}</textarea>
                        </div> 
                    </div>

                    <div class="profile-card-ctr">
                        <button class="profile-card__button button--blue">Edit Profile</button>
                        <button class="profile-card__button button--orange js-message-btn">Delete Profile</button>
                    </div>
                </div>

                <div class="profile-card-message js-message">
                    <form class="profile-card-form">
                        <div class="profile-card-form__container">
                            ต้องการลบบัญชี ?
                        </div>

                        <div class="profile-card-form__bottom">
                            <button class="profile-card__button button--blue js-message-close">
                                Delete
                            </button>

                            <button class="profile-card__button button--gray js-message-close">
                                Cancel
                            </button>
                        </div>
                    </form>

                    <div class="profile-card__overlay js-message-close"></div>
                </div>

            </div>

        </div>





        <jsp:include page="include/Footer.jsp"/>

        <script src="assets/web/assets/jquery/jquery.min.js"></script>
        <script src="assets/popper/popper.min.js"></script>
        <script src="assets/tether/tether.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/smoothscroll/smooth-scroll.js"></script>
        <script src="assets/dropdown/js/script.min.js"></script>
        <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
        <script src="assets/theme/js/script.js"></script>
        <script src="assets/formoid/formoid.min.js"></script>
        <script>
            var messageBox = document.querySelector('.js-message');
            var btn = document.querySelector('.js-message-btn');
            var card = document.querySelector('.js-profile-card');
            var closeBtn = document.querySelectorAll('.js-message-close');

            btn.addEventListener('click', function (e) {
                e.preventDefault();
                card.classList.add('active');
            });

            closeBtn.forEach(function (element, index) {
                console.log(element);
                element.addEventListener('click', function (e) {
                    e.preventDefault();
                    card.classList.remove('active');
                });
            });
        </script>
    </body>
</html>
