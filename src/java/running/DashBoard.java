/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package running;

import database.Connections;
import database.Results;
import database.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paterne
 */
public class DashBoard extends HttpServlet {
    database.Connections connection = new database.Connections();
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
                
            database.Records record = null;
            Results result =(Results) request.getAttribute("result");
            
            HttpSession session = request.getSession(false);
            
            database.Users user =(database.Users) session.getAttribute("user");
            if(result == null){
                try{
                    result = (Results) connection.find("results", "username", user.getUsername()).get(0);
                }catch(Exception e){
                    result = null;
                }
                
            }
            request.setAttribute("result",result);
            
            try{
                 record = (database.Records) connection.find("records", "username", user.getUsername()).get(0);
                
            }catch(Exception e){
                record = null;
            }
            request.setAttribute("record", record);
                
                
                ResultSet allOrientations;
                try{
                    String query = " SELECT DISTINCT nameOfGroup from questions where riasecType = \""+record.getType()+"\";";
                    allOrientations = connection.executeGet(query);
                }catch(Exception e){
                    allOrientations = null;
                }
                
                request.setAttribute("allOrientation", allOrientations);
            
            
            
            /* TODO output your page here. You may use following sample code. */
           RequestDispatcher view =  request.getRequestDispatcher("html/DashBoard.jsp");
           
//           connection.destroy();
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
    @Override
    public void destroy() {
        connection.destroy();
    }
}
