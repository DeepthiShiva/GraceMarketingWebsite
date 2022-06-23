package com.mvc.dao;

public class StringQuery {
	
	public static String insertQuery = "insert into users(username,useremail,userphone,userpassword) values (?,?,?,?)";
	
	public static String selectQuery = "SELECT adminpassword AS password from admin WHERE adminemail = ?";
	
	public static String selectQueryCount = "SELECT count(adminemail) AS COUNT from admin WHERE adminemail = ?";

	public static String findUserQuery = "SELECT useremail from users";
	
	public static String idQueryCheck = "SELECT userid AS id from users WHERE useremail =?";
	
	public static String addProductQuery = "INSERT INTO products(productname, stock, productprice, productimage) values (?, ?, ?, ?)";
	
	public static String recommendationQuery = "INSERT INTO recommendation(car_name, oil_image, car_model, oil_stock, oil_price) values (?, ?, ?, ?, ?)";
	
	public static String passwordQueryCheck = "SELECT userpassword AS password from users WHERE useremail = ?";
}
