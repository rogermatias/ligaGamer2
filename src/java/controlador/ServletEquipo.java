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
import modelo.dao.EquipoFacade;
import modelo.dao.UsuarioFacade;
import modelo.dto.Clasificacion;
import modelo.dto.Equipo;
import modelo.dto.TipoLiga;
import modelo.dto.Usuario;

/**
 *
 * @author franco
 */
public class ServletEquipo extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    @EJB
    private EquipoFacade equipoFacade;

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
        //Recubumos el boton del formulario
        String opcion = request.getParameter("btnAccion");
        //Cual accion se ejecuta

        if (opcion.equals("Agregar")) {
            agregar(request, response);
        }

        
    }
    
    protected void agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Recibimos el formulario
            String nombre = request.getParameter("txtNombre");
            int tipoLiga = Integer.parseInt(request.getParameter("txtLiga"));
            TipoLiga tipo = new TipoLiga(tipoLiga);
            Clasificacion clasificacion = new Clasificacion(2);
            
            if (equipoFacade.existeEquipo(nombre)) {
                request.getSession().setAttribute("msjNO", "El nombre del equipo ya existe");
            } else {
                Equipo equipo = new Equipo(clasificacion, tipo, nombre, 0, true);
                equipoFacade.create(equipo);
                int equ = (int) equipo.getId();
                Equipo id = new Equipo(equ);
                HttpSession u = request.getSession();
                int a = (int) u.getAttribute("id");
                
                Usuario usu = new Usuario(a, id);
                if (usuarioFacade.actualizarEquipo(usu)) {
                    request.getSession().setAttribute("nomEquipo", equipo.getNombreEquipo());
                    request.getSession().setAttribute("equipo", equipo.getId());
                    request.getSession().setAttribute("msjOK", "Equipo Agregado");
                }
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error " + e.getMessage());
            
        } finally {
            response.sendRedirect("equipo/indexEqu.jsp");
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
