<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : 30-08-2018, 19:47:16
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!--Libreria de Boostrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <h1></h1>
            <div class="row">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <h1>Ingrese sus Credenciales</h1> 
                    <form action="procesoLogin" method="GET">
                        <div class="form-group">
                            <label>Usuario: </label>
                            <input type="text" name="txtUser" placeholder="Ej: Fnatic" required="" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Contraseña: </label>
                            <input type="password" name="txtPass" placeholder="******" required="" class="form-control"/>
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" name="btnAccion" value="Ingresar" class="btn btn-primary">
                            <input type="reset" value="Limpiar" class="btn btn-default">
                        </div>
                    </form>
                    <c:if test="${msjLog != null}">
                        <div class="alert alert-danger">
                            <strong>Error!</strong> ${msjLog}.
                        </div>
                    </c:if>
                </div>
                <div class="col-sm-3">

                </div>
            </div>
        </div>
    </body>
</html>
