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

    <title>New Show</title>
</head>
<body class="pt-5">
<div class="container">
    <h3 class="mb-4">Create New Show</h3>
    <form:form action="/shows" method="post" modelAttribute="show">
        <form:hidden value="${ userId }" path="provider"/>
        <div class="form-group">
            <form:label path="title">Title</form:label>
            <form:input class="form-control" path="title"/>
            <form:errors class="text-danger" path="title"/>
        </div>
        <div class="form-group">
            <form:label path="network">Network</form:label>
            <form:input class="form-control" path="network"/>
            <form:errors class="text-danger" path="network"/>
        </div>
        <button type="submit" class="btn btn-outline-info px-4 py-2">Create</button>
    </form:form>
</div>
</body>
</html>
