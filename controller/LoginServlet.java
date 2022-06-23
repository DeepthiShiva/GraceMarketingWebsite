package com.mvc.controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String productId = request.getParameter("productId");
		String buynow = request.getParameter("buynow");
		LoginBean loginBean = new LoginBean();
		
		loginBean.setEmail(email);
		loginBean.setPassword(password);
		
		
		
      int validChecker=0,errorsender=0;
		
		if (email != null && password != null)
		{

			String emailid = "^[a-z0-9.]+@[a-z.]+$";
			Pattern patternmail = Pattern.compile(emailid);
		
			Matcher matchers = patternmail.matcher(email);
			if (matchers.matches() == true) {
				validChecker++;
			} 
		}
	    else
			{
				
				request.setAttribute("emailerror", "<br>Email address format is incorrect <br>");
				errorsender++;
			}
		
		if(errorsender > 0 ) 
		{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
			requestDispatcher.forward(request, response);
		}
			
		else
		{
           String isSuccess=LoginDao.loginUser(loginBean);
           String success[]=isSuccess.split(",", 2);
	    
	    
           if(isSuccess.equals("NOTEXISTS")) 
	           {
	        	 request.setAttribute("adminErrorMessage", "*Inserted field not exists");
	 		    RequestDispatcher resultDispatcher = request.getRequestDispatcher("Login.jsp");
	 		    resultDispatcher.include(request, response);
	           }
	         if(isSuccess.equals("ADMINSUCCESS"))
	         {
	        	 response.sendRedirect("AdminHome.jsp");
	         }
	         if(isSuccess.equals("ADMINERROR")) 
	         {
	        	 request.setAttribute("adminError", "*Enter correct Password");
		 		    RequestDispatcher resultDispatcher = request.getRequestDispatcher("Login.jsp");
		 		   resultDispatcher.include(request, response);
	         }
	         if(success[0].equals("USERSUCCESS")) 
	         {
                  request.getSession().setAttribute("userid", success[1]);
                  if(productId != null) {
                	  if(buynow.equals("null") && productId != null) {
							response.sendRedirect("addToCart.jsp?productId="+productId);
						}
						else {
							System.out.println("Inside Login "+productId+buynow);
							response.sendRedirect("addToCart.jsp?productId="+productId+"&buynow=yes");
						}                  }
                  else {
                 	  response.sendRedirect("home.jsp");
                	  
                  }
	        	
	         }
	         
	         if(isSuccess.equals("USERERROR")) 
	         {
	        	 request.setAttribute("userError", "*Enter correct Password");
		 		    RequestDispatcher resultDispatcher = request.getRequestDispatcher("Login.jsp");
		 		   resultDispatcher.include(request, response); 
	         }
	    }
	}

}
