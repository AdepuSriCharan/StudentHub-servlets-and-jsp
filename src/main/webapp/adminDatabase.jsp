<%@ page import="com.sign.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/12/2023
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Students Information</title>
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

        .student-info {
            background-color: #e6e6e6;
            padding: 10px;
            margin-bottom: 10px;
        }

        .student-info p {
            margin: 5px 0;
        }

        .header {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div id="sidebar">
    <button onclick="location.href='adminaccess.jsp'" style="width: 100%;">Home</button>
    <form action="admindatabase-servlet" method="post">
        <button type="submit" style="width: 100%;">Database</button>
    </form>
</div>

<div id="main-content">
    <div class="header">All Students Information</div>
    <%
        List<Student> studentDataList = (List<Student>) session.getAttribute("studentDataList");
        if (studentDataList != null && !studentDataList.isEmpty()) {
            for (Student student : studentDataList) {
    %>
    <div class="student-info">
        <p>ID: <%= student.getId() %></p>
        <p>Full Name: <%= student.getFname() %></p>
        <p>Date of Birth: <%= student.getDob() %></p>
        <p>Phone Number: <%= student.getPhoneNo() %></p>
        <p>Father Name: <%= student.getFather() %> </p>
        <p>Mother Name: <%= student.getMother()%> </p>
        <p>Branch: <%= student.getBranch() %> </p>
        <p>Aadhar No.: <%=student.getAadhar() %> </p>
        <p>Gender: <%=student.getGender() %> </p>
    </div>
    <%
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</div>
</body>
</html>