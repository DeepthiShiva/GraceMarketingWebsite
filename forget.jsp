<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.regex.*, java.sql.*,javax.sql.*"%>

<!DOCTYPE html>
<html>
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
	<section class="forget-password-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 class="text-center">Welcome Back</h2>

						<form class="text-left clearfix" action="forget.jsp" method="post">

							<h2>FORGOT PASSWORD</h2>
							<p>Please enter the email address for your account. 
								</p>
							<div class="form-group">
								
								<input type="email" name="emailid" class="form-control"  placeholder="Account email address"><br>
								
								<input type="tel" name="phno"  class="form-control" placeholder="Phone Number">
								</div>
								<br> 
								         <div class="text-center">
								<input type="submit"  class="btn btn-main text" value="Request password reset">
									</div>
						</form>
						 <p class="mt-20"><a href="login.jsp">Back to log in</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<%
	String email = request.getParameter("emailid");
	String phoneNumber = request.getParameter("phno");
 if (phoneNumber != null && email != null )
	 {
	 int Checker=0;
	{
	    String mailid = "^[a-z0-9.]+@[a-z.]+$";                          
	    Pattern patternmail = Pattern.compile(mailid);
	 
	   
	      Matcher matchers = patternmail.matcher(email);
	      if(matchers.matches() == true)
	      {
	    	  out.println("<br>Email:<br> " +email);
	    	  Checker++;
	    	  
	      }
	      else
	      {
	 out.println("<br>Email address format is incorrect <br>");
	      }
	  

	int count=0;

	  if(phoneNumber.length()==10)
	   {
		  if(Character.getNumericValue(phoneNumber.charAt(0))<6 || Character.getNumericValue(phoneNumber.charAt(0))>9)
		  {
			  count++;
		  }
	       for(int i=0;i<phoneNumber.length();i++)
	 {

	    if(Character.isDigit(phoneNumber.charAt(i)) == false )
	       {
	          count++;
	       }
	 }  
	    if(count>0)
	 {
	     out.println("<br>Phone number is not valid...<br>");
	    

	 }
	    else
	 {
	      out.println("<br>Phone Number:<br>" +phoneNumber);
	      Checker++;
	 }
	   }
	   else
	    {
	      out.println("Enter valid phone Number....<br>");
	   }
	}
	if(Checker>0)
	{

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lubricant", "root", "Deep@123");

		String queryCheck = "SELECT count(*) AS COUNT from users WHERE useremail = ?";
		PreparedStatement ps = con.prepareStatement(queryCheck);
		ps.setString(1, email);
		ResultSet resultSet = ps.executeQuery();

		resultSet.next();
		int mailCount = resultSet.getInt("COUNT");

		if (mailCount == 0) {
			out.println("<br>Email not exist");
		}

		else {
			String phoneQuery = "SELECT userphone AS phone from users WHERE useremail = ?";
			PreparedStatement pcheck = con.prepareStatement(phoneQuery);
			pcheck.setString(1, email);
			ResultSet rs = pcheck.executeQuery();

			String finalPhone = "";
			if (rs.next()) {
		finalPhone = rs.getString("phone");
			}

			if (phoneNumber.equals(finalPhone)) {
		session.setAttribute("useremail", email);
		response.sendRedirect("reset.jsp");
			} else {
		out.println("<br>Phone Number is Incorrect");
			}
		}
	} catch (Exception excep) {
		out.println("<br>Database error");
	}
	}
	 }
	%>




</body>
</html>