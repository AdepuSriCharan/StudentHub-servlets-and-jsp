<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/10/2023
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>

        body {
            display: flex;
        }

        #sidebar {
            width: 20%;
            background-color: #f2f2f2;
            padding: 20px;
        }

        #main-content {
            flex: 1;
            padding: 20px;
        }

    </style>

</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");
    if (username.equals("Sricharan") && password.equals("charan123")) {
    %>

    <div id="sidebar">
        <button onclick="location.href='adminaccess.jsp'" style="width: 100%;">Home</button>
        <form action="admindatabase-servlet" method="post">
            <button type="submit" style="width: 100%;">Database</button>
        </form>

    </div>

Hello Welcome to admin page !!!


<%
    } else {
    response.sendRedirect("index.jsp");
    }
%>

</body>
</html>
