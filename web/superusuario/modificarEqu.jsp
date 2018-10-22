<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : modificarEqu
    Created on : 06-09-2018, 16:31:27
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar</title>
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
                            <h1>Modificar Usuario del Equipo</h1>

                            <form action="../procesoAdministrador" method="GET">
                                <div class="form-group">
                                    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
                                    <sql:query var="usuario" dataSource="${dataSource}">
                                        SELECT u.nombre, u.id, e.nombre_equipo FROM usuario u INNER JOIN equipo e ON u.equipo = e.id WHERE u.tipo_usuario=3 AND u.vigente=1 
                                    </sql:query>
                                    <label>Usuario a Modificar:</label>
                                    <select name="txtID" id="cboEmpleados" class="form-control">
                                        <c:forEach var="usu" items="${usuario.rows}">
                                            <option value="${usu.id}">${usu.nombre} (${usu.nombre_equipo})</option>
                                        </c:forEach>
                                    </select>
                                </div>
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
                                    <input type="submit" name="btnAccion" value="Modificar" class="btn btn-success"/>
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
