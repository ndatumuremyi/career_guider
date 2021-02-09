/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package running;

import database.Connections;
import database.Users;
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
public class Compute extends HttpServlet {
    Connections connection =new  Connections();
    int realistic = 0, investigative = 0, artistic = 0, social = 0,  enterprising = 0, conventional = 0;
    int error = 0;
    int realisticTotal = 0, investigativeTotal = 0, artisticTotal = 0, socialTotal = 0,  enterprisingTotal = 0, conventionalTotal = 0;
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
        HttpSession session = request.getSession(false);
        
        Users user =(Users) session.getAttribute("user");
        
        
        ArrayList<database.Answers> answers = connection.find("answers", "username", user.getUsername());
        answers.forEach((answer) -> {
            answer.findQuestion();           
        });
        
        database.Results result =  new database.Results();
        
        result.setUsername(user.getUsername());
        
        for(database.Answers answer : answers){
            
        
            String type = answer.getQuestion().getRiasecType();
            String groupOfQuestion = answer.getQuestion().getGroupOfQuestion();
            String ans = answer.getAnswers();
            
            if(groupOfQuestion.equals("1")){
                switch(type.toLowerCase()){
                    case "realistic" :
                {
                    if(ans.equals("true")){
                        realistic += 1;
//                        total = Integer.parseInt(result.getRealistic()) + 1;
//                        result.setRealistic(Integer.toString(total));
                    }
                    realisticTotal +=1;
                    break;
                }
                    case "investigative":
                {
                    if(ans.equals("true")){
                        investigative += 1;
                    }
                    investigativeTotal++;
                    break;
                }
                    case "artistic":
                {
                    if(ans.equals("true")){
                        artistic += 1;
                    }
                    artisticTotal++;
                    break;
                }
                    case "social":
                {
                    if(ans.equals("true")){
                        social += 1;
                    }
                    socialTotal++;
                    break;
                }
                    case "enterprising":
                {
                    if(ans.equals("true")){
                        enterprising += 1;
                    }
                    enterprisingTotal++;
                    break;
                }
                    case "conventional":
                {
                    if(ans.equals("true")){
                        conventional += 1;
                    }
                    conventionalTotal++;
                    break;
                }
                    default :
                {
                    error++;
                }
                }
            }
        }
        if(artisticTotal == 0){
            result.setArtistic(Integer.toString(0));
        }
        else{
            result.setArtistic(Integer.toString((artistic*100)/artisticTotal));
        }
        if(conventionalTotal == 0){
            result.setConventional(Integer.toString(0));
        }
        else{
            result.setConventional(Integer.toString(((conventional)*100)/conventionalTotal));
        }
        if(enterprisingTotal == 0){
            result.setEnterprising(Integer.toString(0));
        }
        else{
            result.setEnterprising(Integer.toString(((enterprising)*100)/enterprisingTotal));
        }
        if(investigativeTotal == 0){
            result.setInvestigative(Integer.toString(0));
        }
        else{
            result.setInvestigative(Integer.toString(((investigative)*100)/investigativeTotal));
        }
        if(realisticTotal == 0){
            result.setRealistic(Integer.toString(0));
        }
        else{
            result.setRealistic(Integer.toString(((realistic)*100)/realisticTotal));
        }
        if(socialTotal == 0){
            result.setSocial(Integer.toString(0));
        }
        else{
            result.setSocial(Integer.toString((social*100)/socialTotal));
        }
        
        
        
        
        
        // check for existance 
        
        String query = "select * from results where username = \""+result.getUsername()+"\" ;";
        ResultSet fromTable = connection.executeGet(query);
        
        try {
            if(fromTable.next()){
                query = "DELETE FROM results where username = \""+result.getUsername()+"\" ;"; 
                connection.executeSet(query);
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(Compute.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(result.save()){
            
//            System.out.println("int work");
            request.setAttribute("message", "result are well saved");
            request.setAttribute("result", result);
        }
        
            /* TODO output your page here. You may use following sample code. */
           RequestDispatcher view =  request.getRequestDispatcher("DashBoard");
           
           view.forward(request, response);
//        connection.destroy();
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
