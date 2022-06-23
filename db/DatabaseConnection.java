package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class DatabaseConnection {
 public static Connection createConnection()
 {
     Connection connect = null;
     String url = "jdbc:mysql://localhost:3306/lubricant"; //MySQL URL followed by the database name
     String username = "root"; //MySQL user name
     String password = "Deep@123"; //MySQL password
 
      
     try
     {
         try
         {
            Class.forName("com.mysql.cj.jdbc.Driver"); //loading MySQL drivers. This differs for database servers 
         } 
         catch (ClassNotFoundException exception)
         {
            exception.printStackTrace();
         }       
         connect = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
         System.out.println("Printing connection object "+connect);
     } 
     catch (Exception exception) 
     {
    	 System.out.println(exception);
     }   
     return connect; 
 }
}
