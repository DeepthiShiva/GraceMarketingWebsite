<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.regex.*,java.util.*,java.sql.*,javax.sql.*,java.awt.image.BufferedImage,java.io.*,javax.imageio.ImageIO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<STYLE>
b.fcc-btn{
     text-color: green;
}
a.button {
    -webkit-appearance: button;
    -moz-appearance: button;
    appearance: button;
    padding: 15px;
    text-align: center;
    text-decoration: none;
    color: initial;
}
</STYLE>
<title>Product Page</title>
</head>
<body>
<h1>Product Page</h1>

   
    

	<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinewatchstore","root","aspire@123");
        
        Statement st=con.createStatement();
        ResultSet resultSet=st.executeQuery("select * from products;");
        int i=0;
        while(resultSet.next())
        {
        	i++;
        	Blob blob = resultSet.getBlob("productimage");

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
        	//rs.getBlob("productimage")
        	
            %>
             <div style="width:300px;border:2px solid black;padding: 0px 10px 10px 20px;">
				<p style="color:red;font-size:30px;text-align:center;"><%=resultSet.getString("productname") %></p>
				<br>
                    <img src="data:image/jpeg;base64,${imgBase}" style="height:150px;padding:50px 50px;" /> <br>
			<p>Stock : <b><%=resultSet.getString("stock") %></b></p>
				
				
				<p style="font-size:20px;">Rs.<%=resultSet.getString("productprice") %></p>
				
			</div>
            <%
            }
            %>
           </tbody>
        </table><br>
    <%
    }
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    %>
    
</body>
</html>