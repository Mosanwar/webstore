<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
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
				<li><a href="<spring:url value="addProduct" />">Add Product</a></li>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="<spring:url value="admin" />">Admin</a></li>
			</security:authorize>
			<li><a href="offers">Offers</a></li>
			<security:authorize access="isAnonymous()">
				<li><a style="margin-left: 700px" href="<spring:url value="/login" />">Login</a></li>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<li><a style="margin-left: 700px" href="<spring:url value="/logout" />">Logout</a></li>
			</security:authorize>
		</ul>
	</div>
</nav>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Products</h1>
				<p>Add products</p>
			</div>
			<div class="pull-right" style="padding-right:50px">
				<a href="?language=en" >English</a>|<a href="?language=fr" >French</a>					
			</div>
			
		</div>
	</section>
	<section class="container">
		<form:form  modelAttribute="product" class="form-horizontal" enctype="multipart/form-data" action="addProduct" method="post">
			<fieldset>
				<legend>Add new product</legend>

				<form:errors path="*" cssClass="alert alert-danger" element="div"/>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="productTitle">Title</label>
					<div class="col-lg-10">
						<form:input id="productTitle" path="productTitle" type="text" class="form:input-large"/>
						<form:errors path="productTitle" cssClass="text-danger"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="price">Price</label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:input id="price" path="price" type="text" class="form:input-large"/>
							<form:errors path="price" cssClass="text-danger"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="unitsInStock">Units in Stock</label>
					<div class="col-lg-10">
						<form:input id="unitsInStock" path="unitsInStock" type="text" class="form:input-large"/>
						<form:errors path="unitsInStock" cssClass="text-danger"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="description">Description</label>
					<div class="col-lg-10">
						<form:textarea id="description" path="description" rows = "2"/>
					</div>
				</div>

				

<%--				<div class="form-group">--%>
<%--					<label class="control-label col-lg-2" for="category">Category</label>--%>
<%--					<div class="col-lg-10">--%>
<%--					<form:select path="category" id="category.id" items="${categories}" itemValue="id" itemLabel="name" />--%>
<%--					</div>--%>
<%--				</div>--%>

			

			
				
				<div class="form-group">
					<label for="productImage">Image</label>
					<div class="col-lg-10">
						<form:input id="productImage" path="productImage" type="file"
							class="form:input-large" />
					</div>
				</div>


				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary" value ="Add"/>
					</div>
				</div>
				
			</fieldset>
		</form:form>
	</section>
</body>
</html>
