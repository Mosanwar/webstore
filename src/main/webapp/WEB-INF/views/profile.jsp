<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <style>
        .row{margin: 20px}
    </style>
    <title>Profile</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <%--<style type="text/css">@import url("<c:url value="/css/main.css"/>");</style>--%>
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

<div id="global">
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <div class="well well-sm">
                <div class="row" >
                    <div class="col-lg-3">
                        <img src="<c:url value="/resources/images/profile.png"></c:url>" style="float: right" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-lg-8">
                        <h3>${user.name}</h3>
                        <small><i style="width: 20px" class="glyphicon glyphicon-map-marker">
                        </i><cite style="font-size:20px" title="San Francisco, USA"> ${user.address} </cite></small>
                        <p>
                            <i style="width: 20px"  style="font-size:20px" class="glyphicon glyphicon-envelope"></i><span style="font-size:20px"> ${user.email}</span>
                            <br />
                            <i style="width: 20px"  style="font-size:20px" class="glyphicon glyphicon-phone"></i><span style="font-size:20px"> ${user.phone}</span></p>
                        <!-- Split button -->
<%--                        <div class="btn-group">
                            <button type="button" class="btn btn-primary">
                                Social</button>
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span><span class="sr-only">Social</span>
                            </button>
                        </div>--%>
                        <form action="home">
                            <input class="btn btn-lg btn-success btn-mini" type="submit" value="Home">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
