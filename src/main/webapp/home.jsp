<%@ page import="java.awt.print.Printable" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.sign.StudentDao" %>
<%@ page import="com.sign.Student" %><%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 11/30/2023
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
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
<h2>Welcome, <%= user.getFname() %>!</h2>
<p>Date of Birth: <%= user.getDob() %></p>
<p>Phone Number: <%= user.getPhoneNo() %></p>
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
