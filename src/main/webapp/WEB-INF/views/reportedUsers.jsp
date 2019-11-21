<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<li><a href="#">Profile</a></li>
			<li><a href="#">Add Product</a></li>
			<li><a href="#">Chart</a></li>
			<li><a href="admin">Admin</a></li>
			<li><a href="offers">Offers</a></li>
			<li><a style="margin-left: 700px" href="#">Login</a></li>
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
				<h1>View Reported Users</h1>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row">
			<c:forEach items="${Users}" var="user">
				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
						<div class="caption">
							<h3>${user.name}</h3>
							<h5>Report Description</h5>
						
						   <c:forEach items="${user.hasReports}" var="report">
							<p>tst ${report.description}</p>
							</c:forEach>       
							
							<p>
								<a style="background-color:red"
									href="<spring:url value="/blockUser?id=${user.id}" /> "
									class="btn btn-primary"> <span
									class="glyphicon-info-sign glyphicon" /></span> Block
								</a>
								
								<a 
									href=" <spring:url value="/ignoreUser?id=${user.id}" /> "
									class="btn btn-primary"> <span
									class="glyphicon-info-sign glyphicon" /></span> Ignore
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