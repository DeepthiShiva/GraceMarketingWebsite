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

	<%
	String email = session.getAttribute("useremail").toString();
	%>

	<section class="forget-password-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 class="text-center">Welcome Back</h2>

						<form class="text-left clearfix" action="reset.jsp" method="post">
						 <p>Please enter the email address for your account.</p>
						 
						 <div class="form-group">
							<input type="password" name="adpassword" class="form-control"  placeholder="New Password"><br>
							<br> <input type="password" name="cpassword" class="form-control"  placeholder="Confirm Password"><br>
								</div>
								  <div class="text-center">
							<br> <input type="submit"  class="btn btn-main text" value="Confirm">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%
	String password = request.getParameter("adpassword");
	String cpassword = request.getParameter("cpassword");
	int Check = 0;
	if (password != null && cpassword != null) {

		int upper = 0, lower = 0, num = 0, special = 0;
		out.println("<br>***" + password + " " + cpassword + "***");
		if (password.equals(cpassword)) {
			if (password.length() >= 8) {
		for (int i = 0; i < password.length(); i++) {
			if (password.charAt(i) >= 'A' && password.charAt(i) <= 'Z')
				upper++;
			else if (password.charAt(i) >= 'a' && password.charAt(i) <= 'z')
				lower++;
			else if (password.charAt(i) >= '0' && password.charAt(i) <= '9')
				num++;
			else
				special++;
		}

		if (upper > 0 && lower > 0 && num > 0 && special > 0) {
			Check++;
			out.println("<br>correct password ");
		} else {
			if (upper == 0) {
				out.println("<br>Add atlist one Uppercase letter in Password");
			}
			if (lower == 0) {
				out.println("<br>Add atlist one Lowercase letter in Password");
			}
			if (num == 0) {
				out.println("<br>Add atlist one Number in Password");
			}
			if (special == 0) {
				out.println("<br>Add atlist one Special Character in Password");
			}
		}
			} else {
		out.println("<br>Password Length must be atlist 8");
			}
		} else {
			out.println("<br>Password mismatch");
		}

		if (Check != 1) {
			out.println("<br>Not inserted error");
		} else {
			try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lubricant", "root", "Deep@123");

		Statement state = con.createStatement();
		int i = state.executeUpdate(
				"update users SET userpassword= '" + password + "' WHERE useremail='" + email + "' ");

		out.println("<br><br>" + password + "");
		out.println("<br>Connection Success");
		response.sendRedirect("Login.jsp");

			} catch (Exception e) {
		out.println("Database error");
			}

		}
	}
	%>
</body>
</html>