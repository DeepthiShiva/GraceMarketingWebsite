package com.mvc.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import com.mvc.bean.RegisterBean;
import com.mvc.util.DatabaseConnection;


public class RegisterDao {
	
	public static String registerUser(RegisterBean registerUser)
	{
		String userName = registerUser.getUserName();
        String userEmail = registerUser.getEmail();
        String mobile = registerUser.getPhoneNumber();
        String password = registerUser.getPassword();
        
       
        Connection connect=null;
        PreparedStatement preparedStatement= null;
        String checkUserQuery = StringQuery.findUserQuery;
        int findUser=0;
        try {
        
        connect = DatabaseConnection.createConnection();
        Statement statement = connect.createStatement();
        ResultSet resultSet = statement.executeQuery(checkUserQuery);
        while (resultSet.next()) {

        if( userEmail.equals(resultSet.getString(1)))
          {
            findUser++;
          }
        }
        }
        catch(Exception exception)
        {
        System.out.println(exception);
        }
        if(findUser==0) {
        try
        {
        connect = DatabaseConnection.createConnection();
        String insertUserQuery=StringQuery.insertQuery;//"insert into users(username,useremail,userphone,userpassword) values(?,?,?,?)";
        preparedStatement = connect.prepareStatement(insertUserQuery); //Making use of prepared statements here to insert bunch of data
        preparedStatement.setString(1,userName);
        preparedStatement.setString(2,userEmail);
        preparedStatement.setString(3,mobile);
        preparedStatement.setString(4,password);
        preparedStatement.executeUpdate();
        return "SUCCESS";



        }catch(Exception exception){
        System.out.println(exception);
        }
        }
        else {
        return "AlreadyExists";
        }
        return "";
        }
}
	
 


