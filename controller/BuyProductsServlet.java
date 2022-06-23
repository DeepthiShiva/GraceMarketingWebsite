package com.mvc.controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;

import com.mvc.util.DatabaseConnection;

import java.sql.*;

/**
 * Servlet implementation class ProceedBuyProducts
 */
@WebServlet("/BuyProductsServlet")
public class BuyProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = (String)request.getSession().getAttribute("userid");
		
		HashMap<String,String> productMap = (HashMap<String,String>)request.getSession().getAttribute("productMap");
		HashSet<String> productList = (HashSet<String>)request.getSession().getAttribute("productList");
		
		String addressId = request.getParameter("address");
		String payment = request.getParameter("payment");
		String fullError = "";
		
		Connection connection = null;
		if(payment.equals("cod")) {
		try {
			connection = DatabaseConnection.createConnection();
			Statement statement = connection.createStatement();
			String addressQuery = "select * from address where addressId = "+addressId;
			ResultSet addressResult = statement.executeQuery(addressQuery);
			String addressLine1="",addressLine2="",landmark="",pincode="",phoneNumber="",city="",receiverName="";
	        if(addressResult.next() == true) {
	             addressLine1 = addressResult.getString("addressLine1");
	             addressLine2 = addressResult.getString("addressLine2");
	        	 landmark = addressResult.getString("landmark");
	        	 pincode = addressResult.getString("pincode");
	        	 phoneNumber = addressResult.getString("phoneNumber");
	        	 city = addressResult.getString("city");
	        	 receiverName = addressResult.getString("receiverName");
	        	 System.out.println(addressLine1+" "+addressLine2+" "+landmark+" "+pincode+" "+phoneNumber+" "+city+" "+receiverName);
	        }
	        else {
	        	System.out.println("address not inserted");	        
	        }
	        
			for(String productId : productList) {
				String productQuery = "select * from products where productId = "+productId;
				ResultSet productResult = statement.executeQuery(productQuery);
				Blob productImage = null;
				String productName = "",productPrice="";
		        if(productResult.next() == true) {
		             productImage = productResult.getBlob("productImage");
		             productName = productResult.getString("productName");
		             productPrice = productResult.getString("productPrice");
		        }
		        else {
		        	System.out.println("product not inserted");	        
		        }
		        System.out.println("orders pa");
		        String quantity = productMap.get(productId);
		        int total = Integer.valueOf(quantity) * Integer.valueOf(productPrice);
		        String addOrderQuery = "insert into orders(userid,productId,quantity,productPrice,total,addressLine1,addressLine2,landmark,pincode,phoneNumber,city,receiverName,productName,productImage,payment,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				PreparedStatement preparedStatement = connection.prepareStatement(addOrderQuery);
				preparedStatement.setInt(1, Integer.parseInt(userId));
				preparedStatement.setInt(2, Integer.parseInt(productId));
				preparedStatement.setString(3, quantity);
				preparedStatement.setString(4, productPrice);
				preparedStatement.setString(5, String.valueOf(total));
				preparedStatement.setString(6, addressLine1);
				preparedStatement.setString(7, addressLine2);
				preparedStatement.setString(8, landmark);
				preparedStatement.setString(9, pincode);
				preparedStatement.setString(10, phoneNumber);
				preparedStatement.setString(11, city);
				preparedStatement.setString(12, receiverName);
				preparedStatement.setString(13, productName);
				preparedStatement.setBlob(14, productImage);
				preparedStatement.setString(15, payment);
				preparedStatement.setString(16, "waiting");
				
				int executeQuery = preparedStatement.executeUpdate();
				if(executeQuery != 0) {
					fullError = null;
					request.getSession().setAttribute("productList", null);
					request.getSession().setAttribute("productMap", null);
					response.sendRedirect("SuccessPage.jsp");
				}
				
			}
			
		}
		catch(Exception exception) {
			System.out.println(exception.toString());
		}
		}
		else if(payment.equals("cc")) {
			System.out.println("Credit Card Selected");
		}
	}

}
