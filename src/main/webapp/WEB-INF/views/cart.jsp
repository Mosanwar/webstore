<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resource/js/cart.js"/>"></script>

<title>Cart</title>
<style type="text/css">@import url("<c:url value="/resource/css/cart.css"/>");</style>
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
	<section>
 			<div id="prod" class="container"  >
   			     <div id="result" style="display:none" > </div>
			</div>
 	</section>	

 	<section class="container" >
		<div>


			<table class="table table-striped table-hover">
				<tr>
					<th style="padding: 20px">---ID---</th>
					<th style="padding: 20px">Name</th>
					<th style="padding: 20px">Unit price</th>
					<th style="padding: 20px">Quantity</th>
					<th style="padding: 20px">Price</th>
					<th style="padding: 20px">Action</th>
				</tr>
			</table>
			<table id="cart_table" class="table table-hover">

				<c:forEach  var="item" items ="${cart.cartItems}" >
					<tr>
						<td style="text-align: center;padding: 20px">${item.value.product.id}</td>
						<td style="text-align: center;padding: 20px">${item.value.product.productTitle}</td>
						<td style="text-align: center;padding: 20px">${item.value.product.price}</td>
						<td style="text-align: center;padding: 20px">${item.value.quantity}</td>
						<td style="text-align: center;padding: 20px">${item.value.totalPrice}</td>
						<td style="text-align: center;padding: 20px"><a href="#" class="btn btn-danger" onclick="removeFromCart('${item.value.product.productId}');"> <span
								class="glyphicon glyphicon-remove" /></span> Remove
						</a></td>
					</tr>
				</c:forEach>

				<tr>
					<th style="padding: 20px"></th>
					<th style="padding: 20px"></th>
					<th style="padding: 20px">Grand Total</th>
					<th style="padding: 20px">${cart.grandTotal}</th>
					<th style="padding: 20px"></th>
				</tr>
			</table>

			<a href="<spring:url value="/product?id=${cart.cartItems[0].value.product.id}" />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span> Continue shopping
			</a>

			<a style="float: right" href="<spring:url value="/checkout?cartId=${cartId}"/>" class="btn btn-success pull-right"> <span
					class="glyphicon-shopping-cart glyphicon"></span> Check out
			</a>

		</div>
	</section>
</body>
</html>
