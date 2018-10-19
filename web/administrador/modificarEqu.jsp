<%-- 
    Document   : modificarEqu
    Created on : 05-09-2018, 17:44:55
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <h1>Bienvenido: ${usuario}</h1>

                    <form action="../procesoUsuario" method="GET">
                        <div class="form-group">
                            <label>ID:</label>
                            <input type="text" name="txtID" placeholder="Ej: 1"  required="" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Nombre:</label>
                            <input type="text" name="txtNombre" placeholder="Ej: francisco" minlength="4" required="" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Apellido:</label>
                            <input type="text" name="txtApellido" placeholder="Ej: jara" minlength="4" required="" class="form-control"/>
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
                        <div class="form-group">
                            <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
                            <sql:query var="equipo" dataSource="${dataSource}">
                                SELECT nombre_equipo, id FROM equipo WHERE vigente=1
                            </sql:query>
                            <label>Equipo:</label>
                            <select name="cboEquipo" id="cboEmpleados" class="form-control">
                                <c:forEach var="equ" items="${equipo.rows}">
                                    <option value="${equ.id}">${equ.nombre_equipo}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" name="btnAccion" value="Modificar" class="btn btn-success"/>
                        </div>

                    </form>
                </div>
                <div class="col-sm-3">
                    
                </div>
            </div>
        </div>
    </body>
</html>
