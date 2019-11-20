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
<title>Add Offer</title>
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
		<a class="navbar-brand" href="offers">Offers</a> <a
			class="navbar-brand" href="addOffer">Add Offer</a>
	</nav>


	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>
					<spring:message code="offer.addOffer" />
				</h1>
			</div>
			<div class="pull-right" style="padding-right: 50px">
				<a href="?language=en">English</a>|<a href="?language=fr">French</a>
			</div>

		</div>
	</section>
	<section class="container">
		<form:form modelAttribute="offer" class="form-horizontal"
			enctype="multipart/form-data">
			<fieldset>
				<legend><spring:message code="offer.addNewOffer"></spring:message></legend>
	
				<form:errors path="*" cssClass="alert alert-danger" element="div" />
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="productId"><spring:message
							code="offer.form.description" /></label>
					<div class="col-lg-10">
						<form:input id="description" path="description" type="text"
							class="form:input-large" />
						<form:errors path="description" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="price"><spring:message
							code="offer.form.price" /></label>
					<div class="col-lg-10">
						<form:input id="price" path="price" type="text"
							class="form:input-large" />
						<form:errors path="price" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="product"><spring:message
							code="offer.form.product" /></label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:input id="product" path="product" type="text"
								class="form:input-large" />
							<form:errors path="product" cssClass="text-danger" />
						</div>
					</div>
				</div>



				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary"
							value="Add" />
					</div>
				</div>

			</fieldset>
		</form:form>
	</section>
</body>
</html>