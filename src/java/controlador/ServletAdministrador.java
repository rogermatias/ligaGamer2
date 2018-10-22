/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.UsuarioFacade;
import modelo.dto.Equipo;
import modelo.dto.TipoUsuario;
import modelo.dto.Usuario;

/**
 *
 * @author Duoc
 */
public class ServletAdministrador extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String opcion = request.getParameter("btnAccion");
        //Cual accion se ejecuta
        if (opcion.equals("Agregar")) {
            agregar(request, response);
        }

        if (opcion.equals("Modificar")) {
            modificar(request, response);
        }

        if (opcion.equals("Bajar")) {
            darBaja(request, response);
        }
        
    }
    
    protected void agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Recibimos el formulario
            String nombre = request.getParameter("txtNombre");
            int edad = Integer.parseInt(request.getParameter("txtEdad"));
            String user = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");
            Equipo equipo = new Equipo(1);
            TipoUsuario tipoUsuario = new TipoUsuario(3);

            if (usuarioFacade.existeUsuario(user)) {
                request.getSession().setAttribute("msjNO", "Usuario ya existe con ese nombre");
            } else {
                Usuario usu = new Usuario(equipo, tipoUsuario, nombre, edad, user, pass, true);
                usuarioFacade.create(usu);
                request.getSession().setAttribute("msjOK", "Usuario Agregado");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error " + e.getMessage());
        } finally {
            HttpSession se = request.getSession();
            int a = (int) se.getAttribute("tipo");
            if (a == 1) {
                response.sendRedirect("administrador/agregarUsuEqu.jsp");
            } else if (a == 2) {
                response.sendRedirect("superusuario/agregarUsuEqu.jsp");
            } else {
                response.sendRedirect("registro.jsp");
            }
        }
    }

    protected void modificar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            //Recibimos el formulario
            int id = Integer.parseInt(request.getParameter("txtID"));
            String nombre = request.getParameter("txtNombre");
            int edad = Integer.parseInt(request.getParameter("txtEdad"));
            String user = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");

            //Validamos a nivel de modelo(DTO)
            Usuario usu = new Usuario(id, nombre, edad, user, pass);
            // LLamamos al dao que tiene los metodos

            //Actualizamos el alumno en la DB
            if (usuarioFacade.modificarAdmin(usu)) {
                request.getSession().setAttribute("msjOK", "Usuario Modificado");
            } else {
                //Variable de session(nombre de la variable,contenido)
                request.getSession().setAttribute("msjNO", "Usuario NO pudo ser Modificado");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error " + e.getMessage());
        } finally {
            HttpSession se = request.getSession();
            int a = (int) se.getAttribute("tipo");
            if (a == 1) {
                response.sendRedirect("administrador/modificarEqu.jsp");
            } else {
                response.sendRedirect("superusuario/modificarEqu.jsp");
            }
        }
    }

    protected void darBaja(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Recibimos el formulario
            int id = Integer.parseInt(request.getParameter("txtID"));
            boolean vigente = Boolean.valueOf(request.getParameter("vigente"));
            //Validamos a nivel de modelo(DTO)
            Usuario usu = new Usuario(id, vigente);
            if (usuarioFacade.darBaja(usu)) {
                request.getSession().setAttribute("msjOK", "Usuario Modificado");
            } else {
                request.getSession().setAttribute("msjNO", "Usuario NO pudo ser Modificado");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error " + e.getMessage());
        } finally {
            HttpSession se = request.getSession();
            int a = (int) se.getAttribute("tipo");
            if (a == 1) {
                response.sendRedirect("administrador/darBajaEqu.jsp");
            } else {
                response.sendRedirect("superusuario/darBajaEqu.jsp");
            }
        }
    }
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
