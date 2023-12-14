<%@ page import="java.awt.print.Printable" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.sign.StudentDao" %>
<%@ page import="com.sign.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to Your Page</title>

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

<script>
    function passUserToUpdatePage() {
        <% session.setAttribute("user", user); %>
        location.href = 'update.jsp';
    }
</script>

<div id="main-content">
    <h1>Welcome, <%= user.getFname() %>!</h1>
    <p>This is your Home page.</p>
    <p>From Here, you can access.</p>
<%--    <p>Phone Number: <%= user.getPhoneNo() %></p>--%>
</div>

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
