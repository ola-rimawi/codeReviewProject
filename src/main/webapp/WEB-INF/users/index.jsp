<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
            integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
            crossorigin="anonymous"
    />

    <title>Login | Registration</title>
</head>
<body class="pt-5">
<div class="container">
    <div class="row">
        <form:form class="col-lg" action="/" method="post" modelAttribute="registration">
            <h2 class="mb-4">Register</h2>
            <div class="form-group">
                <form:label path="name">Name</form:label>
                <form:input class="form-control" path="name"/>
                <form:errors class="text-danger" path="name"/>
            </div>
            <div class="form-group">
                <form:label path="email">Email</form:label>
                <form:input type="email" class="form-control" path="email"/>
                <form:errors class="text-danger" path="email"/>
            </div>
            <div class="form-group">
                <form:label path="password">Password</form:label>
                <form:password class="form-control" path="password"/>
                <form:errors class="text-danger" path="password"/>
            </div>
            <div class="form-group">
                <form:label path="passwordConfirmation">Confirm Password</form:label>
                <form:password class="form-control" path="passwordConfirmation"/>
                <form:errors class="text-danger" path="passwordConfirmation"/>
            </div>
            <button type="submit" class="btn btn-outline-success">Register</button>
        </form:form>
        <form class="col-lg pt-lg-0 pt-5" action="/login" method="post">
            <h2 class="mb-4">Login</h2>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control"/>
            </div>
            <p class="text-danger">${ error }</p>
            <button type="submit" class="btn btn-outline-info">Login</button>
        </form>
    </div>
</div>
</body>
</html>
