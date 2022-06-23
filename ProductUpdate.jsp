<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<link rel="stylesheet" href="css/style.css">

</head>

<body id="body">


	<%
	String fullError = (String) request.getAttribute("fullError");
	String noErrors = (String) request.getAttribute("noError");
	%>
	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">

						<h2 class="text-center">Add new Product</h2>

						<form action="ProductUpdateServlet" class="text-left clearfix"
							method="post" enctype="multipart/form-data">

							<div class="form-group">

								<input type="text" class="form-control" name="productName"
									placeholder="Product Name" required>
							</div>
							<div class="form-group">

								<input type="file" accept="image/*" name="productImage"
									placeholder="Product Picture" required>
							</div>
							<div class="form-group">

								<input type="number" class="form-control"
									placeholder="Stock Available" name="stock" required>
							</div>
							<div class="form-group">

								<input type="text" class="form-control" name="productPrice"
									placeholder="Price per Litre" required> <br>
									</div>
								
								<!-- <div class="form-group">

								<input type="text" class="form-control" name="productDesp"
									placeholder="Product Description" required>
								<br>
								<div class="form-group">

								<input type="text" class="form-control" name="productRecom"
									placeholder="Recommendation" required> <br>
								<br>
							</div> -->
							<div class="text-center">
								<input type="submit" class="btn btn-main text-center"
									value="Add Now"><br>
							</div>
							
						</form>
						<%
						if (fullError != null) {
							out.println(fullError);
						}
						if (noErrors != null) {
							out.println(noErrors);
						}
						%>
						<br><center><a href="AdminHome.jsp">Back to home</a></center>
						<br> 
						<br>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>