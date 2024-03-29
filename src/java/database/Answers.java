/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paterne
 */
public class Answers extends Table {
    private String anId;
    private String username;
    private String questions;
    private String answers;
    
    private Users user;
    private Questions question;
    
    public Answers(){
        super.tableName = "answers";
    }
    public Answers(String anId,String username,String questions,String answers){
        super.tableName = "answers";
        
        this.anId=anId;
//        cvalues.put("ansId", anId);
        this.username = username;
        cvalues.put("username", username);
        
        this.questions = questions;
        cvalues.put("questions", questions);
        
        this.answers = answers;
        cvalues.put("answers", answers);
    }
    public String getAnId (){
        return anId;
    }
    public void setAnId(String anId){
        this.anId = anId;
    }
    public String getUsername (){
        return username;
    }
    public void setUsername(String username){
        this.username = username;
        cvalues.put("username", username);
    }
    public String getQuestions (){
        return questions;
    }
    public void setQuestions(String questions){
        this.questions = questions;
        cvalues.put("questions", questions);
    }
    public String getAnswers (){
        return answers;
    }
    public void setAnswers(String answers){
        this.answers = answers;
        cvalues.put("answers", answers);
    }
    public Users getUser(){
        return this.user;
    }
    public Questions getQuestion(){
        return this.question;
    }
    public void findUser(){
        ResultSet output = operation.findOr(new ConditionalData("users", "username", this.username));
        user = new Users();
        try {
            while(output.next()){
                user.setEmail(output.getString("email"));
                user.setFirstName(output.getString("firstName"));
                user.setPassword(output.getString("password"));
                user.setTypeOfUser(output.getString("typeOfUser"));
                user.setUserId(output.getString("userId"));
                user.setUsername(output.getString("username"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Results.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void findQuestion(){
        ResultSet output = operation.findOr(new ConditionalData("questions", "qId", this.questions));
        question = new Questions();
        try {
            while(output.next()){
                question.setQId(output.getString("qId"));
                question.setGroupOfQuestion(output.getString("groupOfQuestion"));
                question.setQuestion(output.getString("question"));
                question.setRiasecType(output.getString("riasecType"));
                question.setTargetUser(output.getString("targetUser"));
                question.setNameOfGroup(output.getString("nameOfGroup"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Results.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
