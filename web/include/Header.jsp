<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="menu cid-r6ZFttHx66" id="menu2-10">
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
                    <a href="/BBMProject">
                        <img src="assets/images/bbm-logo-122x122.png" alt="Mobirise" title="">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption display-4 text-white" href="/BBMProject">
                        BBM</a></span>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav-dropdown display-4" data-app-modern-menu="true">
                <li class="nav-item"><a class="nav-link link text-white" href="RoomDetail" aria-expanded="false">รายละเอียดห้อง</a></li>
                <li class="nav-item"><a class="nav-link link text-white" href="RemainingRoom" aria-expanded="false">จำนวนห้องที่เหลืออยู่</a></li>
                <li class="nav-item"><a class="nav-link link text-white" href="/BBMProject/#Project-Info" aria-expanded="false">ข้อมูลโครงการ</a></li>
            </ul>
            <div class="navbar-buttons mbr-section-btn">
                <c:if test="${empty sessionScope.customer}">
                    <a class="btn btn-sm btn-primary" href="Register">Register</a> 
                    <a class="btn btn-sm btn-primary" href="Login"> Login</a>   
                </c:if>
                <a class="btn btn-sm btn-secondary" href="Search#selectRoom"><span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span></a>
                <a class="btn btn-sm btn-warning p-3" href="ShowCart" style="border-radius:12px; ">${sessionScope.cart.quantity == null ? '0' :sessionScope.cart.quantity}&nbsp;<img src="assets/images/condo-icon.png" width="30px" /></a>    
                    <c:if test="${not empty sessionScope.customer}">
                    <div class="btn-group">
                        <a class="btn btn-sm btn-primary nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>    Welcome :   ${sessionScope.customer.name}</a>
                        <div class="dropdown-content dropdown-menu mx-4" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="MyAccount">My Account</a>
                            <a class="dropdown-item" href="History">History</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="Logout">Logout</a>
                        </div>
                    </div>
                    </c:if>        

            </div>
        </div>
    </nav>
</section>

