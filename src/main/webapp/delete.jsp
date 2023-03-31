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
    <title>Delete</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/testing2"
                   user="root" password=""/>

<sql:update var="DBresult" dataSource="${db}">
    DELETE FROM books_tb WHERE id=?;
    <sql:param value="${param.id}"/>
</sql:update>

<c:if test="${DBresult>=1}">
    <c:redirect url="index.jsp">
        <c:param name="msg" value="one recored deleted"/>
    </c:redirect>
</c:if>
</body>
</html>
