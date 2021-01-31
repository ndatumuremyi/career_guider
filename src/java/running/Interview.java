/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package running;

import database.Questions;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paterne
 */
public class Interview extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Interview</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Interview at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        database.Connections operation = new database.Connections();
        int start;
        int count = 2;
        int page;
        int totalRows=0;
        int totalPages;
        ArrayList<Questions> questions = null;
        ResultSet result = operation.executeGet("SELECT COUNT(*) As nRows FROM questions ;");
        try {
            while (result.next()) {
                totalRows = Integer.parseInt(result.getString("nRows"));
                
            }
            String pageString = request.getParameter("page");
            if(pageString == null){
                page =1;
            }
            else{
                page = Integer.parseInt(pageString);
            }
            
            
            start = count * (page - 1);
            
            if(totalRows >= start){
                questions = operation.selectAll("questions", start, count);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Interview.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        totalPages = totalRows/count;
        request.setAttribute("questions", questions);
        request.setAttribute("totalPages", totalPages);
        RequestDispatcher view = request.getRequestDispatcher("Interview.jsp");
        view.forward(request, response);

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