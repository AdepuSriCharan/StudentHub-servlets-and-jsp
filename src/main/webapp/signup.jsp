
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
Hello this is sign up page

<form action="signup-servlet" method="Post">
    Full Name      : <input type="text" name="fname"><br>
    <br>
    Date Of Birth  : <input type="text" name="dob"><br>
    <br>
    Phone No.      : <input type="text" name="phoneNo"><br>
    <br>
    Enter Username : <input type="text" name="uname"><br>
    <br>
    Enter Password : <input type="password" name="upassword"><br>
    <br>
    <input type="submit" value="sign up">

</form>

</body>
</html>
