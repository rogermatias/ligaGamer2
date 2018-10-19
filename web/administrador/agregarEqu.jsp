<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : agregarEqu
    Created on : 05-09-2018, 22:02:47
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Equipo</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/sesion.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <c:choose>
            <c:when test="${user == null}">
                
                <h1>Necesita Logearse</h1>
                
            </c:when>
            <c:when test="${user != null && tipo == 1}">
                <jsp:include page="menu.jsp"/>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">

                        </div>
                        <div class="col-sm-6">
                            <h1>Agregar Equipo</h1>

                            <form action="../procesoEquipo" method="GET">
                                <div class="form-group">
                                    <label>Nombre del Equipo:</label>
                                    <input type="text" name="txtNombre" placeholder="Ej: KLG" minlength="4" required="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
                                    <sql:query var="liga" dataSource="${dataSource}">
                                        SELECT descripcion, id FROM tipo_liga WHERE vigente=1
                                    </sql:query>
                                    <label>Tipo de Liga:</label>
                                    <select name="txtLiga" id="cboLiga" class="form-control">
                                        <c:forEach var="lig" items="${liga.rows}">
                                            <option value="${lig.id}">${lig.descripcion}</option>
                                        </c:forEach>
                                    </select>
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
            <c:when test="${tipo != 1}">
                <h1>Tipo de usuario no admitido</h1>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
    </body>
</html>
