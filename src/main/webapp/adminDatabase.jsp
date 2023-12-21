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
            background-color: #121212;
            color: #fff;
        }

        #sidebar {
            width: 20%;
            background-color: #333;
            padding: 20px;
        }

        #main-content {
            flex: 1;
            padding: 20px;
        }

        .student-info p {
            margin: 5px 0;
        }

        .header {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #fff;
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

        input.editable {
            background-color: black;
            color: white;
            border: none;
            width: 100%;
        }

        #update-btn {
            background-color: #4caf50;
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
    <table border="1" cellspacing="0" cellpadding="5" style="width: 100%;">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Date of Birth</th>
            <th>Phone Number</th>
            <th>User Name</th>
            <th>Password</th>
            <th>Father Name</th>
            <th>Mother Name</th>
            <th>Branch</th>
            <th>Aadhar No.</th>
            <th>Gender</th>
        </tr>
        <%
            List<Student> studentDataList = (List<Student>) session.getAttribute("studentDataList");
            if (studentDataList != null && !studentDataList.isEmpty()) {
                for (Student student : studentDataList) {
        %>
        <tr>
            <form action="adminUpdate-servlet" method="post">
            <td><%= student.getId() %></td>
            <td><input type="text" name="fname<%= student.getId() %>" class="editable" value="<%= student.getFname() %>"></td>
            <td><input type="text" name="dob<%= student.getId() %>" class="editable" value="<%= student.getDob() %>"></td>
            <td><input type="text" name="phone<%= student.getId() %>" class="editable" value="<%= student.getPhoneNo() %>"></td>
            <td><input type="text" name="uname<%= student.getId() %>" class="editable" value="<%= student.getUname() %>"></td>
            <td><input type="text" name="upassword<%= student.getId() %>" class="editable" value="<%= student.getUpassword()%>"></td>
            <td><input type="text" name="father<%= student.getId() %>" class="editable" value="<%= student.getFather() %>"></td>
            <td><input type="text" name="mother<%= student.getId() %>" class="editable" value="<%= student.getMother()%>"></td>
            <td><input type="text" name="branch<%= student.getId() %>" class="editable" value="<%= student.getBranch() %>"></td>
            <td><input type="text" name="aadhar<%= student.getId() %>" class="editable" value="<%= student.getAadhar() %>"></td>
            <td><input type="text" name="gender<%= student.getId() %>" class="editable" value="<%= student.getGender() %>"></td>
<%--               <% String stud="student"+ student.getId();--%>
<%--                request.setAttribute("stud" ,student); %>--%>
                <input type="hidden" name="studentUname" value="<%= student.getUname() %>">
            <td><input type="submit" value="Update"></td>
<%--                <td><button onclick="updateUser('<%= student %>')">Update</button></td>--%>
            </form>

        </tr>
        <% } %>
    </table>
<%--    <script>--%>
<%--        function updateUser(student) {--%>
<%--            //window.location.href = "adminUpdate-servlet?student=" + student;--%>
<%--            <%request.setAttribute("student",student); %>--%>
<%--        }--%>
<%--    </script>--%>



    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</div>

</body>
</html>
