/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package running;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paterne
 */
public class TestInCmd {
    public static void main(String args[]){
        database.Connections connection = new database.Connections();
        ResultSet result = connection.findAnd(new database.ConditionalData("users", "email", "paternenught@gmail.com"), new database.ConditionalData("users", "password", "paterne"));
        try {
            while(result.next()){
                System.out.println(result.getString("email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TestInCmd.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
