<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,java.sql.*,com.mvc.util.DatabaseConnection,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<link rel="stylesheet" href="css/style.css">
</head>
<body id="body">
	<%
	String userid = (String) session.getAttribute("userid");
	%>

	<!-- Start Top Header Bar -->
	<section class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-xs-12 col-sm-4">
					<div class="contact-number">
						<i class="tf-ion-ios-telephone"></i> <span>98426 99336</span>
						<p>
							<a href="mailto:contact@gracemarketing.in" class="tf-ion-android-mail" style="color: grey">contact@gracemarketing.in</a>
						</p>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 col-sm-4">
					<!-- Site Logo -->
					<div class="logo text-center">
						<a href="indexPage.jsp"> <!-- replace logo here --> <svg
								width="135px" height="29px" viewBox="0 0 155 29" version="1.1"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink">
							<g id="Page-1" stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd" font-size="40"
									font-family="AustinBold, Austin" font-weight="bold">
								<g id="Group" transform="translate(-108.000000, -297.000000)"
									fill="#000000">
									<text id="AVIATO">
										<tspan x="108.94" y="325">GRACE</tspan>
									</text>
								</g>
							</g>
						</svg>
						</a>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 col-sm-4">
					<!-- Cart -->
					<ul class="top-menu text-right list-inline">
						<li class="dropdown cart-nav dropdown-slide"><a href="#!"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown"><i class="tf-ion-android-cart"></i>Cart</a>
							<div class="dropdown-menu cart-dropdown">
								<!-- Cart Item -->

								<ul class="text-center cart-buttons">
									<li><a href="cart.html" class="btn btn-small">View
											Cart</a></li>
									<li><a href="checkout.html"
										class="btn btn-small btn-solid-border">Checkout</a></li>
								</ul>
							</div></li>
						<!-- / Cart -->



					</ul>
					<!-- / .nav .navbar-nav .navbar-right -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Top Header Bar -->



	<!-- Main Menu Section -->
	<section class="menu">
		<nav class="navbar navigation">
			<div class="container">
				<div class="navbar-header">
					<h2 class="menu-title">Main Menu</h2>
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>
				<!-- / .navbar-header -->

				<!-- Navbar Links -->
				<div id="navbar" class="navbar-collapse collapse text-center">
					<ul class="nav navbar-nav">

						<!-- Home -->
						<li class="dropdown "><a href="indexPage.jsp">Home</a></li>
						<!-- / Home -->


						<!-- Elements -->
						<li class="dropdown dropdown-slide"><a href="#!"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-delay="350" role="button"
							aria-haspopup="true" aria-expanded="false">Shop <span
								class="tf-ion-ios-arrow-down"></span></a>
							<div class="dropdown-menu">
								<div class="row">

									<!-- Basic -->
									<div class="col-lg-6 col-md-6 mb-sm-3">
										<ul>
											<li class="dropdown-header"></li>
											<li><a href="home.jsp">Shop</a></li>
											<li><a href="checkout.html">Checkout</a></li>
											<li><a href="cartPage.jsp">Cart</a></li>



										</ul>
									</div>


								</div>
								<!-- / .row -->
							</div> <!-- / .dropdown-menu --></li>
						<!-- / Elements -->


						<!-- Pages -->
						<li class="dropdown full-width dropdown-slide"><a href="#!"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-delay="350" role="button"
							aria-haspopup="true" aria-expanded="false">Pages <span
								class="tf-ion-ios-arrow-down"></span></a>
							<div class="dropdown-menu">
								<div class="row">

									<!-- Introduction -->
									<div class="col-sm-3 col-xs-12">
										<ul>
											<li class="dropdown-header">Introduction</li>
											<li role="separator" class="divider"></li>
											<li><a href="contact.jsp">Contact Us</a></li>
											<li><a href="about.jsp">About Us</a></li>

										</ul>
									</div>

									<!-- Contact -->
									<div class="col-sm-3 col-xs-12">
										<ul>
											<li class="dropdown-header">Dashboard</li>
											<li role="separator" class="divider"></li>

											<li><a href="order.jsp">Orders</a></li>
											<li><a href="address.jsp">Address</a></li>

										</ul>
									</div>

									<!-- Utility -->
									<div class="col-sm-3 col-xs-12">
										<ul>
											<li class="dropdown-header">Utility</li>
											<li role="separator" class="divider"></li>
											<%
											if (userid != null) {
												out.println("<li><a href='Logout.jsp'>Logout Page</a></li>");

											} else {
												out.println("<li><a href='Login.jsp'>Login Page</a></li>");

											}
											%>
											<li><a href="register.jsp">Signin Page</a></li>
											<li><a href="forget.jsp">Forget Password</a></li>
										</ul>
									</div>

									<!-- Mega Menu -->
									<div class="col-sm-3 col-xs-12">
										<a href="home.jsp"> <img class="img-responsive"
											src="img/logo.jpg" alt="menu image" />
										</a>
									</div>
								</div>
								<!-- / .row -->
							</div> <!-- / .dropdown-menu --></li>
						<!-- / Pages -->




					</ul>
					<!-- / .nav .navbar-nav -->

				</div>
				<!--/.navbar-collapse -->
			</div>
			<!-- / .container -->
		</nav>
	</section>

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Address</h1>
						<ol class="breadcrumb">
							<li><a href="indexPage.jsp">Home</a></li>
							<li class="active">address</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>


	
	<a href="AddAddress.jsp" style="background-color:#dedede;
  text-color: black;
  display: inline-block;
  font-size: 11px;
  letter-spacing: 1px;
  padding: 14px 35px;
  text-transform: uppercase;
  font-weight: bold;
  border-radius: 0;" >Add New Address</a><br><br>
	
	<%
		
    try
    {
        Connection connection = DatabaseConnection.createConnection(); 
        
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from address where userid='"+userid+"'");
        
        while(resultSet.next())
        {
        	int addressId = resultSet.getInt("addressId");
        	String addressLine1 = resultSet.getString("addressLine1");
        	String addressLine2 = resultSet.getString("addressLine2");
        	String pincode = resultSet.getString("pincode");
        	String city = resultSet.getString("city");
        	String phoneNumber = resultSet.getString("phoneNumber");
        	String landmark = resultSet.getString("landmark");
        	String receiverName = resultSet.getString("receiverName");
            %>
                <div style="width:800px; border:1px solid #dedede; padding: 0px 10px 10px 20px;">
				
					<div class="page-wrapper">
			 <div class="checkout shopping"> 
					<div class="container">
				 		<div class="row"> 
							<div class="col-md-8">
							<div class="block billing-details"> 
								<h4 class="widget-title">Address Details</h4>								 
									<form class="checkout-form">
										<div class="form-group">
											<!-- <label for="full_name">Full Name</label>  -->
											<p class="form-control"><%=receiverName%></p>
											
											
										</div>
										<div class="form-group">
											<!-- <label for="user_address">Address 1</label>  -->
											<p class="form-control"><%=addressLine1%></p>
												
										</div>
										<div class="form-group">
											<!-- <label for="user_address">Address 2</label>  -->
											<p class="form-control"><%=addressLine2%></p>
										</div>
										<div class="checkout-country-code clearfix">
											<div class="form-group">
												<!-- <label for="user_post_code">Landmark</label> -->
												<p class="form-control"><%=landmark%></p>
											</div>
											<div class="form-group">
											<!-- <label for="user_address">Phone Number</label>  -->
											<p class="form-control"><%=phoneNumber%></p>
										</div>
											<div class="form-group">
											<!-- 	<label for="user_city">City</label>  -->
												<p class="form-control"><%=city%></p>
											</div>
										</div>
										<div class="form-group">
											<!-- <label for="user_country">Zip Code</label>  -->
											<p class="form-control"><%=pincode%></p>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				
				<a href="DeleteAddress.jsp?addressId=<%=resultSet.getString("addressId") %>" >
				<button type="submit" style="background: #000; color: #fff; display: inline-block;font-size: 11px; letter-spacing: 1px;
 				 padding: 14px 35px; text-transform: uppercase;font-weight: 200;border-radius: 0;" >Delete</button>
				</a>
				
				
				
				
				
				<a href="EditAddress.jsp?addressId=<%=resultSet.getString("addressId") %>" >
				<button type="submit" class="btn btn-main pull-right"  >Edit</button>
				</a><br><br>
				
			</div>
	
			
	
            <%
            }%>
            
          <br>
    <%}
    catch(Exception exception){
        out.print(exception.getMessage());%><br><%
    }
    %>
	
	
	
	
	 <a href="ProceedToBuy.jsp" style="background-color:#dedede;
 color: black;
  font-weight: bold;
  display: inline-block;
  font-size: 11px;
  letter-spacing: 1px;
  padding: 14px 35px;
  text-transform: uppercase;
  font-weight: bold;
  border-radius: 0;" value="Proceed To Pay">Proceed To Pay	
		         </a>
</body>
</html>