<%@ page import="com.sign.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Students Information</title>
    <style>
        body {
            display: flex;
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #121212; /* Dark background color */
            color: #fff; /* Light text color */
        }

        #sidebar {
            width: 20%;
            background-color: #333; /* Dark sidebar background color */
            padding: 20px;
        }

        #main-content {
            flex: 1;
            padding: 20px;
        }

        .student-info {
            background-color: #1f1f1f; /* Darker content background color */
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .student-info p {
            margin: 5px 0;
        }

        .header {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #fff; /* Light text color */
        }

        button {
            font-size: 18px;
            margin: 10px;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #555; /* Dark button background color */
            color: #fff; /* Light text color */
            width: 100%; /* Make buttons equal in width */
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #777; /* Darker hover color */
        }
    </style>
</head>
<body>
<div id="sidebar">
    <button onclick="location.href='adminaccess.jsp'">Home</button>
    <form action="admindatabase-servlet" method="post">
        <button type="submit">Database</button>
    </form>
    <form action="logout-servlet" method="post">
        <button onclick="location.href='logout.jsp'">Logout</button>
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
