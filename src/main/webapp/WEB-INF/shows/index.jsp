<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
            integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
            crossorigin="anonymous"
    />

    <title>TV Shows</title>
</head>
<body class="pt-5">
<div class="container">
    <h1><span>Welcome, ${ user.name }</span><span style="float: right; font-size: 20px"><a href="/logout">Logout</a></span></h1>
    <hr class="mb-5"/>
    <h3 class="mb-4">TV Shows</h3>
    <table class="table table-striped mb-4">
        <thead>
        <tr>
            <th>Show</th>
            <th>Network</th>
            <th>Avg Rating</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="show" items="${ shows }">
            <tr>
                <td><a href="/shows/${ show.id }">${ show.title }</a></td>
                <td>${ show.network }</td>
                <td>
                    <c:set var="avg" value="${0}"/>
                    <c:forEach var="rate" items="${show.rates}">
                        <c:set var="avg" value="${avg + rate.userRate}"/>
                    </c:forEach>
                    <c:set var="avg" value="${avg / show.rates.size()}"/>
                        ${ avg }
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/shows/new" class="btn btn-outline-info px-4 py-2">Add a Show</a>
</div>
</body>
</html>
