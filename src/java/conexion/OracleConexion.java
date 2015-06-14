/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author TOSHIBA
 */
public class OracleConexion {
    
    public static Connection conectar(){
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","adm","adm");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
       return conn;
    }
}
