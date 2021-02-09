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
public class Results extends Table{
    private String rId;
    private String username;
    private String realistic;
    private String social;
    private String investigative;
    private String enterprising;
    private String artistic;
    private String conventional;
    
    
    
    
    private int realisticInt;
    private int socialInt;
    private int investigativeInt;
    private int enterprisingInt;
    private int artisticInt;
    private int conventionalInt;
    
    
    
    
    
    
    private Users user;
    public Results(){
        super.tableName = "results";
        realistic = social = investigative = enterprising = artistic = conventional = "0";
    }
    public Results(String rId,String username,String realistic,String social,String investigative,String enterprising,String artistic,String conventional){
        super.tableName = "results";
        
        this.rId = rId;
        this.username = username;
        this.realistic = realistic;
        this.social = social;
        this.investigative = investigative;
        this.enterprising = enterprising;
        this.artistic = artistic;
        this.conventional = conventional;
        
        cvalues.put("rId", rId);
        cvalues.put("username", username);
        cvalues.put("realistic", realistic);
        cvalues.put("social", social);
        cvalues.put("investigative", investigative);
        cvalues.put("enterprising", enterprising);
        cvalues.put("artistic", artistic);
        cvalues.put("conventional", conventional);
//        cvalues.put("", group);
    }
    public void setRId (String rId){
        cvalues.put("rId", rId);
        this.rId = rId;
        
    }
    public String getRId (){
        return rId;
    }
    public void setUsername (String username){
        this.username = username;
        cvalues.put("username", username);
        
    }
    public String getUsername (){
        return username;
    }
    public void setRealistic (String realistic){
        this.realistic = realistic;
        cvalues.put("realistic", realistic);
        
    }
    public String getRealistic (){
        return realistic;
    }
    public void setSocial (String social){
        cvalues.put("social", social);
        this.social = social;
        
    }
    public String getSocial (){
        return social;
    }
    public void setInvestigative (String investigative){
        cvalues.put("investigative", investigative);
        this.investigative = investigative;
    }
    public String getInvestigative (){
        return investigative;
    }
    public void setEnterprising (String enterprising){
        cvalues.put("enterprising", enterprising);
        this.enterprising = enterprising;
    }
    public String getEnterprising (){
        return enterprising;
    }
    public void setArtistic (String artistic){
        cvalues.put("artistic", artistic);
        this.artistic = artistic;
    }
    public String getArtistic (){
        return artistic;
    }
    public void setConventional (String conventional){
        cvalues.put("conventional", conventional);
        this.conventional = conventional;
    }
    public String getConventional (){
        return conventional;
    }
    public Users getUser(){
        return user;
    }
    public void findUser(){
        ResultSet output = operation.findOr(new ConditionalData("users", "username", this.username));
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
    public String findMaximum(){
        
        this.realisticInt = Integer.parseInt(this.realistic);
        this.artisticInt = Integer.parseInt(this.artistic);
        this.conventionalInt = Integer.parseInt(this.conventional);
        this.enterprisingInt = Integer.parseInt(this.enterprising);
        this.investigativeInt = Integer.parseInt(this.investigative);
        this.socialInt = Integer.parseInt(this.social);
        
        if(realisticInt >= artisticInt && realisticInt >= conventionalInt &&realisticInt >= enterprisingInt && realisticInt >= investigativeInt && realisticInt >= socialInt){
            return "realistic";
        }
        else if(artisticInt >= realisticInt && artisticInt >= conventionalInt &&artisticInt >= enterprisingInt && artisticInt >= investigativeInt && artisticInt >= socialInt){
        
            return "artistic";
        }
        else if(conventionalInt >= artisticInt && conventionalInt >= realisticInt &&conventionalInt >= enterprisingInt && conventionalInt >= investigativeInt && conventionalInt >= socialInt){
         
            return "conventional";
        }
        else if(enterprisingInt >= artisticInt && enterprisingInt >= conventionalInt &&enterprisingInt >= realisticInt && enterprisingInt >= investigativeInt && enterprisingInt >= socialInt){
            return "enterprising";
    }
        else if(investigativeInt >= artisticInt && investigativeInt >= conventionalInt &&investigativeInt >= realisticInt && investigativeInt >= enterprisingInt && investigativeInt >= socialInt){
            return "investigative";
    }
        
        else if(socialInt >= artisticInt && socialInt >= conventionalInt &&socialInt >= realisticInt && socialInt >= investigativeInt && socialInt >= enterprisingInt){
            return "social";
    }
        else{
            return "realistic";
        }
    }
}
