<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.regex.*,java.sql.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Address</title>
</head>
<body>
	<h1>Add new Address</h1>
	<%
		String fullError = (String)request.getAttribute("fullError");
	%>
	<form action="AddressCreateServlet" method="post">
	
		<label>Name</label> 
		<input type="text" name="name" required><br>
		<br> <br>
		<label>Phone number</label> 
		<input type="text" name="phonenumber" required><br>
		<br> <br>
		<label>Address line 1</label> 
		<input type="text" name="address1" required><br>
		<br> <br>
		<label>Address line 2</label> 
		<input type="text" name="address2" required><br>
		<br> <br>
		<label>Landmark</label> 
		<input type="text" name="landmark" required><br>
		<br> <br>
		<label>Pincode</label> 
		<input type="text" name="pincode" required><br>
		<br> <br>
		<label>City</label> 
		<input type="text" name="city" required><br>
		<br> <br>
		<input type="submit" value="Add now">
	</form>
	
	<%
		if(fullError != null){
			out.println(fullError);
		}
	%>

	
</body>
</html>