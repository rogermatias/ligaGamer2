<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : agregarAdm
    Created on : 05-09-2018, 15:44:47
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Administrador</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/sesion.css" rel="stylesheet" type="text/css"/>
        <link href="../css/super.css" rel="stylesheet" type="text/css"/>
        <link href="../css/temporal.css" rel="stylesheet" type="text/css"/>
        <script src="../js/tempo.js" type="text/javascript"></script>
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
                            <h1 style="color: #fff">Agregar Administrador</h1>

                            <form action="../procesoUsuario" method="GET">
                                <div class="form-group">
                                    <label>Nombre:</label>
                                    <input type="text" name="txtNombre" placeholder="Ej: francisco" minlength="4" required="" class="form-control"/>
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
                        </div>
                        <div class="col-sm-3">
                            ${msjNO}
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
