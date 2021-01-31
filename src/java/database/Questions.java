/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author paterne
 */
public class Questions extends Table{
    private String qId;
    private String question;
    private String riasecType;
    private String  group;
    private String targetUser;
    
    Questions(){
        super.tableName = "questions";
    }
    Questions(String qId,String question,String riasecType, String group, String targetUser){
        super.tableName = "questions";
        
        cvalues.put("qId", qId);
        cvalues.put("question", question);
        cvalues.put("riasecType", riasecType);
        cvalues.put("group", group);
        cvalues.put("targetUser", targetUser);
        
        
        this.qId = qId;
        this.question = question;
        this.riasecType = riasecType;
        this.group = group;
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
    public void setGroup(String group){
        cvalues.put("group", group);
        
        this.group = group;
    }
    public String getGroup (){
        return group;
    }
    public void setTargetUser(String targetUser){
        cvalues.put("targetUser", targetUser);
        
        this.targetUser = targetUser;
    }
    public String getTargetUser (){
        return targetUser;
    }
    
    
}
