<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/cart.js"/>"></script>

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
			<security:authorize access="isAuthenticated()">
				<li><a href="profile">Profile</a></li>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<li><a href="addProduct">Add Product</a></li>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="admin">Admin</a></li>
			</security:authorize>
			<li><a href="offers">Offers</a></li>
			<security:authorize access="isAnonymous()">
				<li><a style="margin-left: 700px" href="<spring:url value="/login" />">Login</a></li>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<li>Logged in by: <security:authentication property="principal.username" /></li>
			</security:authorize>
		</ul>
	</div>
</nav>
 	<section class="container" >
	
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
					<a href="#" class="btn btn-warning btn-large" onclick="addToCart('${product.id}')">
						<span class="glyphicon-shopping-cart glyphicon"></span> Order Now </a>
					<a href="<spring:url value="/cart" />" class="btn btn-default">
						<span class="glyphicon-hand-right glyphicon"></span> View Cart
					</a>
					 
					</a> <a href="<spring:url value="/" />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span> back
					</a>

				</p>

			</div>
		</div>
		<div style="display: none" id="successAlert" class="alert alert-success">
			<strong>Success!</strong>Product Successfully added to the cart.
		</div>
		<!--/div-->
	</section>
</body>
</html>
