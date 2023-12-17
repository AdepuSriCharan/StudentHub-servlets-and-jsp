<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/16/2023
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- logout-confirmation.jsp --%>
<html>
<head>
  <title>Logout </title>
  <meta http-equiv="expires" content="0">
  <meta http-equiv="pragma" content="no-cache">
  <%-- Additional styling or other head content --%>

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
      width: 100%; /* Make buttons equal in width */
      transition: background-color 0.3s;
    }

    button:hover {
      background-color: #777;
    }

    h1, p {
      margin-bottom: 10px;
    }

    input[type="submit"] {
      background-color: #4caf50;
      color: #fff;
      cursor: pointer;
      padding: 10px;
      border: none;
      border-radius: 4px;
      width: 10%; /* Make submit button equal in width */
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>

</head>
<body>
<p>You have successfully logged out.</p>
<p>Redirecting to the home page...</p>
<%
  response.setHeader("Refresh", "2; URL=index.jsp");
%>
</body>
</html>

