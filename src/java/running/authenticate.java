/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package running;

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
public class authenticate extends HttpServlet {
    database.Users user = new database.Users();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
        
        
        database.Connections operation = new database.Connections();
       
        
//        String email = request.getAttribute("email").toString();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        ResultSet result = operation.findAnd(new database.ConditionalData("users","email",email), new database.ConditionalData("users","password",password));
        
        try {
            if(result.next()){
                user.setEmail(result.getString("email"));
                user.setFirstName(result.getString("firstName"));
                user.setLastName(result.getString("lastName"));
                user.setPassword(result.getString("password"));
                user.setTypeOfUser(result.getString("typeOfUser"));
                user.setUserId(result.getString("userId"));
                user.setUsername(result.getString("username"));
                
                RequestDispatcher view = request.getRequestDispatcher("index.html");
                view.forward(request, response);
                
            }
            else{
                response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<p>wrong username or password</p>"
                    + "<a> backhome </a>" );
            
        }
            }
            
            
        } catch (SQLException ex) {
            System.out.println("error in authenticate");
            
        }
        
        
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
