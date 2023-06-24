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

    <title>Edit Show</title>
</head>
<body class="pt-5">
<div class="container">
    <h3 class="mb-4">${ currentShow.title }</h3>
    <form:form action="/shows/${ currentShow.id }" method="post" modelAttribute="show">
        <input type="hidden" name="_method" value="put">
        <form:hidden value="${ userId }" path="provider"/>
        <div class="form-group">
            <form:label path="title">Title</form:label>
            <form:input class="form-control" path="title">${ currentShow.title }</form:input>
            <form:errors class="text-danger" path="title"/>
        </div>
        <div class="form-group">
            <form:label path="network">Network</form:label>
            <form:input class="form-control" path="network">${ currentShow.network }</form:input>
            <form:errors class="text-danger" path="network"/>
        </div>
        <button type="submit" class="btn btn-outline-info px-4 py-2">Update</button>
    </form:form>
    <form:form action="/shows/${ currentShow.id }" method="post">
        <input type="hidden" name="_method" value="delete">
        <button type="submit" class="btn btn-outline-danger px-4 py-2">Delete</button>
    </form:form>
</div>
</body>
</html>
