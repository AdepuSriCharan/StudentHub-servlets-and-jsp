<%@ page import="com.sign.Student" %><%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/9/2023
  Time: 6:56 PM
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

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

    </style>

</head>
<body>

<div id="sidebar">
    <button onclick="location.href='home.jsp'" style="width: 100%;">Home</button>

    <button onclick="location.href='profile.jsp'" style="width: 100%;">Profile</button>

    <button onclick="location.href='update.jsp'" style="width: 100%;">Update</button>

</div>

<div id="main-content">
    <!-- Your main content goes here -->
    <% Student student = (Student) session.getAttribute("user");
        if (student != null) {
    %>
    <form action="update-servlet" method="Post">

<%--        <p>Name : <%= student.getDob() %> </p>--%>

        <label>
            <span>Full Name:</span>
            <input type="text" name="fname">
        </label>

        <label>
            <span>Date Of Birth:</span>
            <input type="text" name="dob">
        </label>

        <label>
            <span>Phone No.:</span>
            <input type="text" name="phoneNo">
        </label>

<%--        <label>--%>
<%--            <span>Username:</span>--%>
<%--            <input type="text" name="uname">--%>
<%--        </label>--%>

        <label>
        <span> Father Name :</span>
            <input type="text" name="father">
        </label>

        <label>
        <span> Mother Name :</span>
            <input type="text" name="mother">
        </label>

        <label>
        <span> Aadhar No. : </span>
            <input type="text" name="aadhar">
        </label>

        <label>
        <span> Gender : </span>
            <input type="text" name="gender">
        </label>

        <label>
        <span> Branch : </span>
            <input type="text" name="branch">
        </label>


        <input type="submit" value="Update">
    </form>
</div>

<%
    } else {
    response.sendRedirect("index.jsp");
    }
%>

</body>
</html>
