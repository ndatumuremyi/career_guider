/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author paterne
 * 
 * this class will help me to create object that have table name, column name and value
 * that i will use to retrieve data from database with given condition
 */
public class ConditionalData {
    private String tableName;
    private String columnName;
    private String value;
    
    public ConditionalData(){
        tableName = columnName = value = null;
    }
    public ConditionalData(String tableName , String columnName, String value){
        this.tableName = tableName;
        this.columnName = columnName;
        this.value = value;
    }
    public void setTableName(String tableName){
        this.tableName = tableName;
    }
    public String getTableName(){
        return this.tableName;
    }
    public void setColumnName(String columnName){
        this.columnName = columnName;
    }
    public String getColumnName(){
        return this.columnName;
    }
    public void setValue(String value){
        this.value = value;
    }
    public String getValue(){
        return this.value;
    }
    
}
