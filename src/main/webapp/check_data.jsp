<%--
  Created by IntelliJ IDEA.
  User: Ekaterine
  Date: 3/31/2023
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String author = request.getParameter("author");
    String name = request.getParameter("name");
    int publish_year = Integer.parseInt(request.getParameter("publish_year"));
%>
<ul>
    <li><%=author%></li>
    <li><%=name%></li>
    <li><%=publish_year%></li>
</ul>
<a href="insert.jsp?author=<%=author%>&name=<%=name%>&publish_year=<%=publish_year%>">Add</a>
</body>
</html>
