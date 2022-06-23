<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,java.sql.*,java.io.*,com.mvc.util.DatabaseConnection"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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

								<!-- / Cart Item -->


								<ul class="text-center cart-buttons">
									<li><a href="cartPage.jsp" class="btn btn-small">View
											Cart</a></li>
									<li><a href="ProceedToBuy.jsp"
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
											<li><a href="ProceedToBuy.jsp">Checkout</a></li>
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
											<li><a href="contact.html">Contact Us</a></li>
											<li><a href="about.html">About Us</a></li>

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
											<!-- <li><a href="login.jsp">Login Page</a></li> -->
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
										<a href="shop.html"> <img class="img-responsive"
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
						<h1 class="page-name">Checkout</h1>
						<ol class="breadcrumb">
							<li><a href="indexPage.jsp">Home</a></li>
							<li class="active">checkout</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	

		<div class="page-wrapper">
			<div class="checkout shopping">
				<div class="container">
					<div class="row">
						<div class="col-md-4">
							<div class="product-checkout-details">
								<div class="block">
									<h4 class="widget-title">Order Summary</h4>

									<%
									String userId = (String) session.getAttribute("userid");
									HashMap<String, String> productMap = (HashMap<String, String>) session.getAttribute("productMap");
									HashSet<String> productList = (HashSet<String>) session.getAttribute("productList");
									Connection connection = null;
									System.out.println("Inside proceed " + productMap);
									if (productList == null || productList.isEmpty() == true) {
										out.println("Your Cart is Empty");
									} else {
										int total = 0;
										int shipping=10;
										int shiptot=0;
										try {
											connection = DatabaseConnection.createConnection();
											int stockChecker = 1;
											for (String productId : productList) {
										Statement productStatement = connection.createStatement();
										String productQuery = "select * from products where productId = " + productId;
										ResultSet productResult = productStatement.executeQuery(productQuery);
										if (productResult.next()) {
											Blob blob = productResult.getBlob("productImage");

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

											String productName = productResult.getString("productName");
											
											String stock = productResult.getString("stock");
											String productPrice = productResult.getString("productPrice");
											int quantity = Integer.parseInt(productMap.get(productId));
											int subTotal = quantity * Integer.parseInt(productPrice);
											int shipTotal=(shipping*quantity)+subTotal;
											shiptot=shipping*quantity;
											total += shipTotal;
									%>
									
									<div class="media product-card">
										<a class="pull-left" href="product-single.html"> <img
											class="media-object" src="data:image/jpeg;base64,${imgBase}"
											alt="Image" />
										</a>
										<div class="media-body">
											<h4 class="media-heading">
												<a href="product-single.html"><%=productName%></a>
											</h4>
											<p class="price"><%=quantity%>
												x
												<%=productPrice%>
											</p>
											
										</div>
									</div>

									<ul class="summary-prices">
										<li><span>Shipping:</span> <span class="price">Rs.10 per/ltr</span>
										</li>
									</ul>
								
                          
                       
                        <ul class="summary-prices">
                        <li>
                           <span>Shipping:</span>
                           <span class="price"><%=shiptot%></span>
                        </li>
                        <li>
                           <span>Subtotal:</span>
                           <span><%=shipTotal%></span>
                        </li>
                     </ul>
                        
                        <div class="summary-total">
                        <span>Total</span>
                        <span ><%=total %></span>
                     </div>
							

									<%
									}
									}
									} catch (Exception exception) {
									out.println(exception.toString());
									}
									}
									%>
								</div>
							</div></div>
							
				<a href="address.jsp">
				<button type="submit" class="btn btn-main text-center">Add/Edit Address</button>
			</a>
   <br><br>			
			<div class="col-md-8">
							<div class="block billing-details"> 
							<h4 class="widget-title">Billing Details</h4>			
		<form class="checkout-form" method="post" action="BuyProductsServlet">
     
			<%
			try {
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from address where userid = " + userId);
				System.out.println("Inside address User id is " + userId);
				int radioRequiredSetter = 0;

				while (resultSet.next()) {
					String addressId = resultSet.getString("addressId");
					System.out.println("address ID " + addressId);
					String addressLine1 = resultSet.getString("addressLine1");
					String addressLine2 = resultSet.getString("addressLine2");
					String landmark = resultSet.getString("landmark");
					String pincode = resultSet.getString("pincode");
					String phoneNumber = resultSet.getString("phoneNumber");
					String city = resultSet.getString("city");
					String receiverName = resultSet.getString("receiverName");
					System.out.println("This is " + addressId);
			%>
		 
						
									 <input type="radio" value="<%=addressId %>" name="address" <% if(radioRequiredSetter==0){ out.println("required"); radioRequiredSetter ++; }%>>
									
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
													<p class="form-control"><%=phoneNumber%></p>
										</div>
											<div class="form-group">
										
												<p class="form-control"><%=city%></p>
											</div>
										</div>
										<div class="form-group">
											
											<p class="form-control"><%=pincode%></p>
										</div>
										
								

			

			<%
			}
			%>
			
			<%
			} catch (Exception exception) {
			out.print(exception.getMessage());
			%><br>
			<%
			}
			%>
				<h4 class="widget-title" style="font-weight:bold">Payment Method :</h4>			
			
   <!--  <input type="radio" name="payment" value="cc" style="margin-right:20px;margin-bottom:20px" ><label>Credit Card</label>
    <br>
    <input type="radio" name="payment" value="cod" style="margin-right:20px;margin-bottom:20px"><label>Net Banking</label>
    <br> -->
    <input type="radio" name="payment" value="cod" style="margin-right:20px;margin-bottom:20px" checked><label>Cash on Delivery</label>
	<br><br>
	<input type="submit" class="btn btn-main text-center" value="Place Order">
	
	</form>
	</div>
	</div>
					</div>
				</div>
				
			</div>
			 
		</div>
		
</body>
<footer class="footer section text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<ul class="footer-menu text-uppercase">
					<li><a href="contact.jsp">CONTACT</a></li>
					<li><a href="home.jsp">SHOP</a></li>

				</ul>

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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- Main Js File -->
<script src="js/script.js"></script>

</html>