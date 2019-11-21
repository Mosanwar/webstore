<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Welcome</title>
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
				<h1>${greeting}</h1>
				<p>${tagline}</p>
				<div class="row">
					<c:forEach items="${products}" var="product">
						<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
							<div class="thumbnail">
								<img
									src="<c:url value="${product.photo} "></c:url>"
									alt="image" style="width: 100%" />
								<div class="caption">
									<h3>${product.productTitle}</h3>
									<p>${product.description}</p>
									<p>${product.price} USD</p>
									<p>Available ${product.unitsInStock} units in stock</p>
									<p>
										<a
											href=" <spring:url value="/product?id=${product.id}" /> "
											class="btn btn-primary"> <span
											class="glyphicon-info-sign glyphicon" /></span> Details
										</a>
									</p>

								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
	</section>
</body>
</html>
