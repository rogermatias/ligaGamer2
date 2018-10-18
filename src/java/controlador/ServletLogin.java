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
import modelo.dao.UsuarioFacade;
import modelo.dto.Usuario;

/**
 *
 * @author Duoc
 */
public class ServletLogin extends HttpServlet {

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
        try {

            //RECIBIMOS LOS PARARMETROS DEL FORMULARIO
            String user = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");

            //VALIDAR EN EL DTO
            Usuario usuario = new Usuario(user, pass);
            //VALIDAMOS EL USUARIO

            //VALIDAMOS EL TIPO DE USUARIO
            usuarioFacade.find(usuario);
            if (usuario.getTipoUsuario().getDescripcion().equals("Administrador")) {

                //  REDIRECCION
                request.getSession().setAttribute("user", usuario.getUser());
                request.getSession().setAttribute("usuario", usuario.getNombre());
                request.getSession().setAttribute("tipo", usuario.getTipoUsuario().getId());
                //request.getSession().setAttribute("vigente", usuario.isVigente());

                response.sendRedirect("administrador/indexAdm.jsp");
            } else if (usuario.getTipoUsuario().getDescripcion().equals("SuperUsuario")) {
                request.getSession().setAttribute("user", usuario.getUser());
                request.getSession().setAttribute("usuario", usuario.getNombre());
                request.getSession().setAttribute("tipo", usuario.getTipoUsuario().getId());
                //request.getSession().setAttribute("vigente", usuario.isVigente());
                response.sendRedirect("superusuario/indexSup.jsp");
            } else if (usuario.getTipoUsuario().getDescripcion().equals("Equipo")) {
                request.getSession().setAttribute("id", usuario.getId());
                request.getSession().setAttribute("user", usuario.getUser());
                request.getSession().setAttribute("usuario", usuario.getNombre());
                request.getSession().setAttribute("tipo", usuario.getTipoUsuario().getId());
                //request.getSession().setAttribute("vigente", usuario.isVigente());
                request.getSession().setAttribute("equipo", usuario.getEquipo().getId());
                request.getSession().setAttribute("nomEquipo", usuario.getEquipo().getNombreEquipo());
                response.sendRedirect("equipo/indexEqu.jsp");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjLog", "Contraseña o usuario Incorrecto");
            response.sendRedirect("login.jsp");
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
