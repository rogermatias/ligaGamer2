<%-- 
    Document   : menu
    Created on : 05-09-2018, 15:38:29
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Super Usuario</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="indexSup.jsp">Home</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Super Usuario
                    <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="agregarAdm.jsp">Agregar Administrador</a></li>
                    <li><a href="modificarAdm.jsp">Modificar Administrador</a></li>
                    <li><a href="darBajaAdm.jsp">Dar de Baja a un Administrador</a></li>
                    <li><a href="../procesoListar">Listar Administradores</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Administrador
                    <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="agregarUsuEqu.jsp">Agregar Usuario del Equipo</a></li>
                    <li><a href="modificarEqu.jsp">Modificar Usuario del Equipo</a></li>
                    <li><a href="darBajaEqu.jsp">Dar de Baja a un Usuario</a></li>
                    <li><a href="../procesoListarUsuEqu">Listar Usuarios</a></li>
                </ul>
            </li>
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
        <ul class="nav navbar-nav navbar-right">
            <li><a href="../procesoCerrarSession"><span class="glyphicon glyphicon-log-in"></span> Cerrar Sesion</a></li>
        </ul>
    </div>
</nav>
