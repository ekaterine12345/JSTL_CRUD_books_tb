<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/testing2"
                   user="root" password=""/>
<sql:query var="res" dataSource="${db}">
    select * from books_tb;
</sql:query>
<table border="2px">
    <thead>
    <th>ID</th>
    <th>Author</th>
    <th>Name</th>
    <th>Publish Year</th>
    <th>Update</th>
    <th>Delete</th>
    </thead>
    <c:forEach var="book" items="${res.rows}">
    <tr>
        <td>${book.id}</td>
        <td>${book.author}</td>
        <td>${book.name}</td>
        <td>${book.publish_year}</td>
        <td><a href="update_form.jsp?id=${book.id}">Edit </a></td>
        <td><a href="delete.jsp?id=${book.id}">Delete</a></td>
    </tr>
    </c:forEach>
</table>

<a href="insert_form.jsp">Add new Book</a>
</body>
</html>