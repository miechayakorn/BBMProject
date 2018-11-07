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
    </head>
    <body>
        <select id="dynamic_select">
            <option value="" selected>Filter By Author</option>
            <option value="https://www.google.com">Google</option>
            <option value="https://www.youtube.com">YouTube</option>
            <option value="https://www.bing.com">Bing</option>
        </select>
    </body>
    <script>
        $(function(){
      $('#dynamic_select').on('change', function () {
          var url = $(this).find('option:selected').val(); // get selected value
          window.location = url; // redirect
      });
    });
    </script>
</html>
