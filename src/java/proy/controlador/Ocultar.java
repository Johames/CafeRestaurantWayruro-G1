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

/**
 *
 * @author TOSHIBA
 */
public class Ocultar extends HttpServlet {

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
        
        String action = request.getParameter("action"); action = action == null?"":action;
        
        switch(action){
            case "pensionistas":
                request.getRequestDispatcher("pensionistas.jsp").forward(request, response);
                break;
            case "venta":
                request.getRequestDispatcher("venta.jsp").forward(request, response);
                break;
            case "movimiento":
                request.getRequestDispatcher("movimientos.jsp").forward(request, response);
                break;
            case "movcompletos":
                request.getRequestDispatcher("movcompletos.jsp").forward(request, response);
                break;
            case "pmasvendido":
                request.getRequestDispatcher("pmasvendido.jsp").forward(request, response);
                break;
            case "asistencia":
                request.getRequestDispatcher("AsistenciaDia.jsp").forward(request, response);
                break;
            case "asistenciames":
                request.getRequestDispatcher("AsistenciaMes.jsp").forward(request, response);
                break;
            case "asistenciacompleta":
                request.getRequestDispatcher("Asistencias.jsp").forward(request, response);
                break;
            case "usuario":
                request.getRequestDispatcher("Usuario.jsp").forward(request, response);
                break;
            case "agregarusuario":
                request.getRequestDispatcher("agregarusuario.jsp").forward(request, response);
                break;
            case "volver":
                request.getRequestDispatcher("inicio.jsp").forward(request, response);
                break;
            case "agregarpen":
                request.getRequestDispatcher("agregar.jsp").forward(request, response);
                break;
            case "inactivos":
                request.getRequestDispatcher("pensionistasinactivos.jsp").forward(request, response);
                break;
            case "addcategoria":
                request.getRequestDispatcher("addcategoria.jsp").forward(request, response);
                break;
            case "addproducto":
                request.getRequestDispatcher("addproducto.jsp").forward(request, response);
                break;
            default:
                break;
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
