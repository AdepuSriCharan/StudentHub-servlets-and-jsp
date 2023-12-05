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
<form action="login-servlet" method="Get">
    Enter Username : <input type="text" name="uname"><br>
    <br>
    Enter Password : <input type="password" name="upassword"><br>
    <br>
    <input type="submit" value="login">

</form>

</body>
</html>
