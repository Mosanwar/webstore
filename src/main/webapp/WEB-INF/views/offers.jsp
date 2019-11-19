<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Offers</title>
</head>
<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Rangers Webstore</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Profile</a></li>
			<li><a href="#">Add Product</a></li>
			<li><a href="#">Chart</a></li>
			<li><a href="#">Admin</a></li>
			<li><a href="offers">Offers</a></li>
			<li><a style="margin-left: 700px" href="#">Login</a></li>
		</ul>
	</div>
</nav>

<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="offers">Offers</a>
  <a class="navbar-brand" href="addOffer">Add Offer</a>
</nav>

	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Offers</h1>
				<p>All the available Offers in our store</p>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row">
			<c:forEach items="${offers}" var="product">
				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
					<img src="<c:url value="/resource/images/${offer.product.productId}.png"></c:url>" alt="image"  style = "width:100%"/>
						<div class="caption">
							<h3>${offer.name}</h3>
							<p>${offer.product.description}</p>
							<p>${product.unitPrice}USD</p>
							<p>Available ${product.unitsInStock} units in stock</p>
							<p>
								<a
									href=" <spring:url value="/products/product?id=${product.productId}" /> "
									class="btn btn-primary"> <span
									class="glyphicon-info-sign glyphicon" /></span> Details
								</a>
							</p>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>