<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

        button {
            font-size: 20px;
            margin: 10px;
        }
    </style>

</head>
<body>

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
