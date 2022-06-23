<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.regex.*,java.util.*,java.sql.*,javax.sql.*,java.awt.image.BufferedImage,java.io.*,javax.imageio.ImageIO,com.mvc.util.DatabaseConnection"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Product</title>
</head>
<body>
<% 
	String productId = (String)request.getParameter("productId");
	try{
		Connection connection = DatabaseConnection.createConnection();
		
		Statement statement=connection.createStatement();
		String deleteQuery = "delete from products where productId = "+productId;
        int executeQuery = statement.executeUpdate(deleteQuery);
        response.sendRedirect("ProductEditList.jsp");
	}
	catch(Exception exception){
		out.println(exception.toString());
	}
%>
</body>
</html>