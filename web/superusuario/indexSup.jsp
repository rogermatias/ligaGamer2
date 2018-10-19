<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 30-08-2018, 20:29:25
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Super Usuario</title>
        <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <link href="../css/temporal.css" rel="stylesheet" type="text/css"/>
        <script src="../js/tempo.js" type="text/javascript"></script>
        <link rel="stylesheet" href="../css/super.css">
        <link href="../css/sesion.css" rel="stylesheet" type="text/css"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </head>

    <body>

        <c:choose>
            <c:when test="${user == null}">
                <div class="hola"></div>
                <div class="contenido">
                    <h1>Necesita Logearse</h1>
                    <a href="../index.jsp">Volver</a>
                </div>      
            </c:when>
            <c:when test="${user != null && tipo == 2}">

                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <jsp:include page="menu.jsp"/>   
                        </div>
                        <div class="col-sm-6">
                            <h1>Bienvenido: ${nombre}</h1>
                        </div>
                        <div class="col-sm-3">

                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${tipo != 2}">
                <h1>Tipo de usuario no admitido</h1>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
    </body>
</html>
