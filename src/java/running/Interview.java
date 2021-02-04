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
import javax.servlet.http.HttpSession;

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
        int start = 0;
        int prevStart;
        
        int count = 2;
        int page = 1;
        int totalRows=0;
        int totalPages;
        int prevPage = 1;
        ArrayList<Questions> questions = null;
        ArrayList<Questions> prevQuestions = null;
        
        String answerParameter = null;
        
        HttpSession session = request.getSession(false);
        database.Users user = (database.Users)  session.getAttribute("user");
        ResultSet result = operation.executeGet("SELECT COUNT(*) As nRows FROM questions ;");
        try {
            while (result.next()) {
                totalRows = Integer.parseInt(result.getString("nRows"));
                
            }
            String pageString = request.getParameter("page");
            String prevPageString = request.getParameter("prevPage");
            if(pageString == null && request.getParameter("submit") == null){
                page =1;
            }
            else if(pageString != null && request.getParameter("submit") == null){
                page = Integer.parseInt(pageString);
            }
            else if(prevPageString != null && request.getParameter("submit").equals("next")){
                page = Integer.parseInt(prevPageString) + 1 ;
            }
            else if(prevPageString != null && request.getParameter("submit").equals("prev")){
                page = Integer.parseInt(prevPageString) -1;
            }
            if(prevPageString != null){
                prevPage = Integer.parseInt(prevPageString);
            }
//            else{
//                
//            }
            
            
            start = count * (page - 1);
            prevStart = count*(prevPage - 1);
            
            
            
            if(totalRows >= start){
                questions = operation.selectAll("questions", start, count);
                
            }
            
            if(!(page == 1 && prevPage == 1)){
                prevQuestions = operation.selectAll("questions",prevStart,count);
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Interview.class.getName()).log(Level.SEVERE, null, ex);
        }
        if((start+count) >= totalRows){
                request.setAttribute("isFinalPage", "true");
            }
            else{
                request.setAttribute("isFinalPage", "false");
            }
        
        try{
            String ans;
            for(Questions prevQuestion : prevQuestions ){
            answerParameter = prevQuestion.getQId() + "question";
            ans = request.getParameter(answerParameter);
            
            
            prevQuestion.setAndSaveAnswer(user.getUsername(), ans);
        }
        }catch(NullPointerException e){
            System.out.println();
            System.out.println("null pointer");
        }
        
        String submit = request.getParameter("submit");
        if(submit == null || submit.equals("next") || submit.equals("prev")){
        totalPages = totalRows/count;
        request.setAttribute("questions", questions);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("prevPage", page);
        RequestDispatcher view = request.getRequestDispatcher("Interview.jsp");
        view.forward(request, response);
        }
        else if(submit.equals("finish")){
            RequestDispatcher view = request.getRequestDispatcher("Compute");
            view.forward(request, response);
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
