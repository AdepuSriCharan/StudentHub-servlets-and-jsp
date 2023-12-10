<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/10/2023
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<form action="logout-servlet" method="post">
    <% String username = (String) session.getAttribute("username");
        if (username != null) {
    %>

    Click here to logout
    <input type="submit" value="Logout">
    <% } else {
        response.sendRedirect("index.jsp");
    }
    %>

</form>
</body>
</html>
