<%@ page import="com.sign.StudentDao" %>
<%@ page import="com.sign.Student" %><%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/10/2023
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>

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
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #main-content {
            flex: 1;
            padding: 20px;
            background-color: #283140; /* Change the background color */
            color: #ffffff; /* Change text color to white */
        }

        h1 {
            font-size: 28px;
            color: #f39c12;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 10px;
        }

        button {
            font-size: 18px;
            margin: 10px 0;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #555;
            color: #fff;
            width: 80%; /* Make buttons slightly narrower */
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #777;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            padding: 10px;
            border: none;
            border-radius: 4px;
            width: 80%; /* Make submit button slightly narrower */
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
    <h1>Welcome, <%= user.getFname() %>! to your Profile</h1>
    <p>Date of Birth: <%= user.getDob() %></p>
    <p>Phone Number: <%= user.getPhoneNo() %></p>
    <p>Father Name : <%= user.getFather() %> </p>
    <p>Mother Name : <%= user.getMother()%> </p>
    <p>Branch : <%= user.getBranch() %> </p>
    <p>Aadhar No. : <%=user.getAadhar() %> </p>
    <p>Gender : <%=user.getGender() %> </p>
</div>

<%
        } else {
            response.sendRedirect("home.jsp");
        }
    } else {
        response.sendRedirect("home.jsp");
    }
%>

</body>
</html>
