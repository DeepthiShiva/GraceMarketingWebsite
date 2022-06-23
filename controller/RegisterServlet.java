package com.mvc.controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("1");
		String userName = request.getParameter("userName");
		String phoneNumber = request.getParameter("userPhone");
		String email = request.getParameter("userEmail");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
	    //System.out.println("2");
		RegisterBean registerBean = new RegisterBean();
		
		registerBean.setUserName(userName);
	    registerBean.setEmail(email);
	    registerBean.setPhoneNumber(phoneNumber);
	    registerBean.setPassword(password);
	    
	    
	    
		 
		  
		int validChecker = 0,errorSender=0;
		
		if (userName != null && phoneNumber != null && email != null && password != null && confirmPassword != null)
		{
		
			String regex = "^[a-zA-Z\\s]+"; 			   //name validation
			Pattern pattern = Pattern.compile(regex);
		    Matcher matcher = pattern.matcher(userName);
			if (matcher.matches() == true) {
				validChecker++;
			} 
			else {
				request.setAttribute("nameError", "<br>Name must contain only alphabet....<br>");
				errorSender++;
			}
			
			
		
			int count = 0;									//phone number validation
			
			if (phoneNumber.length() == 10) {
				if(Character.getNumericValue(phoneNumber.charAt(0))<6 || Character.getNumericValue(phoneNumber.charAt(0))>9){
					count++;
				}
				for (int i = 0; i < phoneNumber.length(); i++) {
					if (Character.isDigit(phoneNumber.charAt(i)) == false) {
						count++;
					}
				}
				if (count > 0) {
					request.setAttribute("phoneError", "<br>Your phone number is not valid...<br>");
					errorSender++;
				} 
				else {
					validChecker++;
				}
			} 
			else {
				request.setAttribute("phoneError", "<br>Enter Valid Phone number");
				errorSender++;
			}
		
			
			
			String emailid = "^[a-z0-9.]+@[a-z.]+$";				//Email validation
			Pattern patternmail = Pattern.compile(emailid);
		
			Matcher matchers = patternmail.matcher(email);
			if (matchers.matches() == true) {
				validChecker++;
			} 
			else {
				request.setAttribute("emailError", "<br>Email address format is incorrect <br>");
				errorSender++;
			}
			
			
			
			int upper=0,lower=0,num=0,special=0;					//password validation
			
			if (password.equals(confirmPassword)) {
				if(password.length() >= 8){
					for(int i=0;i<password.length();i++){
						if (password.charAt(i) >= 'A' && password.charAt(i) <= 'Z')
				            upper++;
				        else if (password.charAt(i) >= 'a' && password.charAt(i) <= 'z')
				            lower++;
				        else if (password.charAt(i)>= '0' && password.charAt(i)<= '9')
				            num++;
				        else
				            special++;
					}
					
					if (upper>0 && lower>0 && num>0 && special>0) {
						validChecker++;
					} 
					else {
						String passwordError="";
						if(upper==0){
							passwordError += "<br>Add atlist one Uppercase letter in Passsword";
						}
						if(lower==0){
							passwordError += "<br>Add atlist one Lowercase letter in Passsword";
						}
						if(num==0){
							passwordError += "<br>Add atlist one Number in Passsword";
						}
						if(special==0){
							passwordError += "<br>Add atlist one Special Character in Passsword";
						}
						request.setAttribute("passwordError", passwordError);
						errorSender++;
					}
				}
				else
				{
					request.setAttribute("passwordError", "<br>Password Length must be atlist 8");
					errorSender++;
				}
			}
			else 
			{
				request.setAttribute("passwordError", "<br>Password mismatch");
				errorSender++;
			}

			
		}
		else
		{
			request.setAttribute("fullError", "<br>Enter all the value");
			errorSender++;
		}
		if(errorSender > 0 ) 
		{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Register.jsp");
			requestDispatcher.forward(request, response);
			
			
		}
		else 
		{

		    String isSuccess=RegisterDao.registerUser(registerBean);
		    
		    //System.out.println("success"+isSuccess);
		    if(isSuccess.equals("SUCCESS")) //On success, you can display a message to user on Home page
		    {
		    request.setAttribute("successmessage", "*Successfully Register");
		    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		    rd.include(request, response);
		    /* response.sendRedirect("index.jsp"); */
		    }
		    else //On Failure, display a meaningful message to the User.
		    {
		    request.setAttribute("registererrormessage", "*Inserted fields are already exists");
		    RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
		    rd.include(request, response);
		    }
			

	    }
	    
	}

 
}
