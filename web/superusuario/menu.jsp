<%-- 
    Document   : menu
    Created on : 05-09-2018, 15:38:29
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <ul class="accordion-menu">
  <li>
    <div class="dropdownlink"><i class="fa fa-road" aria-hidden="true"></i> Super Usuario
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="agregarAdm.jsp">Agregar Administrador</a></li>
          <li><a href="modificarAdm.jsp">Modificar Administrador</a></li>
          <li><a href="darBajaAdm.jsp">Dar de Baja a un Administrador</a></li>
          <li><a href="listarAdm.jsp">Listar Administradores</a></li>
          
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-paper-plane" aria-hidden="true"></i> Administrador
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
       <li><a href="agregarEqu.jsp">Agregar Equipo</a></li>
          <li><a href="agregarUsuEqu.jsp">Agregar Usuario del Equipo</a></li>
          <li><a href="modificarEqu.jsp">Modificar Equipo</a></li>
          <li><a href="darBajaEqu.jsp">Dar de Baja a un Usuario</a></li>
          <li><a href="listarUsuEqu.jsp">Listar Usuarios</a></li>
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-quote-left" aria-hidden="true"></i> Equipo
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
    <li><a href="agregarAdm.jsp">Agregar Administrador</a></li>
          <li><a href="modificarAdm.jsp">Modificar Administrador</a></li>
          <li><a href="darBajaAdm.jsp">Dar de Baja a un Administrador</a></li>
          <li><a href="listarAdm.jsp">Listar Administradores</a></li>
    </ul>
  </li>
 <li>
    <div class="dropdownlink"><i class="fa fa-quote-left" aria-hidden="true"></i> Home
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
    <li><a href="../index.jsp">Menu Principal</a></li>
          
    </ul>
  </li>
</ul>
   