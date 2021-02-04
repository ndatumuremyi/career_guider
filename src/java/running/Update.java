/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package running;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paterne
 */
public class Update extends HttpServlet {

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
        database.Connections connections = new database.Connections();
        String query = "UPDATE ";
        String operator = request.getParameter("operator");
        String tableName = request.getParameter("tableName");
        if(operator.equals("update")){
            switch(tableName){
            case "users":
            {
                    query += "users SET username = \"" +request.getParameter("username")+"\",password = \""+request.getParameter("password")+
                            "\", firstName = \""+request.getParameter("firstName")+"\", lastName = \""+request.getParameter("lastName")+
                            "\", email = \"" +request.getParameter("email")+"\", typeOfUser = \""+ request.getParameter("typeOfUser")+"\" WHERE userId = \""+request.getParameter("userId")+"\";";
                    if(connections.executeSet(query)){
                        RequestDispatcher view = request.getRequestDispatcher("Admin");

                        view.forward(request, response);
                    }
                    else{
                        PrintWriter out = response.getWriter();
                        out.print(query);
                }
                    break;
            }
            case "questions":
            {
                    query += "questions SET question = \"" +request.getParameter("question")+"\",riasecType = \""+request.getParameter("riasecType")+
                            "\", groupOfQuestion = \""+request.getParameter("groupOfQuestion")+"\", targetUser = \""+request.getParameter("targetUser")+
                            "\" WHERE qId = \""+request.getParameter("qId")+"\";";
                    if(connections.executeSet(query)){
                        RequestDispatcher view = request.getRequestDispatcher("Admin");

                        view.forward(request, response);
                    }
                    else{
                        PrintWriter out = response.getWriter();
                        out.print(query);
                }
                    break;
            }
            case "results":
            {
                    query += "results SET username = \"" +request.getParameter("username")+"\",realistic = \""+request.getParameter("realistic")+
                            "\", social = \""+request.getParameter("social")+"\", investigative = \""+request.getParameter("investigative")+
                            "\", enterprising = \""+request.getParameter("enterprising")+"\", artistic = \""+request.getParameter("artistic")+
                            "\", conventional = \""+request.getParameter("conventional")+
                            "\" WHERE rId = \""+request.getParameter("rId")+"\";";
                    if(connections.executeSet(query)){
                        RequestDispatcher view = request.getRequestDispatcher("Admin");

                        view.forward(request, response);
                    }
                    else{
                        PrintWriter out = response.getWriter();
                        out.print(query);
                }
                    break;
            }
            case "record":
            {
                    query += "records SET username = \"" +request.getParameter("username")+"\",type = \""+request.getParameter("type")+
                            "\", oriantation = \""+request.getParameter("oriantation")+
                            "\" WHERE rId = \""+request.getParameter("rId")+"\";";
                    if(connections.executeSet(query)){
                        RequestDispatcher view = request.getRequestDispatcher("Admin");

                        view.forward(request, response);
                    }
                    else{
                        PrintWriter out = response.getWriter();
                        out.print(query);
                }
                    break;
            }
            
        }
        }
        else if(operator.equals("add")){
            switch(tableName){
            case "users":
            {
                database.Users user = new database.Users();
                user.setEmail(request.getParameter("email"));
                user.setFirstName(request.getParameter("firstName"));
                user.setLastName(request.getParameter("lastName"));
                user.setPassword(request.getParameter("password"));
                user.setTypeOfUser(request.getParameter("typeOfUser"));
                user.setUsername(request.getParameter("username"));
                
                if(user.save()){
                    RequestDispatcher view = request.getRequestDispatcher("Admin");

                        view.forward(request, response);
                }
                
                break;
            }
            case "questions":
            {
                database.Questions question = new database.Questions();
                
                
                question.setQuestion(request.getParameter("question"));
                question.setRiasecType(request.getParameter("riasecType"));
                question.setGroupOfQuestion(request.getParameter("groupOfQuestion"));
                question.setTargetUser(request.getParameter("targetUser"));
                
                
                if(question.save()){
                    RequestDispatcher view = request.getRequestDispatcher("Admin");

                        view.forward(request, response);
                }
                
                break;
            }
            case "results":
            {
                database.Results result = new database.Results();
                
                result.setArtistic(request.getParameter("artistic"));
                result.setConventional(request.getParameter("conventional"));
                result.setEnterprising(request.getParameter("enterprising"));
                result.setInvestigative(request.getParameter("investigative"));
                result.setRealistic(request.getParameter("realistic"));
                result.setSocial(request.getParameter("social"));
                result.setUsername(request.getParameter("username"));
                
                
                if(result.save()){
                    RequestDispatcher view = request.getRequestDispatcher("Admin");

                        view.forward(request, response);
                }
                
                break;
            }
            case "record":
            {
                database.Records record = new database.Records();
                
                record.setOriantation(request.getParameter("oriantation"));
                record.setType(request.getParameter("type"));
                record.setUsername(request.getParameter("username"));
                
                
                if(record.save()){
                    RequestDispatcher view = request.getRequestDispatcher("Admin");

                        view.forward(request, response);
                }
                
                break;
            }
            
        }
        }
        else{
            PrintWriter out  = response.getWriter();
            out.print("vlaue ttribute value have problem");
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
