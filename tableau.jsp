
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="java.util.regex.*,java.util.*,java.sql.*,javax.sql.*,java.awt.image.BufferedImage,java.io.*,javax.imageio.ImageIO, com.mvc.util.DatabaseConnection"%>
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
							<a href="mailto:contact@gracemarketing.in"
								class="tf-ion-android-mail" style="color: grey">contact@gracemarketing.in</a>
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
						<h1 class="page-name">Customer Analytics</h1>
						<ol class="breadcrumb">
							<li><a href="AdminHome.jsp">Home</a></li>
							<li class="active">Dealer/Non-Dealer</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<div class='tableauPlaceholder' id='viz1655189000606'
		style='position: relative'>
		<noscript>
			<a href='#'><img alt='Dashboard 1 '
				src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Oi&#47;OilTypeAreaWise_16485600204510&#47;Dashboard1&#47;1_rss.png'
				style='border: none' /></a>
		</noscript>
		<object class='tableauViz' style='display: none;'>
			<param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' />
			<param name='embed_code_version' value='3' />
			<param name='site_root' value='' />
			<param name='name'
				value='OilTypeAreaWise_16485600204510&#47;Dashboard1' />
			<param name='tabs' value='no' />
			<param name='toolbar' value='yes' />
			<param name='static_image'
				value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Oi&#47;OilTypeAreaWise_16485600204510&#47;Dashboard1&#47;1.png' />
			<param name='animate_transition' value='yes' />
			<param name='display_static_image' value='yes' />
			<param name='display_spinner' value='yes' />
			<param name='display_overlay' value='yes' />
			<param name='display_count' value='yes' />
			<param name='language' value='en-US' />
		</object>
	</div>
	<script type='text/javascript'>
		var divElement = document.getElementById('viz1655189000606');
		var vizElement = divElement.getElementsByTagName('object')[0];
		if (divElement.offsetWidth > 800) {
			vizElement.style.width = '100%';
			vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px';
		} else if (divElement.offsetWidth > 500) {
			vizElement.style.width = '100%';
			vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px';
		} else {
			vizElement.style.width = '100%';
			vizElement.style.height = '1377px';
		}
		var scriptElement = document.createElement('script');
		scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';
		vizElement.parentNode.insertBefore(scriptElement, vizElement);
	</script>
</body>
</html>