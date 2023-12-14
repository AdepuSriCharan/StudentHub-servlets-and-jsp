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
            color: #4caf50;
        }

        label {
            margin-bottom: 15px;
            display: block;
        }

        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #4caf50;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #333;
            color: #fff;
            margin-bottom: 15px;
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
<div id="main-content">
    <div class="form-container">
        <h2>Verify yourself as admin</h2>
            <form action="admin-servlet" method="post">
                <label>
                    <span> Enter Username :</span>
                    <input type="text" name="uname">
                </label>
                <label>
                    <span>Enter Password : </span>
                    <input type="password" name="upassword"><br>
                </label>
                <br>
                <input type="submit" value="login">

            </form>
    </div>
</div>

</body>
</html>
