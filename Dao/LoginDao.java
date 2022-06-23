package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Statement;
//import java.sql.ResultSet;

import com.mvc.bean.LoginBean;
import com.mvc.util.DatabaseConnection;


public class LoginDao {
	
	public static String loginUser(LoginBean loginUser)
	{
		String email = loginUser.getEmail();
		String password = loginUser.getPassword();
		
		 Connection connect=null;
	       PreparedStatement preparedStatement = null;   
	        try
	        {
	        	connect = DatabaseConnection.createConnection();
	        	
	        }
	        catch(Exception except)
	        {
	        	System.out.println(except);
	        }
	        try
	        {
	        	
	        	String adminval="admin@gmail.com";
	        	
				if(email.equals(adminval))
				{
					
					String selectQuerycheck = StringQuery.selectQueryCount;
					preparedStatement  = connect.prepareStatement(selectQuerycheck);
					preparedStatement.setString(1, email);
					ResultSet result = preparedStatement.executeQuery();
					
					result.next();
					int mailCount = result.getInt("COUNT");
					
					if(mailCount == 0){
						return "NOTEXISTS";
					}

					else{
						
						String executeUserQuery= StringQuery.selectQuery;
			        	preparedStatement  = connect.prepareStatement(executeUserQuery);
			        	preparedStatement.setString(1, email);
						ResultSet resultSet = preparedStatement.executeQuery();
						
						String finalPassword = "";
						if(resultSet.next())  {
						   	finalPassword = resultSet.getString("password"); 
						}
						
						if(password.equals(finalPassword)){
							
							return "ADMINSUCCESS";
							
							
						}
						else{
							
							return "ADMINERROR";
							
						}
					}
				}
				
				
				else{
					//System.out.println("if user");
					String passwordQuery = StringQuery.passwordQueryCheck;
					PreparedStatement passwordcheck = connect.prepareStatement(passwordQuery);
					passwordcheck.setString(1, email);
					ResultSet result = passwordcheck.executeQuery();

					String finalPassword = "";
					if(result.next())  {
					   	finalPassword = result.getString("password"); 
					}
					
					if(password.equals(finalPassword)){
						String idQuery = StringQuery.idQueryCheck;
						PreparedStatement idcheck = connect.prepareStatement(idQuery);
                        idcheck.setString(1, email);
                        ResultSet resultSetId = idcheck.executeQuery();

                        String finalID = "";
                        if(resultSetId.next())  {
                                   finalID = String.valueOf(resultSetId.getInt("id"));
                        }
                        
                       
                        return "USERSUCCESS"+","+finalID;
					}
					else{
						return "USERERROR";
					}
				}
	        	
	        }
	        catch(SQLException exception)
	        {
	    	  System.out.println(exception);
	        }
	
          return "";  // On failure, send a message from here.
	}
 }

