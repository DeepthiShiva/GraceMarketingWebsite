<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.regex.*,java.util.*,java.sql.*,javax.sql.*,java.awt.image.BufferedImage,java.io.*,javax.imageio.ImageIO,com.mvc.util.DatabaseConnection"%>
    
    
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
<style>
.box {
	transition: box-shadow .3s;
	width: 300px;
	margin: 70px;
	border-radius: 10px;
	border: 1px solid #dedede;
	background: #fff;
	float: left;
	justify-content: center;
	text-align: center;
	padding-bottom: 10px;
}

.status {
	padding: 25px;
}
</style>
</head>
<body id="body">
<%
	String adminid = (String) session.getAttribute("adminid");
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
						<a href="AdminHome.jsp"> <!-- replace logo here --> <svg
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
						<li class="dropdown "><a href="AdminHome.jsp">Home</a></li>
						<!-- / Home -->


						

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
											<li class="dropdown-header">Product</li>
											<li role="separator" class="divider"></li>
											<!-- 			<li><a href="contact.html">Contact Us</a></li> -->
											<li><a href="ProductUpdate.jsp">Add Product</a></li>
											<li><a href="ProductDelete.jsp">Delete Product</a></li>
											<li><a href="AdminViewProduct.jsp">View Product</a></li>

										</ul>
									</div>

									<!-- Contact -->
									<div class="col-sm-3 col-xs-12">
										<ul>
											<li class="dropdown-header">Dashboard</li>
											<li role="separator" class="divider"></li>
											<li><a href="admin_order.jsp">Order Details</a></li>
											<li><a href="AdminUserDetails.jsp">Customer Details</a></li>
											<li><a href="tableau.jsp">Customer Analytics</a></li>
											<li><a href="OilSaleForeCast.jsp">Sales Forecast</a></li>

										</ul>
									</div>

									<!-- Utility -->
									<div class="col-sm-3 col-xs-12">
										<ul>
											<li class="dropdown-header">Utility</li>
											<li role="separator" class="divider"></li>
											 <li><a href="Logout.jsp">LogOut Page</a></li>
											

											
										</ul>
									</div>

									<!-- Mega Menu -->
									
								</div>
								<!-- / .row -->
							</div>
							<!-- / .dropdown-menu --></li>
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
						<h1 class="page-name">Delete Product</h1>
						<ol class="breadcrumb">
							<li><a href="AdminHome.jsp">Home</a></li>
							<li class="active">product</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	


		<%
		 Connection connect=null;
	       PreparedStatement preparedStatement = null;   
	        try
	        {
	        	connect = DatabaseConnection.createConnection();
        
                Statement statement = connect.createStatement();
                ResultSet resultSet = statement.executeQuery("select * from products;");
        
        int i=0;
        while(resultSet.next())
        {
        	i++;
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

        	//rs.getBlob("productimage")
        	int productId = resultSet.getInt("productId");
        	String stock = resultSet.getString("stock");
        	String productPrice = resultSet.getString("productPrice");
        	String productName = resultSet.getString("productname");
            %>
           <div class="box">
           
				<h4><%=resultSet.getString("productName") %></h4>
				<div>
								<img src="data:image/jpeg;base64,${imgBase}" alt="Image not Displayed" style="height:150px;"/>
			</div>
				<p>Stock : <b><%=stock %></b></p>
				<p>Rs.<%=productPrice %></p>
				<%if(Integer.parseInt(stock) >= 0)
				
				{%>
				  
								
				<a href="ProductDelete.jsp?productId=<%=resultSet.getString("productId") %>" 
			style="background-color: #dedede; color: black; font-weight: bold; display: inline-block; font-size: 11px; letter-spacing: 1px; padding: 14px 35px; text-transform: uppercase; border-radius: 0;">Delete
			</a>
				
				<%
				}else{
					out.println("Out of Stock");
				} %>
			</div>
            <%
            }%>
            <br>
    <%}
    catch(Exception exception){
        out.print(exception.getMessage());%><br><%
    }
    %>
    
    
    
	<footer class="footer section text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<p>? 2022 Grace Marketing. All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script src="plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<!-- Instagram Feed Js -->
	<script src="plugins/instafeed/instafeed.min.js"></script>
	<!-- Video Lightbox Plugin -->
	<script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
	<!-- Count Down Js -->
	<script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

	<!-- slick Carousel -->
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/slick/slick-animation.min.js"></script>

	<!-- Google Mapl -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="js/script.js"></script>


    
</body>
</html>