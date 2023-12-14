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
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
            background-color: #121212; /* Dark background color */
            color: #fff; /* Light text color */
        }

        #sidebar {
            width: 20%;
            background-color: #333;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            z-index: 2;
        }

        #main-content {
            flex: 1;
            padding: 20px;
            background-color: #1f1f1f; /* Darker content background color */
            overflow: hidden;
            transition: margin-left 0.3s;
        }

        button {
            font-size: 18px;
            margin: 10px;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #555;
            color: #fff;
            width: 100%; /* Make buttons equal in width */
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #777;
        }

        h1, p {
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            padding: 10px;
            border: none;
            border-radius: 4px;
            width: 100%; /* Make submit button equal in width */
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>

</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");
    if (username!=null && password!=null) {
    %>

    <div id="sidebar">
        <button onclick="location.href='adminaccess.jsp'" style="width: 100%;">Home</button>
        <form action="admindatabase-servlet" method="post">
            <button type="submit" style="width: 100%;">Database</button>
        </form>
        <form action="logout-servlet" method="post">
            <button onclick="location.href='logout.jsp'">Logout</button>
        </form>
    </div>
    <div id="main-content">
        Hello Welcome to admin page !!!
    </div>


<%
    } else {
    response.sendRedirect("index.jsp");
    }
%>

</body>
</html>
