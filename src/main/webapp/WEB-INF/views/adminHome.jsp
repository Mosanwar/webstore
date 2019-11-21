<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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