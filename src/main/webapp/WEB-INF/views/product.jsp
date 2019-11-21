<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">


<title>Products</title>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Rangers Webstore</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="<spring:url value="/" />">Home</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">Add Product</a></li>
				<li><a href="<spring:url value="/product" />">Chart</a></li>
				<li><a href="#">Admin</a></li>
				<li><a style="margin-left: 700px" href="#">Login</a></li>
			</ul>
		</div>
	</nav>
	<section class="container">

		<div class="row">
			<div class="col-md-5">

				<img
					src="<c:url value="${product.photo}"></c:url>"
					alt="image" style="width: 100%" />
			</div>

			<div class="col-md-5">
				<h3>${product.productTitle}</h3>
				<p>${product.description}</p>

				<p>

					<strong>category</strong> : ${product.category}
				</p>

				<h4>${product.price}USD</h4>
				<p>
					 
					</a> <a href="<spring:url value="/" />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span> back
					</a>

				</p>

			</div>
		</div>
		<!--/div-->
	</section>
</body>
</html>
