<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listarAdm
    Created on : 05-09-2018, 15:46:13
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Administradores</title>
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
                            <h1>Listar Administradores</h1>
                            <form action="../procesoListar" method="GET">
                                <table class="table table-bordered ">
                                    <tr>
                                        <th>ID</th>
                                        <th>NOMBRE</th>
                                        <th>EDAD</th>
                                        <th>USUARIO</th>
                                        <th>CONTRASEÑA</th>
                                        <th>VIGENTE</th>
                                    </tr>
                                    <c:forEach var="lista" items="${listado}">
                                        <tr>
                                            <td> ${lista.id}</td>
                                            <td> ${lista.nombre}</td>
                                            <td> ${lista.edad}</td>
                                            <td> ${lista.user}</td>
                                            <td> ${lista.pass}</td>
                                            <td> ${lista.vigente}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </form>
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
