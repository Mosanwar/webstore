<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				<h1><spring:message code="admin.reportedUser.ViewReportedUsers" /></h1>
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
							<h5><spring:message code="admin.reportedUser.ReportDescription" /></h5>
						
						   <c:forEach items="${user.hasReports}" var="report">
							<p>- ${report.description}</p>
							</c:forEach>       
							
							<p>
								<a style="background-color:red"
									href="<spring:url value="/blockUser?id=${user.id}" /> "
									class="btn btn-primary"> <span
									class="glyphicon-info-sign glyphicon" /></span> <spring:message code="admin.reportedUser.Block" />
								</a>
								
								<a 
									href=" <spring:url value="/ignoreUser?id=${user.id}" /> "
									class="btn btn-primary"> <span
									class="glyphicon-info-sign glyphicon" /></span> <spring:message code="admin.reportedUser.Ignore" />
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