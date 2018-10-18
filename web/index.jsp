<%-- 
    Document   : index
    Created on : 30-08-2018, 19:33:27
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
       <!--Libreria de Boostrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <link rel="stylesheet" type="text/css" href="css/menu.css">
    </head>
    <body>          
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                </div>
                <div class="col-sm-6">
                    <h1  style="color: #ffffff" class="text-center"></h1>
                    <div class="container">   
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="hidden"></li>
                                <li data-target="#myCarousel" data-slide-to="1" class="hidden"></li>
                                <li data-target="#myCarousel" data-slide-to="2" class="hidden"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="img/counter.jpg" style="width:50%;">
                                </div>
                                <div class="item">
                                    <img src="img/counter2.jpg"  style="width:50%;">
                                </div>
                                <div class="item">
                                    <img src="img/lol.png" style="width:50%;">
                                </div>
                                <div class="item">
                                    <img src="img/lol2.jpg" style="width:50%;">
                                </div>
                                <div class="item">
                                    <img src="img/fornite.jpg" style="width:50%;">
                                </div>
                                <div class="item">
                                    <img src="img/fornite2.jpg" style="width:50%;">
                                </div>
                            </div>  
                        </div>
                    </div>
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="col-sm-3">
                </div>
            </div>
            <div class="footer">
            <p>&COPY;  Creado por el roger &REG;</p>
        </div>
        </div>
        
    </body>
</html>
