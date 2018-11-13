<%-- 
    Document   : History
    Created on : 8 พ.ย. 2561, 18:20:13
    Author     : Kridtakom
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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" >
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.semanticui.min.css">
        <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">

    </head>
    <body>
        <jsp:include page="include/Header.jsp"/>

        <section class="header11 cid-r7MmAIxkys" id="header11-1a">
            <div class="container align-left" style="margin-bottom: 50px;">
                <div class="media-container-column mbr-white col-md-12">
                    <h1 class="mbr-section-title py-3 mbr-fonts-style display-1"><strong >History</strong></h1>
                </div>
            </div>
            <section class="history" style="padding: 70px; width: 85%;
                     background-color: rgb(255,255,255,0.59);
                     margin: auto;
                     font-family: 'Kanit', sans-serif;
                     font-size: 15px;">
                <table id="example" class="ui celled table" style="width:100%">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Office</th>
                            <th>Age</th>
                            <th>Start date</th>
                            <th>Salary</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </section>

        </section>








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

        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.semanticui.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>
</html>
