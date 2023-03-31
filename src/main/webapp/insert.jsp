<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ekaterine
  Date: 3/31/2023
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert Data</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/testing2"
    user="root" password=""/>

<%
    String author = request.getParameter("author");
    String name = request.getParameter("name");
    int publish_year = Integer.parseInt(request.getParameter("publish_year"));
    out.print(author);
    out.print(name);
    out.print(publish_year);
%>

<c:set var="author" value="<%=author%>"/>
<c:set var="name" value="<%=name%>"/>
<c:set var="publish_year" value="<%=publish_year%>"/>
<sql:update dataSource="${db}" var="DBresult">
    INSERT INTO books_tb(author, name, publish_year) VALUES(?, ?, ?);
    <sql:param value="${author}"/>
    <sql:param value="${name}"/>
    <sql:param value="${publish_year}"/>
</sql:update>

<c:if test="${DBresult>=1}">
    <c:redirect url="index.jsp">
        <c:param name="msg" value="inseted 1 row"/>
    </c:redirect>
</c:if>
</body>
</html>
