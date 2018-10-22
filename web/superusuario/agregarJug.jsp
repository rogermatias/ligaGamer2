<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : inscribirJug
    Created on : 10-09-2018, 15:07:18
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Jugador</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="../css/super.css">
        <link href="../css/sesion.css" rel="stylesheet" type="text/css"/>
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
            <c:when test="${user != null && tipo == 2 && vigente == true}">
                <jsp:include page="menu.jsp"/>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">

                        </div>
                        <div class="col-sm-6">
                            <h1>Inscribir Jugador</h1>
                            <form action="../procesoJugador" method="GET">
                                <div class="form-group">
                                    <label>Nombre:</label>
                                    <input type="text" name="txtNombre" placeholder="Ej: Franco" minlength="4" required="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Apellido:</label>
                                    <input type="text" name="txtApellido" placeholder="Ej: Gutierrez" minlength="4" required="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Nickname:</label>
                                    <input type="text" name="txtNickname" placeholder="Ej: Scrappy" minlength="3" required="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
                                    <sql:query var="equipo" dataSource="${dataSource}">
                                        SELECT nombre_equipo, id FROM equipo WHERE vigente=1
                                    </sql:query>
                                    <label>Equipo:</label>
                                    <select name="txtEquipo" id="cboEquipo" class="form-control">
                                        <c:forEach var="equ" items="${equipo.rows}">
                                            <option value="${equ.id}">${equ.nombre_equipo}</option>
                                        </c:forEach>
                                    </select>
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
            </c:when>
            <c:when test="${tipo != 2}">
                <div class="hola"></div>
                <div class="contenido">
                    <h1>Tipo de Usuario no Admitido</h1>
                    <a href="../index.jsp">Volver</a>
                </div>
            </c:when>
            <c:when test="${vigente == false}">
                <div class="hola"></div>
                <div class="contenido">
                    <h1>Usuario dado de baja</h1>
                    <a href="../index.jsp">Volver</a>
                </div>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>


    </body>
</html>
