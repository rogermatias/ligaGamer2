<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : darBajaJug
    Created on : 10-09-2018, 18:17:59
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dar de baja a un jugador</title>
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
                            <h1>Dar de Baja a un Jugador</h1>
                            <form action="../procesoJugador" method="GET">
                                <div class="form-group">
                                    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
                                    <sql:query var="usuario" dataSource="${dataSource}">
                                        SELECT nombre, id FROM jugadores 
                                    </sql:query>
                                    <label>Usuario</label>
                                    <select name="txtID" id="cboEmpleados" class="form-control">
                                        <c:forEach var="usu" items="${usuario.rows}">
                                            <option value="${usu.id}">${usu.nombre} ${usu.apellido}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Si</label>
                                    <input type="radio" name="vigente" value="false" />
                                    <label>No</label>
                                    <input type="radio" name="vigente" value="true" />
                                </div>
                                <div class="form-group text-center">
                                    <input type="submit" name="btnAccion" value="Bajar" class="btn btn-success"/>
                                </div>

                            </form>
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
