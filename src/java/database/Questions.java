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
public class Questions extends Table{
    private String qId;
    private String question;
    private String riasecType;
    private String  groupOfQuestion;
    private String targetUser;
    
    private Answers answer;
    
    public Questions(){
        super.tableName = "questions";
    }
    public Questions(String qId,String question,String riasecType, String groupOfQuestion, String targetUser){
        super.tableName = "questions";
        
        cvalues.put("qId", qId);
        cvalues.put("question", question);
        cvalues.put("riasecType", riasecType);
        cvalues.put("groupOfQuestion", groupOfQuestion);
        cvalues.put("targetUser", targetUser);
        
        
        this.qId = qId;
        this.question = question;
        this.riasecType = riasecType;
        this.groupOfQuestion = groupOfQuestion;
        this.targetUser = targetUser;
    }
    public void setQId(String qId){
        cvalues.put("qId", qId);
        
        this.qId = qId;
    }
    public String getQId() {
        return qId;
    }
    public void setQuestion(String question){
        cvalues.put("question", question);
        
        this.question = question;
    }
    public String getQuestion (){
        return question;
    }
    public void setRiasecType(String riasecType){
        cvalues.put("riasecType", riasecType);
        
        this.riasecType = riasecType;
    }
    public String getRiasecType (){
        return riasecType;
    }
    public void setGroupOfQuestion(String groupOfQuestion){
        cvalues.put("groupOfQuestion", groupOfQuestion);
        
        this.groupOfQuestion = groupOfQuestion;
    }
    public String getGroupOfQuestion (){
        return groupOfQuestion;
    }
    public void setTargetUser(String targetUser){
        cvalues.put("targetUser", targetUser);
        
        this.targetUser = targetUser;
    }
    public String getTargetUser (){
        return targetUser;
    }
    public Answers getAnswer(){
        return this.answer;
    }
    public void setAndSaveAnswer(String username, String solution){
        answer = new Answers();
        boolean isAlreadyIn = false;
        ResultSet find = operation.findAnd(new ConditionalData("answers","username",username), new ConditionalData("answers","questions",this.qId));
        try {
            while(find.next()){
                isAlreadyIn = true;
                
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(Questions.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(isAlreadyIn){
            String query = "DELETE FROM answers where username = \""+username +"\" and questions = \""+this.qId +"\" ;";
                operation.executeSet(query);
        }
        answer.setUsername(username);
        answer.setQuestions(this.qId);
        answer.setAnswers(solution);
        
        
        answer.save();
    }
    
    
}
