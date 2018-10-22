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
import modelo.dao.JugadoresFacade;
import modelo.dto.Equipo;
import modelo.dto.Jugadores;

/**
 *
 * @author franco
 */
public class ServletJugador extends HttpServlet {

    @EJB
    private EquipoFacade equipoFacade;

    @EJB
    private JugadoresFacade jugadoresFacade;

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
         
        if (opcion.equals("Agregar")) {
            agregar(request, response);
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
            String apellido = request.getParameter("txtApellido");
            String nickname = request.getParameter("txtNickname");
            int equ = Integer.parseInt(request.getParameter("txtEquipo"));
            Equipo equipo = new Equipo(equ);

            if (jugadoresFacade.existeJugador(nickname)) {
                //Variable de session(nombre de la variable,contenido)
                request.getSession().setAttribute("msjNO", "Jugador ya existe con este nick");
            } else {
                Jugadores jugador = new Jugadores(equipo, nombre, apellido, nickname, true);
                jugadoresFacade.create(jugador);

                Equipo equipoModi = new Equipo(equ);
                if (equipoFacade.actualizarIntegrantes(equipoModi)) {
                    //Variable de session(nombre de la variable,contenido)
                    request.getSession().setAttribute("msjOK", "Jugador Inscrito");
                }
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error " + e.getMessage());
        } finally {
            HttpSession se = request.getSession();
            int a = (int) se.getAttribute("tipo");
            if (a == 1) {
                response.sendRedirect("administrador/agregarJug.jsp");
            } else if (a == 2) {
                response.sendRedirect("superusuario/agregarJug.jsp");
            } else {
                response.sendRedirect("equipo/agregarJug.jsp");
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
            Jugadores jug = new Jugadores(id, vigente);

            if (jugadoresFacade.darBaja(jug)) {

                request.getSession().setAttribute("msjOK", "Jugador Modificado");
            } else {

                request.getSession().setAttribute("msjNO", "Jugador NO pudo ser Modificado");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error " + e.getMessage());
        } finally {
            HttpSession se = request.getSession();
            int a = (int) se.getAttribute("tipo");
            if (a == 1) {
                response.sendRedirect("administrador/darBajaJug.jsp");
            } else if (a == 2) {
                response.sendRedirect("superusuario/darBajaJug.jsp");
            } else {
                response.sendRedirect("equipo/darBajaJug.jsp");
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
