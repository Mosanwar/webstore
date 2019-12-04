<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<% response.setStatus(403); %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <title>403 error</title>
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
<center>

<img src="<spring:url value="/resources/images/error-403-forbidden.jpg"  htmlEscape="true" />" alt="Page not found  JSP!!!"  />

<H2>${requestScope['javax.servlet.error.message']}</H2>
 
 <spring:url value="/welcome" var="url" htmlEscape="true"/>
  
	 <form action="${url }" method="get">
	    <input type="submit" value="Home" 
	         name="Submit"  />
	</form>

</center> 
  </body>
</html>