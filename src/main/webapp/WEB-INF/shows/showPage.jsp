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

    <title>${ show.title }</title>
</head>
<body class="pt-5">
<div class="container">
    <h1 class="mb-3">${ show.title }</h1>
    <h4 class="mb-5">Network: ${ show.network }</h4>
    <h2 class="mb-4">Users who rated this show:</h2>
    <table class="table table-striped mb-4">
        <thead>
        <tr>
            <th>Name</th>
            <th>Rating</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="rate" items="${ showRates }">
            <tr>
                <td>${ rate.user.name }</td>
                <td>${ rate.userRate }</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${ show.provider.id == userId }"><a href="/shows/${ show.id }/edit" class="btn btn-outline-info px-4 py-2">Edit</a></c:if>
    <form:form action="/shows/${ show.id }/rate" method="post" modelAttribute="rate">
        <form:hidden value="${ userId }" path="user"/>
        <form:hidden value="${ show.id }" path="show"/>
        <div class="form-group mt-5">
            <form:label path="userRate">Leave a Rating:</form:label>
            <form:input class="form-control" type="number" path="userRate"/>
            <form:errors class="text-danger" path="userRate"/>
        </div>
        <button type="submit" class="btn btn-outline-info px-4 py-2">Rate!</button>
    </form:form>
</div>
</body>
</html>
