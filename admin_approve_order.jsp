<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.sql.Blob,java.io.ByteArrayOutputStream,java.util.Base64,java.io.InputStream,java.awt.image.BufferedImage,javax.imageio.ImageIO,com.mvc.util.DatabaseConnection"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approve Order</title>
</head>
<body>
<%

	String orderId = request.getParameter("orderid");
	if(orderId != null){
		try{
			Connection connection = DatabaseConnection.createConnection();
			String updateQuery = "update orders set status='approved' where orderid = "+orderId;
			
			Statement statement = connection.createStatement();

			int updateOrder=statement.executeUpdate(updateQuery);
	        response.sendRedirect("admin_order.jsp");
		}
		catch(Exception exception){
			System.out.println(exception.toString());
		}
	}

%>
</body>
</html>