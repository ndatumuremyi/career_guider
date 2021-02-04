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
public class Records extends Table{
    private String rId;
    private String username;
    private String type;
    private String oriantation;
    
    private Users user;
    public Records(){
        super.tableName = "records";
    }
    public Records(String rId, String username, String type, String oriantation){
        super.tableName = "records";
        
        this.rId = rId;
        this.username = username;
        this.type = type;
        this.oriantation = oriantation;
        
        cvalues.put("rId", rId);
        cvalues.put("username", username);
        cvalues.put("type", type);
        cvalues.put("oriantation", oriantation);
        
    }
    public void setRId (String rId){
        cvalues.put("rId", rId);
        
        this.rId = rId;
        
    }
    public String getRId(){
        return rId;
    }
    public void setUsername (String username){
        cvalues.put("username", username);
        
        this.username = username;
    }
    public String getUsername(){
        return username;
    }
    public void setType (String type){
        cvalues.put("type", type);
        this.type = type;
    }
    public String getType(){
        return type;
    }
    public void setOriantation (String oriantation){
        cvalues.put("oriantation", oriantation);
        
        this.oriantation = oriantation;
    }
    public String getOriantation(){
        return oriantation;
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
            Logger.getLogger(Records.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
