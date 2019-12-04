<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Rangers Webstore</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="home">Home</a></li>
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

	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="offers"><spring:message
				code="offer.offers" /></a> <a class="navbar-brand" href="addOffer"><spring:message
				code="offer.addOffer" /></a>

		<div class="pull-right" style="padding: 15px 70px; font-size: 18px;">
			<a href="?language=en">English</a> | <a href="?language=fr">French</a>
		</div>
	</nav>


	<section class="container">

		<div class="row">
			<div class="col-md-5">
				<img
					src="<c:url value="${offer.product.photo }"></c:url>"
					alt="image" style="width: 100%" />
			</div>

			<div class="col-md-5">
				<h3>${offer.product.productTitle}</h3>
				<p><strong><spring:message code="offer.form.description"/>: </strong> ${offer.description}</p>
				<p><strong><spring:message code="offer.form.newPrice"/>: </strong> ${offer.price} $</p>
				<p><strong><spring:message code="offer.form.oldPrice"/>: </strong> ${offer.product.price} $</p>

				<p>
					<strong><spring:message code="offer.form.category"/>: </strong> ${offer.product.category.name}
				</p>

			</div>
		</div>
	</section>

</body>
</html>