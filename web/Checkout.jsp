<%-- 
    Document   : Checkout
    Created on : 17-Nov-2018, 22:18:36
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
        <link rel="shortcut icon" href="assets/images/bbm-logo-122x122.png" type="image/x-icon">
        <title>Checkout</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    </head>
    <style>
        @import "https://fonts.googleapis.com/css?family=Fira+Sans";
        :root {
            font-size: 62.5%;
        }

        .form-search .input-append .btn {
            -webkit-border-radius: 0 14px 14px 0;
            -moz-border-radius: 0 14px 14px 0;
            /* border-radius: 0 14px 14px 0; */
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            width: 100%;
            font-family: 'Fira Sans', sans-serif;
        }

        body {
            background: linear-gradient(to bottom right, #9575CD, #311B92);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .wrapper {
            width: 90%;
            max-width: 700px;
            height: 300px;
            background-color: rgba(255, 255, 255, 0.8);
            display: flex;
            position: relative;
            border-radius: 0.5rem;
            overflow: hidden;
        }

        .qr {
            position: relative;
            z-index: 1;
            width: 30%;
            height: 100%;
            background-color: #222;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: all 600ms ease-in-out;
            border-radius: 0.5rem 0 0 0.5rem;
        }
        .qr.expand {
            width: 100%;
        }
        .qr a {
            text-decoration: none;
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.8rem;
            padding: 1rem 0;
            text-transform: uppercase;
            text-decoration: underline;
        }
        .qr .title {
            font-size: 1.6rem;
            width: 50%;
            text-transform: uppercase;
            color: rgba(255, 255, 255, 0.8);
            padding-bottom: 1rem;
        }
        .qr .qr-wrapper {
            height: 38%;
            width: 50%;
            background-color: white;
            padding: 0.5rem;
            transition: all 600ms ease-in-out;
        }
        .qr .qr-wrapper .qr-image {
            height: 100%;
            width: 100%;
            background-image: url(http://covernomics.org/main/images/qrcodes/accessrestricted-qr.png);
            background-size: contain;
            background-repeat: no-repeat;
        }

        .inner-wrapper {
            position: absolute;
            z-index: 0;
            top: 0%;
            right: 0;
            height: 200%;
            width: 70%;
            transition: all 600ms ease-in-out;
        }
        .inner-wrapper.boarding-pass {
            top: 0%;
        }
        .inner-wrapper.boarding-pass .seat-layout .layout .grid .business .row .col1, .inner-wrapper.boarding-pass .seat-layout .layout .grid .business .row .col2, .inner-wrapper.boarding-pass .seat-layout .layout .grid .eco .row .col1, .inner-wrapper.boarding-pass .seat-layout .layout .grid .eco .row .col2 {
            opacity: 1;
        }
        .inner-wrapper.seat-details {
            top: -100%;
        }
        .seat-layout {
            position: absolute;
            width: 100%;
            height: 50%;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 0.5rem;
            top: 50%;
            z-index: 0;
            right: 0;
        }
        .seat-layout .content {
            width: 100%;
            height: 25%;
            background-color: rgba(204, 204, 204, 0.5);
            display: flex;
            border-radius: 0.5rem;
            position: relative;
            color: rgba(0, 0, 0, 0.7);
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
            justify-content: space-between;
            align-items: center;
            font-weight: 600;
        }
        .seat-layout .content span {
            display: block;
            font-size: 1rem;
            text-transform: uppercase;
            padding-top: 0.8rem;
            color: rgba(0, 0, 0, 0.5);
            font-weight: 500;
        }
        .seat-layout .content .close {
            width: 15rem;
            height: 3rem;
            cursor: pointer;
            position: relative;
            padding: 0 1rem;
        }
        .seat-layout .content .close i {
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
        .seat-layout .content .gate, .seat-layout .content .departure, .seat-layout .content .seat, .seat-layout .content .boarding, .seat-layout .content .flight {
            width: 100%;
            font-size: 1.5rem;
            text-align: center;
            padding: 1rem 0;
        }
        .seat-layout .content .gate, .seat-layout .content .seat {
            width: 30rem;
        }
        .seat-layout .layout {
            position: relative;
            width: 100%;
            height: 60%;
        }
        .seat-layout .layout .grid {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: space-between;
            padding: 2rem 0;
        }
        .seat-layout .layout .grid .front-lav, .seat-layout .layout .grid .rear-lav {
            width: 5%;
            height: 100%;
            position: relative;
        }
        .seat-layout .layout .grid .front-lav:before, .seat-layout .layout .grid .front-lav:after, .seat-layout .layout .grid .rear-lav:before, .seat-layout .layout .grid .rear-lav:after {
            content: '';
            display: block;
            position: absolute;
            background-color: #4FC3F7;
            height: 40%;
            width: 1.2rem;
            right: 0;
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
        }
        .seat-layout .layout .grid .front-lav:before, .seat-layout .layout .grid .rear-lav:before {
            top: 0;
        }
        .seat-layout .layout .grid .front-lav:after, .seat-layout .layout .grid .rear-lav:after {
            bottom: 0;
        }
        .seat-layout .layout .grid .business {
            width: 7%;
            height: 100%;
            display: flex;
        }
        .seat-layout .layout .grid .business .seat {
            width: 1.4rem;
            height: 1.1rem;
            background-color: #5E35B1;
            margin: 0.4rem 0;
        }
        .seat-layout .layout .grid .business .row {
            width: 50%;
            height: 100%;
            position: relative;
        }
        .seat-layout .layout .grid .business .row0 .col {
            width: 100%;
            height: 50%;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .seat-layout .layout .grid .business .row0 .col1, .seat-layout .layout .grid .business .row0 .col2 {
            opacity: 0;
        }
        .seat-layout .layout .grid .eco {
            width: 83%;
            height: 100%;
            display: flex;
        }
        .seat-layout .layout .grid .eco .seat {
            width: 1.6rem;
            height: 1.1rem;
            background-color: rgba(0, 0, 0, 0.7);
            margin: 0.2rem 0.2rem;
        }
        .seat-layout .layout .grid .eco .your {
            background-color: #66BB6A;
        }
        .seat-layout .layout .grid .eco .rowname {
            width: 65%;
            height: 16%;
            margin: 0.2rem 0;
            text-align: right;
        }
        .seat-layout .layout .grid .eco .row {
            width: 5%;
            height: 100%;
            position: relative;
        }
        .seat-layout .layout .grid .eco .row .col {
            width: 100%;
            height: 50%;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .seat-layout .layout .grid .eco .row .col1, .seat-layout .layout .grid .eco .row .col2 {
            opacity: 0;
        }
        .seat-layout .layout .grid .rear-lav:before, .seat-layout .layout .grid .rear-lav:after {
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
        }
        .seat-layout .legends {
            width: 100%;
            height: 15%;
            position: relative;
        }
        .seat-layout .legends .legend-wrapper {
            padding: 0 1rem;
            width: 70%;
            height: 100%;
            position: absolute;
            right: 0;
            display: flex;
            justify-content: space-between;
        }
        .seat-layout .legends .legend-wrapper div {
            text-transform: capitalize;
            width: 25%;
            display: flex;
        }
        .seat-layout .legends .legend-wrapper span {
            display: inline-block;
            width: calc(100% - 1.5rem);
            height: 1.5rem;
            line-height: 1.5rem;
            padding: 0 0.5rem;
        }
        .seat-layout .legends .legend-wrapper .legend {
            display: inline-block;
            width: 1.5rem;
            height: 1.5rem;
        }
        .seat-layout .legends .legend-wrapper .business {
            background-color: #5E35B1;
        }
        .seat-layout .legends .legend-wrapper .lavatory {
            background-color: #4FC3F7;
        }
        .seat-layout .legends .legend-wrapper .economy {
            background-color: rgba(0, 0, 0, 0.7);
        }
        .seat-layout .legends .legend-wrapper .your {
            background-color: #66BB6A;
        }

        .details {
            position: absolute;
            z-index: 0;
            top: 0;
            right: 0;
            height: 50%;
            width: 100%;
            font-family: 'Fira Sans', sans-serif;
        }
        .details .plane {
            position: absolute;
            width: 2.5rem;
            height: 2.5rem;
            background-position: center center;
            background-size: contain;
            top: 4.2rem;
            left: 42%;
            -webkit-animation: plane 5000ms ease-in-out infinite;
            animation: plane 5000ms ease-in-out infinite;
            background-image: url('https://cdn1.iconfinder.com/data/icons/money-4/512/credit_card_lock-512.png');
        }
        .details .date {
            position: absolute;
            font-size: 1.2rem;
            top: 0;
            right: 0;
            padding: 1rem;
            color: rgba(0, 0, 0, 0.5);
        }
        .details .city {
            position: relative;
            top: 2.5rem;
            width: 80%;
            height: 70%;
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
            display: flex;
            justify-content: space-between;
        }
        .details .city .loc {
            width: 50%;
            height: 100%;
            display: flex;
            flex-direction: column;
            padding: 1rem;
        }
        .details .city .loc .name {
            font-size: 4.5rem;
            color: rgba(0, 0, 0, 0.7);
            text-align: center;
            text-transform: uppercase;
            padding-bottom: 0.5rem;
        }
        .details .city .loc .name span {
            font-size: 1.2rem;
            display: block;
            padding: 1rem 0 0 0;
        }
        .details .city .loc .weather {
            height: 50%;
            width: 100%;
            background-color: transparent;
        }
        .details .city .loc .weather .icon {
            height: 100%;
            width: 100%;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            position: relative;
        }
        .details .city .from {
            padding-right: 3rem;
        }
        .details .city .from .weather .icon {
            background-image: url(data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0NDcuOTc0IDQ0Ny45NzQiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQ0Ny45NzQgNDQ3Ljk3NDsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTJweCIgaGVpZ2h0PSI1MTJweCI+CjxnPgoJPHBhdGggc3R5bGU9ImZpbGw6IzFFQTZDNjsiIGQ9Ik02Mi41MTMsMTkxLjI2NGMtMC4wMDktMC41MjUtMC4wMi0xLjA0OS0wLjAyLTEuNTc1YzAtNTAuMTU1LDQwLjY1OS05MC44MTQsOTAuODE0LTkwLjgxNCAgIGM0My4yMjIsMCw3OS4zODgsMzAuMTk2LDg4LjU2Miw3MC42NDNjOC41NTUtNC43ODksMTguNDA5LTcuNTMxLDI4LjkxLTcuNTMxYzMyLjc2NiwwLDU5LjMyOCwyNi41NjIsNTkuMzI4LDU5LjMyOCAgIGMwLDEuMzM5LTAuMDYsMi42NjQtMC4xNDgsMy45ODFjMjQuMzI1LDkuMDMsNDEuNjYxLDMyLjQ0NCw0MS42NjEsNTkuOTExYzAsMzUuMjg2LTI4LjYwNSw2My44OTItNjMuODkyLDYzLjg5Mkg3OS44NjUgICBDMzUuNzU3LDM0OS4wOTksMCwzMTMuMzQxLDAsMjY5LjIzNEMwLDIzMS4wODUsMjYuNzQ5LDE5OS4xODgsNjIuNTEzLDE5MS4yNjR6Ii8+Cgk8cGF0aCBzdHlsZT0iZmlsbDojMDM3ODkzOyIgZD0iTTQ0Ny45NzQsMjU1LjUzNWMwLDQwLjU2LTMyLjg4LDczLjQ0LTczLjQ0LDczLjQ0aC0zLjYyYzguNjQtMTIuNDMsMTMuNzEtMjcuNTIsMTMuNzEtNDMuNzcgICBjMC0yOC44Ny0xNi40MS01NS4yOC00MS42NS02OC4zNGMtMi4zMS0zNy44Mi0zMy44MS02Ny44OC03Mi4xOS02Ny44OGMtNy4wNCwwLTE0LjAzLDEuMDQtMjAuNzMsMy4wNCAgIGMtMi42Ny02LjgyLTYuMDUtMTMuMzUtMTAuMDgtMTkuNDZjMTUuMjItMjAuNDQsMzkuNTctMzMuNjksNjcuMDItMzMuNjljNDYuMTIsMCw4My41MSwzNy4zOSw4My41MSw4My41MSAgIGMwLDAuNDktMC4wMSwwLjk3LTAuMDIsMS40NUM0MjMuMzc0LDE5MS4xMjQsNDQ3Ljk3NCwyMjAuNDU0LDQ0Ny45NzQsMjU1LjUzNXoiLz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K);
        }
        .details .city .from .weather .icon .drop {
            position: absolute;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center center;
            background-image: url(data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCAzNDUuMTMgMzQ1LjEzIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAzNDUuMTMgMzQ1LjEzOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4Ij4KPGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojNzZDRENFOyIgZD0iTTI2NC4yNSwzMDEuN2MtMi40NSwzLjAxLTUuMDgsNS45MS03Ljg4LDguNzFjLTIzLjE0LDIzLjE0LTUzLjQ3LDM0LjcyLTgzLjgsMzQuNzIgICBzLTYwLjY2LTExLjU4LTgzLjgxLTM0LjcyYy0yMi44Ni0yMi44Ni0zNC43MS01My4yLTM0LjcxLTgzLjg0YzAtMjEuMzEsNS43NC00Mi43NywxNy41LTYxLjk0bDIxLjE2LTM0LjQ4TDE3Mi41NywwbDMxLjY3LDUxLjYyICAgbDI0LjI4LDM5LjU2bDQ1LjA2LDczLjQ1QzMwMC4xOCwyMDcuOTksMjk1Ljk3MSwyNjMuMDMsMjY0LjI1LDMwMS43eiIvPgoJPHBhdGggc3R5bGU9ImZpbGw6Izk2RTBERTsiIGQ9Ik0yNjQuMjUsMzAxLjdMOTIuNzEsMTMwLjE1TDE3Mi41NywwbDMxLjY3LDUxLjYybDI0LjI4LDM5LjU2bDQ1LjA2LDczLjQ1ICAgQzMwMC4xOCwyMDcuOTksMjk1Ljk3MSwyNjMuMDMsMjY0LjI1LDMwMS43eiIvPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=);
        }
        .details .city .from .weather .icon .drop1 {
            width: 12%;
            height: 12%;
            top: 50%;
            left: 38%;
            -webkit-animation: rain1 1000ms ease-in-out infinite;
            animation: rain1 1000ms ease-in-out infinite;
        }
        .details .city .from .weather .icon .drop2 {
            width: 25%;
            height: 25%;
            top: 70%;
            left: 47%;
            -webkit-animation: rain2 1100ms ease-in-out infinite;
            animation: rain2 1100ms ease-in-out infinite;
        }
        .details .city .from .weather .icon .drop3 {
            width: 18%;
            height: 18%;
            top: 65%;
            left: 25%;
            -webkit-animation: rain3 1200ms ease-in-out infinite;
            animation: rain3 1200ms ease-in-out infinite;
        }
        .details .city .to {
            padding-left: 3rem;
        }
        .details .city .to .weather .icon {
            position: relative;
            background-image: url(data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDYwLjAwMyA2MC4wMDMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDYwLjAwMyA2MC4wMDM7IiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iNTEycHgiIGhlaWdodD0iNTEycHgiPgo8cGF0aCBzdHlsZT0iZmlsbDojRjBDNDE5OyIgZD0iTTM2LjExNiwxMy4yMjhsLTAuOTU4LTEuNTg4Yy0zLjA3NC01LjA5Ni04LjQ0Ny04LjEzOS0xNC4zNzMtOC4xMzkgIGMtOS4yNiwwLTE2Ljc5Myw3LjUzMy0xNi43OTMsMTYuNzkzYzAsNS4yODQsMi41NDcsMTAuMzI0LDYuODE1LDEzLjQ4MWwwLjY1MSwwLjQ4MWwwLjgwNSwwLjA4OSAgYzAuNTI5LDAuMDU4LDEuMDMzLDAuMTYzLDEuNDk3LDAuMzEzbDQuOTcsMS41OTdsLTEuMTIzLTUuMDk4Yy0wLjI2Ny0xLjIxNCwwLjAyOS0yLjQ1NCwwLjgxMy0zLjQwNiAgYzAuNzYzLTAuOTI2LDEuODg5LTEuNDU3LDMuMDkxLTEuNDU3YzAuNDEyLDAsMC44MTgsMC4wNjMsMS4xNzcsMC4xNzdsMi42OSwwLjg5N2wxLjA0Ny0yLjYzNmMwLjQ4NS0xLjIyLDEuNTMyLTIuMTI3LDIuNzk5LTIuNDI1ICBjMC40NS0wLjEwNSwwLjkzMy0wLjEyOCwxLjM5Ni0wLjA3MWwzLjUsMC40MjJsLTAuMTQ0LTMuNTIzbC0wLjAyMS0wLjM0MWMwLTEuNDExLDAuNDAzLTIuNzk1LDEuMTY3LTMuOTk5TDM2LjExNiwxMy4yMjh6Ii8+CjxwYXRoIHN0eWxlPSJmaWxsOiNEMEU4Rjk7IiBkPSJNNTkuOTc5LDI1LjUwMmgtMC4wODFjMC4wMzUsMC4zMDQsMC4wNTksMC42MTEsMC4wNTksMC45MjVjMCwwLjU1My0wLjQ0NywxLTEsMXMtMS0wLjQ0Ny0xLTEgIGMwLTMuMzA5LTIuNjkxLTYtNi02cy02LDIuNjkxLTYsNmMwLDAuNTUzLTAuNDQ3LDEtMSwxcy0xLTAuNDQ3LTEtMWMwLTQuMDY0LDMuMDQ5LTcuNDIzLDYuOTc4LTcuOTI3ICBjLTAuMjI2LTUuMDM5LTQuMzg0LTkuMDczLTkuNDc4LTkuMDczYy01LjExMSwwLTkuMjgxLDQuMDYtOS40ODEsOS4xMjNjMC44MjksMC4xOTYsMS42MzIsMC41MiwyLjM3OCwwLjk4MSAgYzEuODE2LDEuMTI1LDMuMDg2LDIuODksMy41NzYsNC45N2MwLjEyNiwwLjUzOC0wLjIwNywxLjA3Ni0wLjc0NCwxLjIwM2MtMC41MzgsMC4xMjEtMS4wNzYtMC4yMDctMS4yMDMtMC43NDQgIGMtMC43NTgtMy4yMjItMy45OTktNS4yMjYtNy4yMTQtNC40NjdjLTMuMjIxLDAuNzU4LTUuMjI1LDMuOTk0LTQuNDY3LDcuMjE1YzAuMTI2LDAuNTM3LTAuMjA3LDEuMDc1LTAuNzQ1LDEuMjAyICBjLTAuMDc2LDAuMDE4LTAuMTUzLDAuMDI2LTAuMjI5LDAuMDI2Yy0wLjQ1MywwLTAuODY0LTAuMzExLTAuOTczLTAuNzcxYy0wLjI5NC0xLjI1MS0wLjI2OC0yLjUwMiwwLjAxMi0zLjY3NCAgYy0yLjA1OC0wLjMwMS00LjEzNywwLjQ3Ni01LjQ5MywyLjEyMmMtMS4yNTgsMS41MjktMS42MjUsMy40OTgtMS4xNzUsNS4yODVjMC4wMDEsMC4wMTIsMC4wMDcsMC4wMjIsMC4wMDgsMC4wMzQgIGMwLjMwNiwxLjE4NiwwLjk3LDIuMjksMS45ODUsMy4xMjdjMC40MjYsMC4zNTIsMC40ODcsMC45ODEsMC4xMzcsMS40MDhjLTAuMTk4LDAuMjQtMC40ODQsMC4zNjQtMC43NzMsMC4zNjQgIGMtMC4yMjQsMC0wLjQ0OC0wLjA3NC0wLjYzNS0wLjIyOGMtMS4yMTctMS4wMDItMi4wODgtMi4zMTEtMi41NDYtMy43ODFjLTQuMDQzLTEuMDU0LTguMjk0LDAuNjQ3LTEwLjQ5LDQuMjYyICBjLTEuMzE3LDIuMTY4LTEuNzEyLDQuNzItMS4xMSw3LjE4NWMwLjYwMiwyLjQ2NiwyLjEyNyw0LjU0OSw0LjI5Niw1Ljg2N2MwLjQ3MiwwLjI4NywwLjYyMiwwLjkwMSwwLjMzNSwxLjM3NCAgYy0wLjE4OCwwLjMxLTAuNTE4LDAuNDgtMC44NTUsMC40OGMtMC4xMzMsMC0wLjI2NS0wLjAzNi0wLjM5Mi0wLjA5MWMxLjU4LDAuOTM2LDMuMzk5LDEuNTA5LDUuMzQ0LDEuNTkzbDguMjA5LDAuMDAzICBjNS4zMDctMC4wODUsOS44NTMtMy4zNiwxMS43OTEtNy45OTJjMS45NjMsNC42OTMsNi42MDMsOCwxMiw4YzkuMzc0LDAsMTctNy42MjYsMTctMTd2LTEwTDU5Ljk3OSwyNS41MDJ6Ii8+CjxnPgoJPHBhdGggc3R5bGU9ImZpbGw6I0FCQ0FERDsiIGQ9Ik01Mi45MzYsMTguNTY4Yy0wLjIzMS02LjEzOS01LjI4NC0xMS4wNjYtMTEuNDc4LTExLjA2NmMtNi4xNDIsMC0xMS4xNiw0Ljg0NC0xMS40NywxMC45MSAgIGMtMC41NTgsMC4wMTItMS4xMTksMC4wNzgtMS42NzYsMC4yMDljLTIuMzM2LDAuNTUtNC4xODUsMi4wODItNS4yMjksNC4wNTJjLTIuODgyLTAuNTg1LTUuODQ4LDAuNDMzLTcuNzUsMi43NDIgICBjLTEuMjUxLDEuNTItMS44NzksMy40MDgtMS44MSw1LjM1OWMtNC42My0wLjgzNC05LjM0LDEuMjI0LTExLjg0NCw1LjM0NGMtMS41OTYsMi42MjUtMi4wNzMsNS43MTQtMS4zNDUsOC42OTggICBzMi41NzUsNS41MDYsNS4yLDcuMTAyYzAuMTYyLDAuMDk5LDAuMzQyLDAuMTQ2LDAuNTE5LDAuMTQ2YzAuMzM4LDAsMC42NjctMC4xNzEsMC44NTUtMC40OGMwLjI4Ny0wLjQ3MywwLjEzNy0xLjA4Ny0wLjMzNS0xLjM3NCAgIGMtMi4xNjktMS4zMTgtMy42OTQtMy40MDEtNC4yOTYtNS44NjdjLTAuNjAyLTIuNDY1LTAuMjA3LTUuMDE3LDEuMTEtNy4xODVjMi4xOTYtMy42MTQsNi40NDctNS4zMTUsMTAuNDktNC4yNjIgICBjMC40NTgsMS40NzEsMS4zMywyLjc3OSwyLjU0NiwzLjc4MWMwLjE4NywwLjE1MywwLjQxMSwwLjIyOCwwLjYzNSwwLjIyOGMwLjI4OSwwLDAuNTc1LTAuMTI0LDAuNzczLTAuMzY0ICAgYzAuMzUxLTAuNDI3LDAuMjg5LTEuMDU3LTAuMTM3LTEuNDA4Yy0xLjAxNi0wLjgzNi0xLjY3OS0xLjk0MS0xLjk4NS0zLjEyN2MtMC4wMDEtMC4wMTItMC4wMDctMC4wMjItMC4wMDgtMC4wMzQgICBjLTAuNDUtMS43ODctMC4wODMtMy43NTYsMS4xNzUtNS4yODVjMS4zNTYtMS42NDYsMy40MzUtMi40MjMsNS40OTMtMi4xMjJjLTAuMjgsMS4xNzMtMC4zMDcsMi40MjMtMC4wMTIsMy42NzQgICBjMC4xMDgsMC40NjEsMC41MiwwLjc3MSwwLjk3MywwLjc3MWMwLjA3NiwwLDAuMTUzLTAuMDA5LDAuMjI5LTAuMDI2YzAuNTM4LTAuMTI3LDAuODcxLTAuNjY1LDAuNzQ1LTEuMjAyICAgYy0wLjc1OC0zLjIyMSwxLjI0Ni02LjQ1Nyw0LjQ2Ny03LjIxNWMzLjIxNS0wLjc1OSw2LjQ1NiwxLjI0NSw3LjIxNCw0LjQ2N2MwLjEyNywwLjUzNywwLjY2NSwwLjg2NSwxLjIwMywwLjc0NCAgIGMwLjUzNy0wLjEyNywwLjg3LTAuNjY1LDAuNzQ0LTEuMjAzYy0wLjQ5LTIuMDgtMS43Ni0zLjg0NS0zLjU3Ni00Ljk3Yy0wLjc0Ni0wLjQ2Mi0xLjU0OS0wLjc4NS0yLjM3OC0wLjk4MSAgIGMwLjItNS4wNjMsNC4zNy05LjEyMyw5LjQ4MS05LjEyM2M1LjA5NCwwLDkuMjUzLDQuMDMzLDkuNDc4LDkuMDczYy0zLjkyOSwwLjUwNC02Ljk3OCwzLjg2My02Ljk3OCw3LjkyN2MwLDAuNTUzLDAuNDQ3LDEsMSwxICAgczEtMC40NDcsMS0xYzAtMy4zMDksMi42OTEtNiw2LTZzNi4wNDYsMi42OTEsNi4wNDYsNmMwLDAuMDI4LDAsMS4zMjcsMCwzYzAsMC41NTIsMC40NDgsMSwxLDFzMS0wLjQ0OCwxLTF2LTMgICBDNjAuMDAzLDIyLjQyMiw1Ni44ODYsMTkuMDUyLDUyLjkzNiwxOC41Njh6Ii8+Cgk8cGF0aCBzdHlsZT0iZmlsbDojQUJDQUREOyIgZD0iTTQ4LjAwMywzOS41MDJjMC41NTIsMCwxLTAuNDQ4LDEtMWMwLTEuNDQyLDAtMC41LDAtMC41YzAtMi40ODEsMi4wMTktNC41LDQuNS00LjUgICBzNC41LDIuMDE5LDQuNSw0LjVjMCwwLjU1MywwLjQ0OCwxLDEsMXMxLTAuNDQ3LDEtMWMwLTMuNTg0LTIuOTE2LTYuNS02LjUtNi41Yy0zLjQxNSwwLTYuMjQzLDIuNjQ5LTYuNSw2djEgICBDNDcuMDAzLDM5LjA1NCw0Ny40NTEsMzkuNTAyLDQ4LjAwMywzOS41MDJ6Ii8+CjwvZz4KPGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojQUJDNUQzOyIgZD0iTTI5LjI5Niw0NS43OTVsLTMsM2MtMC4zOTEsMC4zOTEtMC4zOTEsMS4wMjMsMCwxLjQxNGMwLjE5NSwwLjE5NSwwLjQ1MSwwLjI5MywwLjcwNywwLjI5MyAgIHMwLjUxMi0wLjA5OCwwLjcwNy0wLjI5M2wzLTNjMC4zOTEtMC4zOTEsMC4zOTEtMS4wMjMsMC0xLjQxNFMyOS42ODcsNDUuNDA0LDI5LjI5Niw0NS43OTV6Ii8+Cgk8cGF0aCBzdHlsZT0iZmlsbDojQUJDNUQzOyIgZD0iTTIzLjI5Niw1MS43OTVsLTMsM2MtMC4zOTEsMC4zOTEtMC4zOTEsMS4wMjMsMCwxLjQxNGMwLjE5NSwwLjE5NSwwLjQ1MSwwLjI5MywwLjcwNywwLjI5MyAgIHMwLjUxMi0wLjA5OCwwLjcwNy0wLjI5M2wzLTNjMC4zOTEtMC4zOTEsMC4zOTEtMS4wMjMsMC0xLjQxNFMyMy42ODcsNTEuNDA0LDIzLjI5Niw1MS43OTV6Ii8+Cgk8cGF0aCBzdHlsZT0iZmlsbDojQUJDNUQzOyIgZD0iTTQ0LjcxLDM5Ljc5NWMtMC4zOTEtMC4zOTEtMS4wMjMtMC4zOTEtMS40MTQsMGwtMywzYy0wLjM5MSwwLjM5MS0wLjM5MSwxLjAyMywwLDEuNDE0ICAgYzAuMTk1LDAuMTk1LDAuNDUxLDAuMjkzLDAuNzA3LDAuMjkzczAuNTEyLTAuMDk4LDAuNzA3LTAuMjkzbDMtM0M0NS4xMDEsNDAuODE4LDQ1LjEwMSw0MC4xODUsNDQuNzEsMzkuNzk1eiIvPgoJPHBhdGggc3R5bGU9ImZpbGw6I0FCQzVEMzsiIGQ9Ik0zNy4yOTYsNDUuNzk1bC0zLDNjLTAuMzkxLDAuMzkxLTAuMzkxLDEuMDIzLDAsMS40MTRjMC4xOTUsMC4xOTUsMC40NTEsMC4yOTMsMC43MDcsMC4yOTMgICBzMC41MTItMC4wOTgsMC43MDctMC4yOTNsMy0zYzAuMzkxLTAuMzkxLDAuMzkxLTEuMDIzLDAtMS40MTRTMzcuNjg3LDQ1LjQwNCwzNy4yOTYsNDUuNzk1eiIvPgoJPHBhdGggc3R5bGU9ImZpbGw6I0FCQzVEMzsiIGQ9Ik0yOC43MSwzOS43OTVjLTAuMzkxLTAuMzkxLTEuMDIzLTAuMzkxLTEuNDE0LDBsLTMsM2MtMC4zOTEsMC4zOTEtMC4zOTEsMS4wMjMsMCwxLjQxNCAgIGMwLjE5NSwwLjE5NSwwLjQ1MSwwLjI5MywwLjcwNywwLjI5M3MwLjUxMi0wLjA5OCwwLjcwNy0wLjI5M2wzLTNDMjkuMTAxLDQwLjgxOCwyOS4xMDEsNDAuMTg1LDI4LjcxLDM5Ljc5NXoiLz4KCTxwYXRoIHN0eWxlPSJmaWxsOiNBQkM1RDM7IiBkPSJNMzYuNzEsMzkuNzk1Yy0wLjM5MS0wLjM5MS0xLjAyMy0wLjM5MS0xLjQxNCwwbC0zLDNjLTAuMzkxLDAuMzkxLTAuMzkxLDEuMDIzLDAsMS40MTQgICBjMC4xOTUsMC4xOTUsMC40NTEsMC4yOTMsMC43MDcsMC4yOTNzMC41MTItMC4wOTgsMC43MDctMC4yOTNsMy0zQzM3LjEwMSw0MC44MTgsMzcuMTAxLDQwLjE4NSwzNi43MSwzOS43OTV6Ii8+Cgk8cGF0aCBzdHlsZT0iZmlsbDojQUJDNUQzOyIgZD0iTTIyLjcxLDQ1Ljc5NWMtMC4zOTEtMC4zOTEtMS4wMjMtMC4zOTEtMS40MTQsMGwtMywzYy0wLjM5MSwwLjM5MS0wLjM5MSwxLjAyMywwLDEuNDE0ICAgYzAuMTk1LDAuMTk1LDAuNDUxLDAuMjkzLDAuNzA3LDAuMjkzczAuNTEyLTAuMDk4LDAuNzA3LTAuMjkzbDMtM0MyMy4xMDEsNDYuODE4LDIzLjEwMSw0Ni4xODUsMjIuNzEsNDUuNzk1eiIvPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=);
        }
        .details .city .to .weather .icon .sunrays {
            content: '';
            display: block;
            position: absolute;
            background-color: #FFC107;
            border-radius: 0.5rem;
            -webkit-transform-origin: 50% 0%;
            transform-origin: 50% 0%;
            width: 0.4rem;
        }
        .details .city .to .weather .icon .ray1 {
            height: 2rem;
            -webkit-transform: rotate(135deg);
            transform: rotate(135deg);
            left: 3.5rem;
            top: 1rem;
            -webkit-animation: rays 1s ease-in-out infinite;
            animation: rays 1s ease-in-out infinite;
        }
        .details .city .to .weather .icon .ray2 {
            height: 1.4rem;
            -webkit-transform: rotate(90deg);
            transform: rotate(90deg);
            left: 2.5rem;
            top: 2.3rem;
            -webkit-animation: rays 1s ease-in-out 50ms infinite;
            animation: rays 1s ease-in-out 50ms infinite;
        }
        .details .city .to .weather .icon .ray3 {
            height: 1.8rem;
            -webkit-transform: rotate(60deg);
            transform: rotate(60deg);
            left: 3rem;
            top: 4rem;
            -webkit-animation: rays 1s ease-in-out infinite;
            animation: rays 1s ease-in-out infinite;
        }
        .details .content {
            width: 90%;
            height: 25%;
            background-color: rgba(204, 204, 204, 0.5);
            /* background-color: $black; */
            border-radius: 0.5rem;
            position: relative;
            color: rgba(0, 0, 0, 0.7);
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
            margin-top: 0.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: 600;
        }
        .details .content span {
            display: block;
            font-size: 1.2rem;
            text-transform: uppercase;
            padding-top: 0.8rem;
            color: rgba(0, 0, 0, 0.5);
            font-weight: 500;
        }
        .details .content .gate, .details .content .departure, .details .content .seat {
            width: 100%;
            font-size: 2rem;
            text-align: center;
            padding: 1rem 0;
        }
        .details .content .seat {
            position: relative;
            cursor: pointer;
        }
        .details .content .seat:after {
            content: '';
            display: block;
            position: absolute;
            width: 1rem;
            height: 1rem;
            background-color: transparent;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            z-index: -1;
            border-radius: 50%;
            box-shadow: 0px 0px 2px 2px #9575CD;
            opacity: 0.2;
            -webkit-animation: beacon 1s ease-in-out infinite;
            animation: beacon 1s ease-in-out infinite;
        }

        .rownumber {
            position: absolute;
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
            font-size: 0.9rem;
            top: -0.2rem;
        }

        .credit {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3rem;
            background-color: rgba(255, 255, 255, 0.8);
            font-size: 1.5rem;
            line-height: 3rem;
            text-align: center;
        }
        .credit a {
            text-decoration: none;
            font-size: 1.8rem;
            font-weight: 600;
            color: #311B92;
        }
        .credit a:hover {
            color: #9575CD;
        }

        @-webkit-keyframes rain1 {
            0% {
                top: 50%;
                opacity: 1;
            }
            100% {
                top: 58%;
                opacity: 0;
            }
        }

        @keyframes rain1 {
            0% {
                top: 50%;
                opacity: 1;
            }
            100% {
                top: 58%;
                opacity: 0;
            }
        }
        @-webkit-keyframes rain2 {
            0% {
                top: 70%;
                opacity: 1;
            }
            100% {
                top: 80%;
                opacity: 0;
            }
        }
        @keyframes rain2 {
            0% {
                top: 70%;
                opacity: 1;
            }
            100% {
                top: 80%;
                opacity: 0;
            }
        }
        @-webkit-keyframes rain3 {
            0% {
                top: 65%;
                opacity: 1;
            }
            100% {
                top: 74%;
                opacity: 0;
            }
        }
        @keyframes rain3 {
            0% {
                top: 65%;
                opacity: 1;
            }
            100% {
                top: 74%;
                opacity: 0;
            }
        }
        @-webkit-keyframes plane {
            0% {
                left: 39%;
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                left: 58%;
                opacity: 0;
            }
        }
        @keyframes plane {
            0% {
                left: 39%;
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                left: 58%;
                opacity: 0;
            }
        }
        @-webkit-keyframes seat {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        @keyframes seat {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        @-webkit-keyframes rays {
            0% {
                height: 0;
            }
            100% {
                height: 1;
            }
        }
        @keyframes rays {
            0% {
                height: 0;
            }
            100% {
                height: 1;
            }
        }
        @-webkit-keyframes beacon {
            0% {
                width: 0rem;
                height: 0rem;
                opacity: 0.2;
                box-shadow: 0px 0px 2px 2px #9575CD;
            }
            100% {
                width: 5.5rem;
                height: 5.5rem;
                opacity: 0.5;
                box-shadow: 0px 0px 2px 4px #9575CD;
            }
        }
        @keyframes beacon {
            0% {
                width: 0rem;
                height: 0rem;
                opacity: 0.2;
                box-shadow: 0px 0px 2px 2px #9575CD;
            }
            100% {
                width: 5.5rem;
                height: 5.5rem;
                opacity: 0.5;
                box-shadow: 0px 0px 2px 4px #9575CD;
            }
        }
        @media screen and (max-width: 720px) {
            :root {
                font-size: 50%;
            }
        }
        @media screen and (max-width: 600px) {
            :root {
                font-size: 40%;
            }
        }
        @media screen and (max-width: 460px) {
            :root {
                font-size: 30%;
            }
        }
        @media screen and (max-width: 320px) {
            .rownumber {
                top: -0.8rem;
            }
        }
        .fixed_header{
            width: 400px;
            table-layout: fixed;
            border-collapse: collapse;
        }

        .fixed_header tbody{
            display:block;
            width: 100%;
            overflow: auto;
            height: 150px;
        }

        .fixed_header thead tr {
            display: block;
        }

        .fixed_header thead {
            background: black;
            color:#fff;
        }

        .fixed_header th, .fixed_header td {
            padding: 5px;
            text-align: left;
            width: 200px;
        }
    </style>

    <body>
        <div class="wrapper">
            <div class="qr">
                <div class="title">Payment By QR Code</div>
                <div class="qr-wrapper">
                    <div class="qr-image"></div>
                </div>
                <a href="#">expand</a>
            </div>
            <div class="inner-wrapper">
                <div class="details">
                    <div class="date"><img src="assets/images/bbm-logo-122x122.png"></div>
                    <div class="city">
                        <div class="from loc">
                            <div class="name">Payment</div>
                            <br><br>Signature :
                            <p style="font-size: large;"> ${sessionScope.customer.name}   ${sessionScope.customer.surname}</p>
                        </div>

                    </div>
                    <div class="plane"></div>
                    <div class="content">
                        <div class="seat">BUY</div>
                    </div>
                </div>
                <div class="seat-layout">
                    <div class="content">
                        <div class="close"><i class="fa fa-times" aria-hidden="true"></i></div>

                        <div class="gate"><img width="50px;" src="assets/images/visa-mastercard.png"></div>
                        <div class="boarding">Total: <span style="font-size: medium;">${sessionScope.cart.getTotalPrice()} bath</span></div>
                    </div>
                    <div class="layout">

                        <div class="container" style="font-size: medium;">
                            <div class="row">
                                <div class="col-12">
                                    <center>
                                        <form action="AfterPayment">
                                        <table class="table fixed_header">
                                            <tr>
                                                <th>#</th>
                                                <th>ROOMNUMBER</th>
                                                <th>PRICE</th>
                                            </tr>

                                            <c:forEach var="cartList" items="${sessionScope.cart.lineRoom}" varStatus="vs">
                                                <tr>
                                                    <th>${vs.count}</th>
                                                    <th>${cartList.room.roomnumber}</th>
                                                    <input type="hidden" name="roomnumber" value="${cartList.room.roomnumber}">
                                                    <th>${cartList.room.price}</th>
                                                </tr>
                                            </c:forEach>
                                        </table>

                                        <div>
                                            <div class="input-group form-search form-inline">
                                                <input type="text" name="idcard" required="" class="form-control" placeholder="IDCARD">
                                                <div class="input-group-append">
                                                    <button type="submit" class="btn-lg btn btn-primary">Payment</button>
                                                </div>
                                            </div>
                                        </div>
                                        </form>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(function () {
                var qrWidth, qrHeight;

                //fluid height of wrapper
                function resizeWrapper() {
                    var wrapper = $('.wrapper');
                    var wrapperWidth = wrapper.css('width');
                    var wrapperheight = parseInt(wrapperWidth.substring(0, wrapperWidth.length - 2)) / 2.5;
                    wrapper.css('height', wrapperheight + 'px');

                    if (!$('.qr').hasClass('expand')) {
                        qrWidth = $('.qr').css('width');
                        qrHeight = $('.qr').css('height');
                        qrWidth = parseInt(qrWidth.substring(0, qrWidth.length - 2));
                        qrHeight = parseInt(qrHeight.substring(0, qrHeight.length - 2));
                    }
                }

                function resizeQr(type) {
                    var qrWrapper = $('.qr-wrapper');
                    if (type === 'down') {
                        qrWrapper.css('height', (qrHeight * 0.38) + 'px');
                        qrWrapper.css('width', (qrWidth * 0.5) + 'px');
                        $('.title').show();
                        $('.title').css('width', (qrWidth * 0.5) + 'px');
                    } else {
                        qrWrapper.css('height', (qrHeight * 0.53) + 'px');
                        qrWrapper.css('width', (qrWidth * 0.7) + 'px');
                        $('.title').hide();
                    }
                }

                $(window).resize(function () {
                    resizeWrapper();
                    resizeQr('down');
                });
                resizeWrapper();

                //Expand QR
                $('.qr').on('click', function () {
                    $(this).toggleClass('expand');
                    if ($(this).hasClass('expand')) {
                        resizeQr('up');
                        $('.qr a').text('collapse');
                    } else {
                        resizeQr('down');
                        $('.qr a').text('expand');
                    }
                });

                $('.details .seat').on('click', function () {
                    $('.inner-wrapper').addClass('seat-details');
                    $('.inner-wrapper').removeClass('boarding-pass');
                });

                $('.seat-layout .close').on('click', function () {
                    $('.inner-wrapper').addClass('boarding-pass');
                    $('.inner-wrapper').removeClass('seat-details');
                });
            })
        </script>
    </body>
</html>
