<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

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

	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Welcome To E_Market!! </h1>
			</div>
		</div>
	</section>
<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Please sign in</h3>
			 	</div>
			  	<div class="panel-body">
			  	<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<spring:message code="login.credentials.error"/><br />
					</div>
				</c:if>
			    	<form action="<spring:url value="/login"></spring:url>" method="post">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form:input-large" placeholder="User Name" name='username' type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class=" form:input-large" placeholder="Password" name='password'  type="password" value="">
			    		</div>
		    			<div class="form-group">
			    			<input type='checkbox' name="keepMe"/>Remember Me? <br/>	
			    		</div>
			    		<input class="btn btn-lg btn-success btn-mini" type="submit" value="Login">
			    	</fieldset>
						<security:csrfInput />
			      	</form>
					<form action="<spring:url value="/register"></spring:url>" method="get">
						<input class="btn btn-lg btn-error btn-mini" type="submit" value="New User">
					</form>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
