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

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        label span {
            width: 150px; /* Adjust the width based on your preference */
            display: inline-block;
            text-align: right;
            margin-right: 10px;
        }

        input {
            margin-bottom: 10px;
        }

    </style>

</head>
<body>


<form action="signup-servlet" method="Post">
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

    <label>
        <span>Username:</span>
        <input type="text" name="uname">
    </label>

    <label>
        <span>Password:</span>
        <input type="password" name="upassword">
    </label>

    <input type="submit" value="Sign up">
</form>

</body>
</html>
