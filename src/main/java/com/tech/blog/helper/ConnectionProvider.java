
package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection()
    {
        
        
         try {
                if(con==null)
                {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","8340");
                }

            } catch (ClassNotFoundException e)
                {
                    System.out.println("Not found Error...");
                } catch (SQLException e) {
                    System.out.println("SQL Error...");
                }
         
         return con;
    }
}
