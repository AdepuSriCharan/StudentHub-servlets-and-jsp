<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>

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
        .eye-icon {
            position: absolute;
            top: 50%;
            right: 5px;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>

    <script>
        function validateSignUpForm() {
            var username = document.forms["signupForm"]["uname"].value;
            var password = document.forms["signupForm"]["upassword"].value;
            var dob = document.forms["signupForm"]["dob"].value;
            var phoneNo = document.forms["signupForm"]["phoneNo"].value;

            if (!username || !password || !dob || !phoneNo) {
                alert("All fields must be filled");
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
            var dobRegex = /^\d{2}-\d{2}-\d{4}$/;
            if (!dob.match(dobRegex)) {
                alert("Date of Birth should be in '00-00-0000' format");
                return false;
            }
            var phoneRegex = /^\d{10}$/;
            if (!phoneNo.match(phoneRegex)) {
                alert("Phone number should be 10 digits");
                return false;
            }
            return true;
        }

        function togglePasswordVisibility() {
            var passwordInput = document.getElementById("passwordInput");
            var eyeIcon = document.getElementById("eyeIcon");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.src = "https://img.icons8.com/android/24/000000/invisible.png";
            } else {
                passwordInput.type = "password";
                eyeIcon.src = "https://img.icons8.com/android/24/000000/visible.png";
            }
        }
    </script>

</head>
<body>

<div id="main-content">
    <div class="form-container">
        <h2>Sign Up</h2>
        <form id="signupForm" action="signup-servlet" method="post" onsubmit="return validateSignUpForm()">
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
                <input type="password" name="upassword" id="passwordInput">
                <img src="https://img.icons8.com/android/24/000000/visible.png" class="eye-icon" id="eyeIcon" onclick="togglePasswordVisibility()">
            </label>

            <input type="submit" value="Sign Up">
        </form>
    </div>
</div>

</body>
</html>
