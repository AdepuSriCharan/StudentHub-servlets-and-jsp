<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
  <title>Jbit Student Login</title>

  <style>
    body {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-color: #333; /* Dark background color */
      margin: 0;
      color: #fff; /* Light text color */
      font-family: Arial, sans-serif; /* Set a fallback font */
    }

    #main-content {
      text-align: center;
    }

    h1 {
      margin-bottom: 20px;
    }

    button {
      font-size: 20px;
      margin: 10px;
      padding: 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      background-color: #555; /* Dark button background color */
      color: #fff; /* Light text color */
      width: 150px; /* Set a slightly larger width for the buttons */
      transition: background-color 0.3s;
    }

    button:hover {
      background-color: #777;
    }

    input[type="submit"] {
      background-color: #4caf50;
      color: #fff;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>

<div id="main-content">
  <h1>Welcome to Jbit Students Page</h1><br>
</div>

<button type="button" onclick="redirectToSignInPage()">Sign In</button>

<script>
  function redirectToSignInPage() {
    window.location.href = "signin.jsp";
  }
</script>

<br>

<button type="button" onclick="redirectToSignupPage()">Sign up</button>

<script>
  function redirectToSignupPage() {
    window.location.href = "signup.jsp";
  }
</script>

</body>
</html>
