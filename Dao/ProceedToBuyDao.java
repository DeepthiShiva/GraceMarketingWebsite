package com.mvc.dao;

import com.mvc.bean.ProceedToBuyBean;
import java.sql.*;

import com.mvc.util.DatabaseConnection;

public class ProceedToBuyDao {
	public String addOrder(ProceedToBuyBean proceedToBuyBean) {
		
		String fullError="";
		
		String productId = proceedToBuyBean.getProductId();
		String addressId = proceedToBuyBean.getAddressId();
		String userId = proceedToBuyBean.getUserId();
		String quantity = proceedToBuyBean.getQuantity();
		String productPrice = proceedToBuyBean.getProductPrice();
		
		int total = Integer.parseInt(productPrice)*Integer.parseInt(quantity);
		System.out.println(total);
		
		try {
			Connection connection = DatabaseConnection.createConnection();
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
	        
	        String productQuery = "select * from products where productId = "+productId;
			ResultSet productResult = statement.executeQuery(productQuery);
			Blob productImage = null;
			String productName = "";
	        if(productResult.next() == true) {
	             productImage = productResult.getBlob("productImage");
	             productName = productResult.getString("productName");
	        }
	        else {
	        	System.out.println("product not inserted");	        
	        }
	        
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
			preparedStatement.setString(15, "cod");
			preparedStatement.setString(16, "waiting");
			
			int executeQuery = preparedStatement.executeUpdate();
			if(executeQuery != 0) {
				fullError = null;
			}
		}
		catch(Exception exception) {
			fullError += "<br>"+exception.toString();
			System.out.println(exception.toString());
		}
		
		return fullError;
	}
}
