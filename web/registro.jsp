<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : registro
    Created on : 12-09-2018, 18:37:31
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Usuario</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <link rel="stylesheet" type="text/css" href="css/menu.css">
    </head>
    <body>

        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <h1>Resgistrese</h1>

                    <form action="procesoAdministrador" method="GET">
                        <div class="form-group">
                            <label>Nombre del Lider:</label>
                            <input type="text" name="txtNombre" placeholder="Ej: Juan" minlength="4" required="" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Edad:</label>
                            <input type="number" name="txtEdad" placeholder="Ej: 18" min="18" required="" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Usuario:</label>
                            <input type="text" name="txtUser" placeholder="Jise"  required="" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Contraseña:</label>
                            <input type="password" name="txtPass" placeholder="******" required="" class="form-control"/>
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" name="btnAccion" value="Agregar" class="btn btn-success"/>
                        </div>
                    </form>
                    <c:if test="${msjOK != null}">
                        <div class="alert alert-success">
                            <strong>Correcto!</strong> ${msjOK}.
                        </div>
                    </c:if>
                    <c:if test="${msjNO != null}">
                        <div class="alert alert-danger">
                            <strong>Error!</strong> ${msjNO}.
                        </div>
                    </c:if>
                </div>
                <div class="col-sm-3">

                </div>
            </div>
        </div>
    </body>
</html>
