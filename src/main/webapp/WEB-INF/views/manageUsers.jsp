<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Reported Users</title>
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
  <a class="navbar-brand" href="admin">Admin Home</a>
  <a class="navbar-brand" href="reportedUsers">Reported Users</a>
  <a class="navbar-brand" href="manageUsers">Manage Users</a>
</nav>

	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Manage Users</h1>
				<p>Activate Blocked Users</p>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row">
		  <table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">User Name</th>
			      <th scope="col">Email</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
			  <tbody>
			<c:forEach items="${BlockedUsers}" var="user">
			  <tr>
			      <td>${user.name}</td>
			      <td>${user.email}</td>
			      <td><a
							href=" <spring:url value="/activeUser?id=${user.id}" /> "
							class="btn btn-primary"> <span
							class="glyphicon-info-sign glyphicon" /></span> Active
						</a></td>
			   </tr>
			
			</c:forEach>
		</tbody>
		</table>
			
		</div>
	</section>
</body>
</html>