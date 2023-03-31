<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ekaterine
  Date: 3/31/2023
  Time: 22:28
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
<sql:update dataSource="${db}" var="DBresult">
  UPDATE books_tb set author=?, name=?, publish_year=? WHERE id=?;
  <sql:param value="${param.author}"/>
  <sql:param value="${param.name}"/>
  <sql:param value="${param.publish_year}"/>
  <sql:param value="${param.id}"/>
</sql:update>

<c:if test="${DBresult>=1}">
  <c:redirect url="index.jsp">
    <c:param name="msg" value="1 record updated"/>
  </c:redirect>
</c:if>
</body>
</html>
