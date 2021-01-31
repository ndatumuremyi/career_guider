/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paterne
 */
public class Connections {
    String values = "";
    String columns ="";
    
    static Statement statement;
    public Connections(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/career", "scott", "tiger");
            statement = connection.createStatement();
            System.out.print("connection Succed");
        }
        
        catch (ClassNotFoundException | SQLException ex){
            System.out.println("fail to connect to database");
        }
        //return null;
        
    }
    public static Statement getConnection(){
        return statement;
    }
    public boolean executeSet(String query){
        try{
            System.out.println(query);
            statement.executeUpdate(query);
            return true;
        }
        catch (SQLException ex){
            System.out.println(ex);
              //  ex.printStackTrace(System.out);
                
            return false;
        }
    }
    public ResultSet select(String tableName, String... columns){
        /*
        **********************************************************************************************************************
        **********************************************************************************************************************

                    it take tableName and column to return  then  return array with corresponding object type

        **********************************************************************************************************************
        **********************************************************************************************************************
        */
        String query = "select ";
        
        for(String column : columns){
           query += column + ",";
        }
        query = query.substring(0, query.length() - 1);
        query += "from "+tableName + ";";
        try {
            ResultSet output = statement.executeQuery(query);
            return output;
            
        } catch (SQLException ex) {
            Logger.getLogger(Connections.class.getName()).log(Level.SEVERE, null, ex);
            
            System.out.println("fail to get data \n" + query);
            return null;
        }
    }
    public boolean insert(String tableName, ArrayList<String> valiables,ArrayList<String> values){
        /*
    **********************************************************************************************************************
    **********************************************************************************************************************
    
                instert that in TableName with data stored in values arrayList in specified column in valiables array
    
    **********************************************************************************************************************
    **********************************************************************************************************************
    */
        String query="insert into "+tableName+"(";
        query = valiables.stream().map((variable) -> variable+',').reduce(query, String::concat);
            query = query.substring(0, query.length()-1)+ ")values(\"";
            for(String value : values){
                query +=value +"\",\"";
            }
            query = query.substring(0, query.length()-2)+ ");";
            if(executeSet(query)){
                return true;
            }
            else{
                return false;
            }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    public ResultSet executeGet(String query){
        /*
        ***************************************************************************************************************************
        ***************************************************************************************************************************
        
                 this table query then return it result
        
        ***************************************************************************************************************************
        ***************************************************************************************************************************
        */
        ResultSet output = null;
        try{
            output = statement.executeQuery(query);
        }
        catch(SQLException ex){
            System.out.print("fail to select data");
//            ex.printStackTrace(System.out);
        }
        
        return output;
    }
    
    
    
    
    //this most used by save function in table class
    public boolean insert(String tableName, HashMap<String, String> cvalues){
        
        String query="insert into "+tableName+"(";
        
        cvalues.forEach((key, value)->{
            columns += key +",";
            values += value + "\",\"";
        });
        columns = columns.substring(0, columns.length()-1);
        values = values.substring(0, values.length()-2);
        query += columns + ")values(\""+ values + ");";
        
        System.out.println(query);
        
        columns = values = "";
        if(executeSet(query)){
            return true;
        }
        else{
            return false;
        }
        
        
        
        
    }
    
    
    
    
    
    
    public ArrayList selectAll(String tableName){
        /*
        **********************************************************************************************************************
        **********************************************************************************************************************

                    it take tableName then return all data in table then return array with corresponding object type

        **********************************************************************************************************************
        **********************************************************************************************************************
        */

        
        
        
        
        String query = "select * from "+ tableName +";";
        ResultSet output = executeGet(query);
//        ResultSetMetaData metaData = output.getMetaData();
        
        switch (tableName) {
            case "questions":
            {
                
                ArrayList<Questions> result = new ArrayList<>();
                try {
                    while(output.next()){
                        Questions question = new Questions();
                        
//                        question.setAnsId(output.getString("AnsId"));
                        question.setGroup(output.getString("group"));
                        question.setQId(output.getString("qId"));
                        question.setQuestion(output.getString("question"));
                        question.setRiasecType(output.getString("riasecType"));
                        question.setTargetUser(output.getString("targetUser"));
                        result.add(question);
                    }
                    
                    
                    return result;
                } catch (SQLException ex) {
                    Logger.getLogger(Connections.class.getName()).log(Level.SEVERE, null, ex);
                    return null;
                }
            }
            case "results":
            {
                ArrayList<Results> result = new ArrayList<>();
                try {
                    while(output.next()){
                        Results results = new Results();
                        
//                        questions.setBelongInChap(output.getString("BelongInChap"));
                        results.setArtistic(output.getString("artistic"));
                        results.setConventional(output.getString("conventional"));
                        results.setEnterprising(output.getString("enterprising"));
                        results.setInvestigative(output.getString("investigative"));
                        results.setRId(output.getString("rId"));
                        results.setRealistic(output.getString("realistic"));
                        results.setSocial(output.getString("social"));
                        results.setUsername(output.getString("username"));
                        
                        result.add(results);
                        return result;
                    }
                }
                catch( SQLException ex){
                    ex.printStackTrace(System.out);
                    return null;
                }
                
            }
            case "records":
            {
                
                ArrayList<Records> result;
                try {
                    result = new ArrayList<>();
                    while(output.next()){
                        Records record = new Records();
                        
//                        record.setHmId(output.getString("HmId"));
                        record.setOriantation(output.getString("oriantation"));
                        record.setRId(output.getString("rId"));
                        record.setType(output.getString("type"));
                        record.setUsername(output.getString("username"));
                        
                        result.add(record);
                    }
                    return result;
                } catch (SQLException ex) {
                    ex.printStackTrace(System.out);
                    return null;
                }
            }
            case "users":
            {
                ArrayList<Users> result = new ArrayList<>();
            try {
                while(output.next()){
                    Users user =new Users();
                    
//                    user.setCell(output.getString("Cell"));
                    user.setEmail(output.getString("email"));
                    user.setFirstName(output.getString("firstName"));
                    user.setLastName(output.getString("lastName"));
                    user.setPassword(output.getString("password"));
                    user.setTypeOfUser(output.getString("typeOfUser"));
                    user.setUserId(output.getString("userId"));
                    user.setUsername(output.getString("username"));
                    
                    
                    result.add(user);
                }
                return result;
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
                    return null;
            }
            }
            
            default:
            {
                return null;
            }
        }
        
        
        
        
    }
    public ResultSet findOr(ConditionalData... datas)
    {
        
        String query = "select * from ";
        String tables = "";
        String conditions = "";
        
        for(ConditionalData data : datas){
            if(!tables.contains(data.getTableName()))
                tables += data.getTableName() +",";
            conditions += data.getTableName()+'.'+data.getColumnName()+"=\""+data.getValue()+"\" or ";
        }
        tables = tables.substring(0, tables.length()-1);
        conditions = conditions.substring(0, conditions.length()-3);
        query += tables + " where " + conditions +";";
        
        try {
            ResultSet output = statement.executeQuery(query);
            return output;
        } catch (SQLException ex) {
            System.out.println("error in findOr");
//            Logger.getLogger(Connections.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(query);
            return null;
        }
    }
    public ResultSet findAnd(ConditionalData... datas){
        
        String query = "select * from ";
        String tables = "";
        String conditions = "";
        
        for(ConditionalData data : datas){
            if(!tables.contains(data.getTableName()))
                tables += data.getTableName() +",";
            conditions += data.getTableName()+'.'+data.getColumnName()+"=\""+data.getValue()+"\" and ";
        }
        tables = tables.substring(0, tables.length()-1);
        conditions = conditions.substring(0, conditions.length()-4);
        query += tables + " where " + conditions +";";
        
        try {
//            System.out.println(query);
            ResultSet output = statement.executeQuery(query);
            return output;
        } catch (SQLException ex) {
            Logger.getLogger(Connections.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    
   
    
    
    
    public ArrayList selectAll(String tableName, int start, int total){
        /*
        **********************************************************************************************************************
        **********************************************************************************************************************

                    it take tableName then return all data in table then return array with corresponding object type

        **********************************************************************************************************************
        **********************************************************************************************************************
        */

        
        
        
        
        String query = "SELECT * FROM "+ tableName + " LIMIT "+ start +", " + total +" ;";
        ResultSet output = executeGet(query);
//        ResultSetMetaData metaData = output.getMetaData();
        
        switch (tableName) {
            case "questions":
            {
                
                ArrayList<Questions> result = new ArrayList<>();
                try {
                    while(output.next()){
                        Questions question = new Questions();
                        
//                        question.setAnsId(output.getString("AnsId"));
                        question.setGroup(output.getString("group"));
                        question.setQId(output.getString("qId"));
                        question.setQuestion(output.getString("question"));
                        question.setRiasecType(output.getString("riasecType"));
                        question.setTargetUser(output.getString("targetUser"));
                        result.add(question);
                    }
                    
                    
                    return result;
                } catch (SQLException ex) {
                    Logger.getLogger(Connections.class.getName()).log(Level.SEVERE, null, ex);
                    return null;
                }
            }
            case "results":
            {
                ArrayList<Results> result = new ArrayList<>();
                try {
                    while(output.next()){
                        Results results = new Results();
                        
//                        questions.setBelongInChap(output.getString("BelongInChap"));
                        results.setArtistic(output.getString("artistic"));
                        results.setConventional(output.getString("conventional"));
                        results.setEnterprising(output.getString("enterprising"));
                        results.setInvestigative(output.getString("investigative"));
                        results.setRId(output.getString("rId"));
                        results.setRealistic(output.getString("realistic"));
                        results.setSocial(output.getString("social"));
                        results.setUsername(output.getString("username"));
                        
                        result.add(results);
                        return result;
                    }
                }
                catch( SQLException ex){
                    ex.printStackTrace(System.out);
                    return null;
                }
                
            }
            case "records":
            {
                
                ArrayList<Records> result;
                try {
                    result = new ArrayList<>();
                    while(output.next()){
                        Records record = new Records();
                        
//                        record.setHmId(output.getString("HmId"));
                        record.setOriantation(output.getString("oriantation"));
                        record.setRId(output.getString("rId"));
                        record.setType(output.getString("type"));
                        record.setUsername(output.getString("username"));
                        
                        result.add(record);
                    }
                    return result;
                } catch (SQLException ex) {
                    ex.printStackTrace(System.out);
                    return null;
                }
            }
            case "users":
            {
                ArrayList<Users> result = new ArrayList<>();
            try {
                while(output.next()){
                    Users user =new Users();
                    
//                    user.setCell(output.getString("Cell"));
                    user.setEmail(output.getString("email"));
                    user.setFirstName(output.getString("firstName"));
                    user.setLastName(output.getString("lastName"));
                    user.setPassword(output.getString("password"));
                    user.setTypeOfUser(output.getString("typeOfUser"));
                    user.setUserId(output.getString("userId"));
                    user.setUsername(output.getString("username"));
                    
                    
                    result.add(user);
                }
                return result;
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
                    return null;
            }
            }
            
            default:
            {
                return null;
            }
        }
        
        
        
        
    }
}
