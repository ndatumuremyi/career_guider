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
public class Users extends Table{
    private String userId;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String typeOfUser;
    
    public Results result;
    public Records record;
    
    
    public Users(){
        super.tableName = "users";
    }
    public Users(String userId,String username,String password,String firstName, String lastName,String email,String typeOfUser){
        super.tableName = "users";
        
        this.userId = userId;
//        cvalues.put("userId", userId);
        
        this.username = username;
        cvalues.put("username", userId);
        
        this.password = password;
        cvalues.put("password", password);
        
        this.firstName = firstName;
        cvalues.put("firstName", firstName);
        
        this.lastName = lastName;
        cvalues.put("lastName", lastName);
        
        this.email = email;
        cvalues.put("email", email);
        
        this.typeOfUser = typeOfUser;
        cvalues.put("typeOfUser", typeOfUser);
        
    }
    public void setUserId (String userId){
        this.userId = userId;
//        cvalues.put("userId", userId);
    }
    public String getUserId (){
        return userId;
    }
    public void setUsername (String username){
        this.username = username;
        cvalues.put("username", username);
    }
    public String getUsername (){
        return username;
    }
    public void setPassword (String password){
        this.password = password;
        cvalues.put("password", password);
    }
    public String getPassword (){
        return password;
    }
    public void setFirstName (String firstName){
        this.firstName = firstName;
        cvalues.put("firstName", firstName);
    }
    public String getFirstName (){
        return firstName;
    }
    public void setLastName (String lastName){
        this.lastName = lastName;
        cvalues.put("lastName", lastName);
    }
    public String getLastName (){
        return lastName;
    }
    public void setEmail (String email){
        this.email = email;
        cvalues.put("email", email);
    }
    public String getEmail (){
        return email;
    }
    public void setTypeOfUser (String typeOfUser){
        this.typeOfUser = typeOfUser;
        cvalues.put("typeOfUser", typeOfUser);
    }
    public String getTypeOfUser (){
        return typeOfUser;
    }
    
    
    
    public void findResults(){
        ResultSet output = operation.findOr(new ConditionalData("results", "username", this.username));
        result = new Results();
        try {
            while(output.next()){
                result.setArtistic(output.getString("artistic"));
                result.setConventional(output.getString("conventional"));
                result.setEnterprising(output.getString("enterprising"));
                result.setInvestigative(output.getString("investigative"));
                result.setRId(output.getString("rId"));
                result.setRealistic(output.getString("realistic"));
                result.setSocial(output.getString("social"));
                result.setUsername(output.getString("username"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Results.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public void findRecords(){
        ResultSet output = operation.findOr(new ConditionalData("records", "username", this.username));
        record = new Records();
        try {
            while(output.next()){
                record.setOriantation(output.getString("oriantation"));
                record.setRId(output.getString("rId"));
                record.setType(output.getString("type"));
                record.setUsername(output.getString("username"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(Results.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    Results getResult(){
        return result;
    }
    Records getRecord(){
        return record;
    }
}
