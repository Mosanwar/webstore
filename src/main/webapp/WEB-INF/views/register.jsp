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
                    <form action="<spring:url value="/register"></spring:url>" method="post">
                        <fieldset>
                            <div class="form-group">
                                <input class="form:input-large" placeholder="Name" name='name' type="text">
                            </div>
                            <div class="form-group">
                                <input class="form:input-large" placeholder="Email" name='email' type="text">
                            </div>
                            <div class="form-group">
                                <input class=" form:input-large" placeholder="Password" name='password'  type="password" value="">
                            </div>
                            <div class="form-group">
                                <input class="form:input-large" placeholder="Phone" name='phone' type="text">
                            </div>
                            <div class="form-group">
                                <input class="form:input-large" placeholder="Address" name='address' type="text">
                            </div>
                            <input class="btn btn-lg btn-success btn-mini" type="submit" value="Register">
                        </fieldset>
                        <security:csrfInput />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
