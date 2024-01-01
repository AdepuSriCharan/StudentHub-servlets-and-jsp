<%@ page import="com.signup.Student" %>
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

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #333;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: white;
            text-decoration: none;
            cursor: pointer;
        }

        .header {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #fff;
        }


        .editable {
            background-color: #f4f4f4;
            color: #333;
            border: 1px solid #ddd;
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
        }

        .button-container {
            text-align: right;
            margin-top: 10px;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .button-container {
            text-align: right;
            margin-top: 10px;
        }

        input[type="submit"],
        input[type="button"] {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45a049;
        }


    </style>

    <script>
        function validateUpdateForm() {
            var fname = document.forms["updateForm"]["fname"].value;
            var dob = document.forms["updateForm"]["dob"].value;
            var phoneNo = document.forms["updateForm"]["phoneNo"].value;
            var username = document.forms["updateForm"]["uname"].value;
            var password = document.forms["updateForm"]["upassword"].value;
            var father = document.forms["updateForm"]["father"].value;
            var mother = document.forms["updateForm"]["mother"].value;
            var branch = document.forms["updateForm"]["branch"].value;
            var aadhar = document.forms["updateForm"]["aadhar"].value;
            var gender = document.forms["updateForm"]["gender"].value;
            if (fname === "" || dob === "" || phoneNo === "" || username === "" || password === "" ||father === "" || mother === "" || branch === "" || aadhar === "" || gender === "") {
                alert("All fields must be filled");
                return false;
            }
            if (!dob.match(/^\d{2}[-/]\d{2}[-/]\d{4}$/)) {
                alert("Date of Birth should be in the format 00-00-0000 or 00/00/0000");
                return false;
            }
            if (!phoneNo.match(/^\d{10}$/)) {
                alert("Phone Number should be numeric and 10 digits");
                return false;
            }
            if (username.indexOf('@') === -1) {
                alert("Username must contain '@'");
                return false;
            }
            if (password.length < 8) {
                alert("Password must be at least 8 characters long");
                return false;
            }
            if (!aadhar.match(/^\d{12}$/)) {
                alert("Aadhar Card should be numeric and 12 digits");
                return false;
            }
            if (!(gender.toLowerCase() === "male" || gender.toLowerCase() === "female")) {
                alert("Gender should be 'Male' or 'Female'");
                return false;
            }

            return true;
        }
    </script>

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
                <td><input type="text" name="phoneNo<%= student.getId() %>" class="editable" value="<%= student.getPhoneNo() %>"></td>
                <td><input type="text" name="uname<%= student.getId() %>" class="editable" value="<%= student.getUname() %>"></td>
                <td><input type="text" name="upassword<%= student.getId() %>" class="editable" value="<%= student.getUpassword()%>"></td>
                <td><input type="text" name="father<%= student.getId() %>" class="editable" value="<%= student.getFather() %>"></td>
                <td><input type="text" name="mother<%= student.getId() %>" class="editable" value="<%= student.getMother()%>"></td>
                <td><input type="text" name="branch<%= student.getId() %>" class="editable" value="<%= student.getBranch() %>"></td>
                <td><input type="text" name="aadhar<%= student.getId() %>" class="editable" value="<%= student.getAadhar() %>"></td>
                <td><input type="text" name="gender<%= student.getId() %>" class="editable" value="<%= student.getGender() %>"></td>
                <%session.setAttribute("stud"+student.getId(),student);%>
                <td><input type="button" value="Edit" onclick="openModal('<%= student.getId() %>', '<%= student.getFname() %>', '<%= student.getDob() %>', '<%= student.getPhoneNo() %>', '<%= student.getUname() %>', '<%= student.getUpassword() %>', '<%= student.getFather() %>', '<%= student.getMother() %>', '<%= student.getBranch() %>', '<%= student.getAadhar() %>', '<%= student.getGender() %>')"></td>
            </form>
        </tr>
        <% } %>
    </table>

    <button onclick="openModal('newId','','','','','','','','','','')">+</button>

    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div class="header">Edit Student Details</div>
            <form action="adminUpdate-servlet" method="post"  name="updateForm" onsubmit="return validateUpdateForm()">

                <label for="fname">Full Name:</label>
                <input type="text" name="fname" id="fname" class="editable">

                <label for="dob">Date of Birth:</label>
                <input type="text" name="dob" id="dob" class="editable">

                <label for="phoneNo">Phone Number:</label>
                <input type="text" name="phoneNo" id="phoneNo" class="editable">

                <label for="uname">Username:</label>
                <input type="text" name="uname" id="uname" class="editable">

                <label for="upassword">Password:</label>
                <input type="text" name="upassword" id="upassword" class="editable">

                <label for="father">Father's Name:</label>
                <input type="text" name="father" id="father" class="editable">

                <label for="mother">Mother's Name:</label>
                <input type="text" name="mother" id="mother" class="editable">

                <label for="branch">Branch:</label>
                <input type="text" name="branch" id="branch" class="editable">

                <label for="aadhar">Aadhaar Number:</label>
                <input type="text" name="aadhar" id="aadhar" class="editable">

                <label for="gender">Gender:</label>
                <input type="text" name="gender" id="gender" class="editable">

                <input type="hidden" name="studId" id="studId" value="">
                <input type="submit" value="Update">
                <input type="button" onclick="deleteStudent()" value="Delete">

            </form>
        </div>
    </div>
    <script>
        function openModal(studentId, fname, dob, phoneNo, uname, upassword, father, mother, branch, aadhar, gender) {
            document.getElementById('editModal').style.display = 'block';
            document.getElementById('studId').value = studentId;
            document.getElementById('fname').value = fname;
            document.getElementById('dob').value = dob;
            document.getElementById('phoneNo').value = phoneNo;
            document.getElementById('uname').value = uname;
            document.getElementById('upassword').value = upassword;
            document.getElementById('father').value = father;
            document.getElementById('mother').value = mother;
            document.getElementById('branch').value = branch;
            document.getElementById('aadhar').value = aadhar;
            document.getElementById('gender').value = gender;
            document.getElementById('studId').value = studentId;
        }
        function closeModal() {
            document.getElementById('editModal').style.display = 'none';
        }

        function deleteStudent() {
            var confirmDelete = confirm("Are you sure you want to delete this student?");
            if (confirmDelete) {
                var studentUname = document.getElementById('uname').value;
                var form = document.createElement('form');
                form.action = 'AdminDeleteStudent-servlet';
                form.method = 'POST';

                var input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'studentUname';
                input.value = studentUname;

                form.appendChild(input);

                document.body.appendChild(form);
                form.submit();

                closeModal();
            }
        }
    </script>
    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</div>

</body>
</html>
