<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ekaterine
  Date: 3/31/2023
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/testing2"
                   user="root" password=""/>
<sql:query var="result" dataSource="${db}">
    SELECT * FROM books_tb WHERE id=?;
    <sql:param value="${param.id}"/>
</sql:query>


<form method="post" action="update.jsp">
    <c:forEach var="book" items="${result.rows}">
     <input type="hidden" value="${book.id}" name="id"/>
    Author: <input type="text" value="${book.author}" name="author"/> <br>
    Name: <input type="text" value="${book.name}" name="name"/><br>
    Publish Year: <input type="number" value="${book.publish_year}" name="publish_year"><br>
        <input type="submit" value="update">
    </c:forEach>

</form>

</body>
</html>
