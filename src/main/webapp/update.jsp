<%@ page import="com.sign.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>

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

        h2, p {
            margin-bottom: 10px;
        }

        label {
            margin-bottom: 15px;
            display: block;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #333;
            color: #fff;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-container {
            background-color: #1f1f1f;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            margin: 0 auto;
        }
    </style>

</head>
<body>

<div id="sidebar">
    <button onclick="location.href='home.jsp'">Home</button>
    <button onclick="location.href='profile.jsp'">Profile</button>
    <button onclick="passUserToUpdatePage()">Update</button>
    <button onclick="location.href='logout.jsp'">Logout</button>
    <button onclick="location.href='delete.jsp'">Delete</button>

    <button onclick="location.href='https://github.com/AdepuSriCharan/Basics-of-Web-Application'">GitHub</button>
</div>

<div id="main-content">
    <%
        String username = (String) session.getAttribute("username");
        if(username!=null){
            Student student = (Student) session.getAttribute("user");
            if (student != null) {
    %>
    <div class="form-container">
        <h2 style="color: #fff;">Edit Profile</h2>

        <form action="update-servlet" method="Post">
            <label>
                <span style="color: #fff;">Full Name:</span>
                <input type="text" name="fname" value="<%= student.getFname() %>">
            </label>

            <label>
                <span style="color: #fff;">Date Of Birth:</span>
                <input type="text" name="dob" value="<%= student.getDob() %>">
            </label>

            <label>
                <span style="color: #fff;">Phone No.:</span>
                <input type="text" name="phoneNo" value="<%= student.getPhoneNo() %>">
            </label>

            <label>
                <span style="color: #fff;">Father Name:</span>
                <input type="text" name="father" value="<%= student.getFather() %>">
            </label>

            <label>
                <span style="color: #fff;">Mother Name:</span>
                <input type="text" name="mother" value="<%= student.getMother() %>">
            </label>

            <label>
                <span style="color: #fff;">Aadhar No.:</span>
                <input type="text" name="aadhar" value="<%= student.getAadhar() %>">
            </label>

            <label>
                <span style="color: #fff;">Gender:</span>
                <input type="text" name="gender" value="<%= student.getGender() %>">
            </label>

            <label>
                <span style="color: #fff;">Branch:</span>
                <input type="text" name="branch" value="<%= student.getBranch() %>">
            </label>

            <input type="submit" value="Update">
        </form>
    </div>
</div>

<%
        } else {
           response.sendRedirect("index.jsp");
        }
    }
        else {
                response.sendRedirect("index.jsp");
    }
%>

</body>
</html>
