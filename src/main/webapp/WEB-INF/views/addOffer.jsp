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
<title>Add Offer</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/offer.js"/>"></script>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Rangers Webstore</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<security:authorize access="isAuthenticated()">
					<li><a href="profile">Profile</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li><a href="#">Add Product</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="admin">Admin</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li><a href="<spring:url value="/product" />">Chart</a></li>
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


	<div class="jumbotron">
		<div class="container">
			<h1>
				<spring:message code="offer.addOffer" />
			</h1>
		</div>

	</div>

	<div class="container">
		<form:form modelAttribute="offer" id="offerForm">
			<div class="form-row">
				<legend style="color: #428bca">
					<spring:message code="offer.addNewOffer"></spring:message>
				</legend>
				<div>
					<form:errors path="*" cssClass="alert alert-danger" element="div" />
				</div>
				<div class="form-group row">
					<label class="control-label col-lg-2 col-lg-2" for="productId"><spring:message
							code="offer.form.description" /></label>
					<div class="col-lg-10">
						<form:input id="description" path="description" type="text"
							class="form-control" />
						<form:errors path="description" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group row">
					<label class="control-label col-lg-2" for="price"><spring:message
							code="offer.form.price" /></label>
					<div class="col-lg-10">
						<form:input id="price" path="price" type="text"
							class="form-control" />
						<form:errors path="price" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group row">
					<label class="control-label col-lg-2" for="product"><spring:message
							code="offer.form.product" /></label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:select id="product" path="product" type="text"
								class="form-control">
								<form:option value="null">
									<spring:message code="offer.form.selectProduct" />
								</form:option>
								<form:options items="${products}" itemValue="id"
									itemLabel="productTitle" />
							</form:select>
							<form:errors path="product" cssClass="text-danger" />
						</div>
					</div>
				</div>



				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input onclick="addOffer()" id="btnAdd" class="btn btn-primary"
							value="<spring:message code="offer.form.save"/>" />
					</div>
				</div>

			</div>
		</form:form>
		<div id="result"
			style="display: none; border: medium; background: #bce8f1;"></div>
	</div>

</body>
</html>