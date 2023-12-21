<%@ page import="com.sign.StudentDao" %>
<%@ page import="com.sign.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
            background-color: #121212;
            color: #fff;
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
            background-color: #1f1f1f;
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
            width: 100%;
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
            width: 10%;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>


<body>
<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
        StudentDao studentDao = new StudentDao();
        Student user = studentDao.getUserDetails(username);

        if (user != null) {
%>

<div id="sidebar">
    <button onclick="location.href='home.jsp'">Home</button>
    <button onclick="location.href='profile.jsp'">Profile</button>
    <button onclick="passUserToUpdatePage()">Update</button>
    <button onclick="location.href='logout.jsp'">Logout</button>
    <button onclick="location.href='delete.jsp'">Delete</button>
    <button onclick="location.href='https://github.com/AdepuSriCharan/Basics-of-Web-Application'">GitHub</button>
</div>

<div id="main-content">
    <form action="logout-servlet" method="post">
        <p>Do you genuinely intend to log out, <%= user.getFname() %> ?</p>
        Click here to logout<br>
        <input type="submit" value="Logout">
    </form>
</div>

<script>
    function passUserToUpdatePage() {
        <% session.setAttribute("user", user); %>
        location.href = 'update.jsp';
    }
</script>

<%
        } else {
            response.sendRedirect("index.jsp");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>