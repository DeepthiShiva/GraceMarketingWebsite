
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

	<%
	String emailError = (String) request.getAttribute("emailError");
	String passwordError = (String) request.getAttribute("passwordError");
	String fullError = (String) request.getAttribute("fullError");
	String productId = request.getParameter("productId");
	if (productId != null) {
		session.setAttribute("productIdLogin", productId);
	}
	%>

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">

						<h2 class="text-center">Welcome Back</h2>
						<form class="text-left clearfix" action="LoginServlet"
							method="post">
							<div class="form-group">
								<input type="email" class="form-control" name="email"
									placeholder="Email" required>

								<%
								if (emailError != null) {
									out.println(emailError);
								}
								%>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password"
									placeholder="Password" required>
								<%
								if (passwordError != null) {
									out.println(passwordError);
								}
								%>
							</div>
							<br> <br>
							<div class="text-center">
								<button type="submit" class="btn btn-main text-center">Login</button>
								<%
								if (fullError != null) {
									out.println(fullError);
								}
								%>
							</div>
						</form>
						<br> <span
							style="color: red; font-size: 12px; font-weight: 600;">${adminErrorMessage}</span>
						<span style="color: red; font-size: 12px; font-weight: 600;">${adminError}</span>
						<span style="color: red; font-size: 12px; font-weight: 600;">${userError}</span>
						<p class="mt-20">
							New in this site ?<a href="register.jsp"> Create New Account</a>
						</p>
						<p>
							<a href="forget.jsp"> Forgot your password?</a>
						</p>

					</div>
				</div>
			</div>
		</div>
	</section>

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