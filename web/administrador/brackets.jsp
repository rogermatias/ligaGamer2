<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : brackets
    Created on : 11-09-2018, 20:48:34
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
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
    <sql:query var="cuartos1" dataSource="${dataSource}">
        SELECT nombre_equipo FROM equipo WHERE id=2 && clasificacion=2
    </sql:query>
   
    <body>
        <TABLE class="table-bordered">
            <TR>
                <TD>Cuartos</TD> <TD>Semifinal</TD> <TD>Final</TD> <TD>Ganador!</TD>
            </TR>
            <TR>

                <TD>Team 1</TD> <TD></TD> <TD></TD> <TD></TD>
            </TR>
            <TR>
                <TD></TD> <TD>Team 1</TD> <TD></TD> <TD></TD>
            </TR>
            <TR>
                <TD>Team 2</TD> <TD></TD> <TD></TD> <TD></TD>
            </TR>
            <TD></TD> <TD></TD> <TD>Team 1</TD> <TD></TD>
            <TR>
                <TD>Team 3</TD> <TD></TD> <TD></TD> <TD></TD>
            </TR>
            <TD></TD> <TD>Team 3</TD> <TD></TD> <TD></TD>
            <TR>
                <TD>Team 4</TD> <TD></TD> <TD></TD> <TD></TD>
            </TR>
            <TD></TD> <TD></TD> <TD></TD> <TD>Team 1</TD>
            <TR>
                <TD>Team 5</TD> <TD></TD> <TD></TD> <TD></TD>
            </TR>
            <TD></TD> <TD>Team 5</TD> <TD></TD> <TD></TD>
            <TR>
                <TD>Team 6</TD> <TD></TD> <TD></TD> <TD></TD>
            </TR>
            <TD></TD> <TD></TD> <TD>Team 5 </TD> <TD></TD>
            <TR>
                <TD>Team 7</TD> <TD></TD> <TD></TD> <TD></TD>
            </TR>
            <TD></TD> <TD>Team 7</TD> <TD></TD> <TD></TD>
            <TR>
                <TD>Team 8</TD> <TD></TD> <TD></TD> <TD></TD>
            </TR>
        </TABLE>

    </body>
</html>
