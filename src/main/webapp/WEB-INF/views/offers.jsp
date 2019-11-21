<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
		<a class="navbar-brand" href="offers"><spring:message
				code="offer.offers" /></a> <a class="navbar-brand" href="addOffer"><spring:message
				code="offer.addOffer" /></a>

		<div class="pull-right" style="padding: 15px 70px; font-size: 18px;">
			<a href="?language=en">English</a> | <a href="?language=fr">French</a>
		</div>
	</nav>

	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>
					<spring:message code="offer.offers" />
				</h1>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row">
			<c:forEach items="${offers}" var="offer">
				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
						<img
							src="<c:url value="/resource/images/${offer.product.id}.png"></c:url>"
							alt="image" style="width: 100%" />
						<div class="caption">
							<h3>${offer.price}</h3>
							<p>
								<spring:message code="offer.form.description" />
								: ${offer.description}
							</p>
							<p>
								<spring:message code="offer.form.newPrice" />
								: ${offer.price} $
							</p>
							<p>
								<spring:message code="offer.form.oldPrice" />
								: ${offer.product.price} $
							</p>
							<p>
								<a href=" <spring:url value="/offer?id=${offer.id}" /> "
									class="btn btn-link">  <spring:message code="offer.details"/>
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