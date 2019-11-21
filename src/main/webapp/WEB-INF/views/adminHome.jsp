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

  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/adminHome.js"/>"></script>
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
  <a class="navbar-brand" href="admin"><spring:message code="admin.home.AdminHome" /></a>
  <a class="navbar-brand" href="reportedUsers"><spring:message code="admin.home.ReportedUsers" /></a>
  <a class="navbar-brand" href="manageUsers"><spring:message code="admin.home.ManageUsers" /></a>

  		<div class="pull-right" style="padding: 15px 70px; font-size: 18px;">
			<a href="?language=en">English</a> | <a href="?language=fr">French</a>
		</div>
</nav>



	<section>
		<div class="jumbotron">
			<div class="container">
				<h1><spring:message code="admin.home.AdminHome" /></h1>
			<p><spring:message code="admin.home.WelcomeAdmin" /> ${user.name}</p>

			</div>
		</div>
	</section>


	<section class="container">

		<div class="row">
			
				<div class="col-md-6"  >
					<div class="thumbnail">
					
						<div class="caption" id="products">
							<h3><spring:message code="admin.home.NumberofAllProducts" /> </h3>
							<h4>${NoAllProducts}</h4> 
							

						</div>
					</div>
				</div>
				
					<div class="col-md-6 "  >
					<div class="thumbnail">
					
						<div class="caption">
							<h3><spring:message code="admin.home.NumberofRegisteredUsers" /></h3>
							<h4>${NoAllUsers}</h4>
							

						</div>
					</div>
				</div>
				
					<div class="col-md-6 "  >
					<div class="thumbnail">
					
						<div class="caption">
							<h3><spring:message code="admin.home.NumberofBlockedUsers" /> </h3>
							<h4>${NoBlockedUsers}</h4>
							

						</div>
					</div>
				</div>
				
					<div class="col-md-6 "  >
					<div class="thumbnail">
					
						<div class="caption">
							<h3><spring:message code="admin.home.NumberofReportedUsers" /> </h3>
							<h4>${NoReportedUsers}</h4>
							

						</div>
					</div>
				</div>
				<div id="result" style="margin: 5px">

				</div>
			
		</div>
	</section>
</body>
</html>