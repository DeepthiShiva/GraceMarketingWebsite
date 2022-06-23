package com.mvc.controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;
/**
 * Servlet implementation class AddressServlet
 */
@WebServlet("/AddressCreateServlet")
public class AddressCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String receivername = request.getParameter("name");
		String phonenumber = request.getParameter("phonenumber");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String landmark = request.getParameter("landmark");
		String pincode = request.getParameter("pincode");
		String city = request.getParameter("city");
		
		int errorSender=0;
		String userid = (String)request.getSession().getAttribute("userid");
		

		RequestDispatcher rd = request.getRequestDispatcher("AddAddress.jsp");
		
		
		if(receivername!= null && phonenumber!=null && address1!=null && address2!=null && landmark!=null && pincode!=null && city!=null){

			try{

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lubricant","root","Deep@123");
				
				Statement state=con.createStatement();
		        state.executeUpdate("insert into address(userid,receiverName,phoneNumber,addressLine1,addressLine2,landmark,pincode,city)values('"+userid+"','"+receivername+"','"+phonenumber+"','"+address1+"','"+address2+"','"+landmark+"','"+pincode+"','"+city+"')");
				response.sendRedirect("address.jsp");
			}
			catch(Exception e){
				request.setAttribute("fullError", "<br>"+e.toString());
				errorSender++;
			}
		}
		if(errorSender >0) {
			rd.forward(request, response);
		}
		
		
	}

}
