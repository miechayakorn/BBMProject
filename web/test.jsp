<%-- 
    Document   : test
    Created on : 07-Nov-2018, 16:55:32
    Author     : Acer_E5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.2.3/css/bootstrap-slider.min.css" />
    </head>
    <body>
        <br><br>
        Filter by price interval: <b>€ 10</b> <input id="ex2" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/> <b>€ 1000</b>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.2.3/bootstrap-slider.js"></script>
    </body>
    <script>

// Without JQuery
var slider = new Slider('#ex2', {});
    </script>
</html>
