<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.regex.*,java.util.*,java.sql.*,javax.sql.*,java.awt.image.BufferedImage,java.io.*,javax.imageio.ImageIO,com.mvc.util.DatabaseConnection"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<body>
<% 
	String productId = (String)request.getParameter("productId");
	String userid = (String)session.getAttribute("userid");
	
%>

	<h1>Checkout</h1>
	<a href="home.jsp">Home page</a>
	
	<%
		if(productId != null){

			 Connection connect=null;
		     Statement statement = null;   
		        try
		        {
		        	connect = DatabaseConnection.createConnection();
		        statement  = connect.createStatement();
		        ResultSet resultSet = statement.executeQuery("select * from products where productId = '"+productId+"'");
		        if(resultSet.next() == true){
		        	Blob blob = resultSet.getBlob("productImage");
		            InputStream inputStream = blob.getBinaryStream();
		            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		            byte[] buffer = new byte[4096];
		            int bytesRead = -1;

		            while ((bytesRead = inputStream.read(buffer)) != -1) {
		                    outputStream.write(buffer, 0, bytesRead);
		            }

		            byte[] imageBytes = outputStream.toByteArray();

		            String encode = Base64.getEncoder().encodeToString(imageBytes);
		            request.setAttribute("imgBase", encode);

		        	String stock = resultSet.getString("stock");
		        	String productPrice = resultSet.getString("productPrice");
		        	%>
		        	
		        	
		        	<div style="width:300px;border:2px solid black;padding: 0px 10px 10px 20px;">
		        	<form name="cart_form" action="ProceedToCheckout.jsp" method="post">
						<p style="color:red;font-size:30px;"><%=resultSet.getString("productName") %></p>
						<br>
						<img src="data:image/jpeg;base64,${imgBase}" alt="Image not Displayed" style="height:150px;"/>
						<br>
						<label>Quantity </label><input type="number" id="quantity" name="quantity" min="1" max="<%=stock %>">
						<p style="font-size:20px;">Rs.<%=productPrice %></p>
						
						
                  
						
						<button type="button" onclick="compare()">Buy</button>												
						</form>
					</div>
					
					
					<script>

						function compare(){
							var quantity = parseInt(document.getElementById("quantity").value);
							var stock = parseInt("<%out.print(stock);%>");
							if(quantity > 0 && quantity <= stock){
								document.cart_form.submit();
							}
							else{
								alert("Enter quantity correctly... Please enter quantity within 1 to <%out.print(stock);%>");
							}
						}
						
					</script>
		        	
		        	<%
		        }
			}
			catch(Exception exception){
				out.println(exception.toString());
			}
		}
		String quantity = request.getParameter("quantity");
		String pid = productId;
		if(quantity != null){
			session.setAttribute("quantity", quantity);
			response.sendRedirect("ProceedToBuy.jsp");
		}
		if(productId != null){
			session.setAttribute("productId", productId);
		}
	%>
	
</body>
</html>