<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/10/2023
  Time: 9:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADMIN</title>
</head>
<body>

<form action="admin-servlet" method="post">
    Verify yourself as admin
    Enter Username : <input type="text" name="uname"><br>
    <br>
    Enter Password : <input type="password" name="upassword"><br>
    <br>
    <input type="submit" value="login">

</form>

</body>
</html>
