/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.util.HashMap;

/**
 *
 * @author paterne
 */
public class Table {
    String tableName;
    Connections operation = new Connections();
    HashMap<String, String>cvalues = new HashMap<>();

    public HashMap<String, String> getColValues(){
        return this.cvalues;
    }
    public Boolean save(){
        if(operation.insert(tableName, cvalues)){
            System.out.println("well inserted");
            return true;
        }
        else{
            System.out.println("fail to insert");
            return false;
        }
        

//        if(values.size()==columns.size() ){
//            if(operation.insert(tableName, columns, values)){
//                System.out.println("well inserted");
//            }
//            else{
//                System.out.println("fail to insert");
//            }
//            
//        }
//        else{
//            System.out.print("Error found");
//        }
    }  
}
