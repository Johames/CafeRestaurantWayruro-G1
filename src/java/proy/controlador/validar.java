/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import proy.modelo.dao.Usuariodao;
import proy.modelo.daoImpl.UsuariodaoImpl;
import proy.modelo.entidad.Usuario;

/**
 *
 * @author TOSHIBA
 */
public class validar extends HttpServlet {

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
        String us = request.getParameter(""); us = us == null?"":us;
        String usuario = request.getParameter("usuario"); usuario = usuario == null?"":usuario;
        String contrasena = request.getParameter("contrasena"); contrasena = contrasena == null?"":contrasena;

        Usuariodao dao = new UsuariodaoImpl();
        
        if(dao.ComprobarUsuario(usuario, contrasena) != null){
            
            us = dao.ComprobarUsuario(usuario, contrasena);
            
            HttpSession session = request.getSession();
            session.setAttribute("idUsuario", dao.ComprobarUsuario(usuario, contrasena));
            
            request.getRequestDispatcher("inicio.jsp").forward(request, response);
            
        }else{
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
