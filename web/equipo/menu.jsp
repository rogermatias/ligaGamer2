<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : menu
    Created on : 05-09-2018, 22:00:25
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">${nomEquipo}</a>
        </div>
        <c:if test="${equipo != 1}">
            <ul class="nav navbar-nav">
                <li class="active"><a href="indexEqu.jsp">Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Equipo
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="agregarJug.jsp">Inscribir Jugador</a></li>
                        <li><a href="darBajaJug.jsp">Dar de baja a un Jugador</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                    </ul>
                </li>
            </ul>
        </c:if>
        <c:if test="${equipo == 1}">
            <ul class="nav navbar-nav">
                <li class="active"><a href="indexEqu.jsp">Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Equipo
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="agregarEqu.jsp">Inscribir mi Equipo</a></li>
                    </ul>
                </li>
            </ul>
        </c:if>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="../procesoCerrarSession"><span class="glyphicon glyphicon-log-in"></span> Cerrar Sesion</a></li>
        </ul>
    </div>
</nav>