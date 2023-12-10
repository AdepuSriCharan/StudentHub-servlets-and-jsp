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
    if (username != null) {
        StudentDao studentDao = new StudentDao();

        Student user = studentDao.getUserDetails(username);

        if (user != null) {
%>



<div id="sidebar">
    <button onclick="location.href='home.jsp'" style="width: 100%;">Home</button>

    <button onclick="location.href='profile.jsp'" style="width: 100%;">Profile</button>

    <button onclick="passUserToUpdatePage()" style="width: 100%;">Update</button>

</div>

<script>
    function passUserToUpdatePage() {
        <% session.setAttribute("user", user); %>
        location.href = 'update.jsp';
    }
</script>

<div id="main-content">
    <h1>Welcome, <%= user.getFname() %>!</h1>
    <p>This is the main content of your page.</p>
<%--    <p> ID : <%= user.getId() %> </p>--%>
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
