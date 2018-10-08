<%-- 
    Document   : RegisterMessage
    Created on : Sep 14, 2018, 12:26:36 PM
    Author     : INT303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activate Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <a href="/BBMProject" class="btn btn-danger">Back</a>
                            <h5 class="card-title text-center">Activate Page</h5>
                            <form class="form-signin" action="Activate">
                                <div class="form-label-group">
                                    <label>Email address</label>
                                    <input type="email" name="email" value="${email}" readonly="readonly" id="inputEmail" class="form-control" placeholder="Email address">
                                    <br>
                                </div>
                                <br>
                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Activate Code!!</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
