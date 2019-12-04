<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <title>New User</title>
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
                    <h3 class="panel-title">Please fill needed information</h3>
                </div>
                <div class="panel-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br />
                        </div>
                    </c:if>
                    <form:form modelAttribute="user" action="register" method="post">
                        <fieldset>
                            <p>
<%--                                <form:errors path="*" cssStyle="color : red;" />--%>
                            </p>
                            <div class="form-group">
                                <form:input path="name" id="name" cssClass="form:input-large" placeholder="Name" /><br/>
                                <form:errors path="name" cssStyle="color : red;" />
                            </div>
                            <div class="form-group">
                                <form:input path="email" id="email" cssClass="form:input-large" placeholder="Email" /><br/>
                                <form:errors path="email" cssStyle="color : red;" />
                            </div>
                            <div class="form-group">
                                <form:password path="password" id="password" cssClass="form:input-large" placeholder="Password" /><br/>
                                <form:errors path="password" cssStyle="color : red;" />
                            </div>
<%--                            <span style="text-align: center;">
                                <form:errors path="password" cssStyle="color : red;" />
                            </span>--%>
                            <div class="form-group">
                                <form:input path="phone" id="phone" cssClass="form:input-large" placeholder="Phone" /><br/>
                                <form:errors path="phone" cssStyle="color : red;" />
                            </div>
                            <div class="form-group">
                                <form:input path="address" id="address" cssClass="form:input-large" placeholder="Address" /><br/>
                                <form:errors path="address" cssStyle="color : red;" />
                            </div>
                            <input class="btn btn-lg btn-success btn-mini" type="submit" value="Register">
                        </fieldset>
                        <security:csrfInput />
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
