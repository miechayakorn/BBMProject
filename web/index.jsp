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
    </head>
    <body>
        <c:choose>
            <c:when test="${status == true}">
                <div class="alert alert-success">
                    <strong>ยินดีต้อนรับการกลับมาของท่าน!!</strong> ในตอนนี้ท่านสามารถใช้รหัสผ่านใหม่ได้เรียบร้อยแล้ว
                </div>
            </c:when>
            <c:when test="${status == false}">
                <div class="alert alert-danger">
                    <strong>Danger!</strong> ไม่มี Email นี้ในระบบของเรา กรุณาลองใหม่
                </div>
            </c:when>
            <c:otherwise>

            </c:otherwise>
        </c:choose>
    <center>
        <h1>Wellcome - BBM Page</h1>
        <p>ลิสแต่ละ Link ที่ทำ</p>
        <a href="Login">Login</a>
        <a href="Activate">Activate</a>
        <a href="Register">Register</a>
        <a href="Recovery">Recovery</a>
    </center>
</body>
</html>
