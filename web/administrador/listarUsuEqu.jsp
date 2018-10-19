<%-- 
    Document   : listarEqu
    Created on : 05-09-2018, 22:03:17
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <h1>Bienvenido: ${usuario}</h1>

                </div>
                <div class="col-sm-3">

                </div>
            </div>
        </div>
    </body>
</html>
