<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.util.regex.*,java.util.*,java.sql.*,javax.sql.*,java.awt.image.BufferedImage,java.io.*,javax.imageio.ImageIO,com.mvc.util.DatabaseConnection"%>
 
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Grace Market | The Lubricant store</title>

<!-- Mobile Specific Metas
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator" content="Themefisher Constra HTML Template v1.0">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet" href="plugins/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">

<!-- Animate css -->
<link rel="stylesheet" href="plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="plugins/slick/slick.css">
<link rel="stylesheet" href="plugins/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="./css/style.css">

</head>

<body id="body">

<h1>Edit Address</h1>

<% 
	String addressId = (String)request.getParameter("addressId");
	String fullError = (String)session.getAttribute("fullError");
	session.setAttribute("addressId",addressId);
%>

<%
	if(addressId != null){
		try
	    {
	        Connection connection = DatabaseConnection.createConnection(); 
	        
	        Statement statement = connection.createStatement();
	        ResultSet resultSet = statement.executeQuery("select * from address where addressId='"+addressId+"'");
	        
	        if(resultSet.next())
	        {
	        	String addressLine1 = resultSet.getString("addressLine1");
	        	String addressLine2 = resultSet.getString("addressLine2");
	        	String pincode = resultSet.getString("pincode");
	        	String city = resultSet.getString("city");
	        	String phoneNumber = resultSet.getString("phoneNumber");
	        	String landmark = resultSet.getString("landmark");
	        	String receiverName = resultSet.getString("receiverName");
	            %>
	            
	            
	            
	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">

						<h2 class="text-center">Edit Address</h2>


						<form class="text-left clearfix" action="AddressUpdateServlet"
							method="post">



							<div class="form-group">
								<input type="text" class="form-control" placeholder="Name"
									value="<%=receiverName %>" name="receiverName" required><br>

							</div>
							<div class="form-group">
								<input type="text" name="phoneNumber" value="<%=phoneNumber %>"
									class="form-control" placeholder="Phone Number" required>
								<br>
							</div>
							<div class="form-group">
								<input type="text" value="<%=addressLine1 %>"
									class="form-control" placeholder="Address Line 1"
									name="addressLine1" required><br>
							</div>
							<div class="form-group">
								<input type="text" name="addressLine2"
									value="<%=addressLine2 %>" class="form-control"
									placeholder="Address Line 2" required><br>

							</div>
							<div class="form-group">
								<input type="text" value="<%=landmark %>" class="form-control"
									placeholder="Landmark" name="landmark" required><br>
							</div>
							
							<div class="form-group">
								<input type="text" name="city" value="<%=city %>"
									class="form-control" placeholder="City" required><br>
							</div>
							<div class="form-group">

								<input type="text" name="pincode" value="<%=pincode %>"
									class="form-control" placeholder="Zipcode" required> <br>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-main text-center">Update
									Now</button>
							</div>




						</form>
					</div>
					</div>
					</div>
					</div>
					</section>
	            <%
	            }%>
	            
	          <br>
	    <%}
	    catch(Exception exception){
	        out.print(exception.getMessage());%><br><%
	    }
	}
%>

<%

if(fullError != null){
	out.println(fullError);
}
 
%>
</body>
</html>