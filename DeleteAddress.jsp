<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.regex.*,java.util.*,java.sql.*,javax.sql.*,java.awt.image.BufferedImage,java.io.*,javax.imageio.ImageIO,com.mvc.util.DatabaseConnection"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Address</title>
</head>
<body>

<h1>Delete Address</h1>

<% 
	String addressId = (String)request.getParameter("addressId");
	try{
		Connection connection = DatabaseConnection.createConnection();
		
		Statement state=connection.createStatement();
		String deleteQuery = "delete from address where addressId = "+addressId;
        state.executeUpdate(deleteQuery);
        response.sendRedirect("address.jsp");
	}
	catch(Exception exception){
		out.println(exception.toString());
	}
%>


</body>
</html>