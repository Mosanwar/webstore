<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Admin</title>
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
  <a class="navbar-brand" href="admin">Admin Home</a>
  <a class="navbar-brand" href="reportedUsers">Reported Users</a>
  <a class="navbar-brand" href="manageUsers">Manage Users</a>
</nav>

	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Admin Home</h1>
			<p>Welcome Admin !! ${user.userName}</p>
			</div>
		</div>
	</section>


	<section class="container">

		<div class="row">
			
				<div class="col-md-6"  >
					<div class="thumbnail">
					
						<div class="caption">
							<h3>Number of All Products </h3>
							<h4>${NoAllProducts}</h4> 
							

						</div>
					</div>
				</div>
				
					<div class="col-md-6 "  >
					<div class="thumbnail">
					
						<div class="caption">
							<h3>Number of Registered Users </h3>
							<h4>${NoAllUsers}</h4>
							

						</div>
					</div>
				</div>
				
					<div class="col-md-6 "  >
					<div class="thumbnail">
					
						<div class="caption">
							<h3>Number of Blocked Users </h3>
							<h4>${NoBlockedUsers}</h4>
							

						</div>
					</div>
				</div>
				
					<div class="col-md-6 "  >
					<div class="thumbnail">
					
						<div class="caption">
							<h3>Number of Reported Users </h3>
							<h4>${NoReportedUsers}</h4>
							

						</div>
					</div>
				</div>								
			
		</div>
	</section>
</body>
</html>