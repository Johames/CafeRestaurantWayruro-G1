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
import proy.modelo.dao.Movimientosdao;
import proy.modelo.dao.Pensionistadao;
import proy.modelo.dao.Productodao;
import proy.modelo.dao.Usuariodao;
import proy.modelo.daoImpl.MovimientosdaoImpl;
import proy.modelo.daoImpl.PensionistadoaImpl;
import proy.modelo.daoImpl.ProductodaoImpl;
import proy.modelo.daoImpl.UsuariodaoImpl;

/**
 *
 * @author TOSHIBA
 */
public class Crud extends HttpServlet {

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
        Pensionistadao dao = new PensionistadoaImpl();
        Usuariodao us = new UsuariodaoImpl();
        Movimientosdao mov = new MovimientosdaoImpl();
        Productodao prod = new ProductodaoImpl();
        
        String action = request.getParameter("action"); action = action == null?"":action;
        
        switch(action){
            case "listarpen":
                request.setAttribute("listapen", dao.ListarPensionista());
                request.getRequestDispatcher("pensionistas.jsp").forward(request, response);
                break;
            case "listarinac":
                request.setAttribute("listainac", dao.ListarInactivos());
                request.getRequestDispatcher("pensionistasinactivos.jsp").forward(request, response);
                break;
            case "listarus":
                request.setAttribute("listaus", us.ListarUsuario());
                request.getRequestDispatcher("Usuario.jsp").forward(request, response);
                break;
            case "listarmov":
                request.setAttribute("listamov", mov.MovdelMes());
                request.getRequestDispatcher("movimientos.jsp").forward(request, response);
                break;
            case "movcomp":
                request.setAttribute("movcompletos", mov.Listar());
                request.getRequestDispatcher("movcompletos.jsp").forward(request, response);
                break;
            case "pmvend":
                request.setAttribute("pmasven", prod.PmasVendido());
                request.getRequestDispatcher("pmasvendido.jsp").forward(request, response);
                break;
            case "asisdia":
                request.setAttribute("asdia", dao.ListarAsistenciasDia());
                request.getRequestDispatcher("AsistenciaDia.jsp").forward(request, response);
                break;
            case "asismes":
                request.setAttribute("asmes", dao.ListarAsistenciasMes());
                request.getRequestDispatcher("AsistenciaMes.jsp").forward(request, response);
                break;
            case "asiscom":
                request.setAttribute("ascom", dao.ListarAsistencias());
                request.getRequestDispatcher("Asistencias.jsp").forward(request, response);
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
