<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <s:head />
    <style>
        body {
            background-color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
            color: #555;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            font-family: 'Arial', sans-serif; /* Same font as body */
        }

        .error { 
            border: 1px solid #d9534f;
            background-color: #f2dede;
        }

        .inputField { 
            margin-bottom: 15px; 
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s;
            color: #555;
            font-family: 'Arial', sans-serif; /* Same font as body */
        }

        .inputField:focus {
            border-color: #4cae4c;
            outline: none;
        }

        .submitBtn {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            font-family: 'Arial', sans-serif; /* Same font as body */
        }

        .submitBtn:hover {
            background-color: #45a049;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #007bff; /* Blue */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-family: 'Arial', sans-serif; /* Same font as body */
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <a href="index.jsp" class="back-button">Back</a>

    <div class="form-container">
        <h2>Admin Login</h2>
        <s:form action="adminLogin" method="post">
            <s:textfield name="userName" label="Username"  required="true" cssClass="inputField" />
            <br>
            <s:password name="password" label="Password" required="true" cssClass="inputField" />
            <br>
            <s:submit value="Login" cssClass="submitBtn" />
        </s:form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var usernameField = document.getElementById('userName');
            var passwordField = document.getElementById('password');
            
            usernameField.addEventListener('blur', function () {
                if (usernameField.value.trim() === '') {
                    usernameField.classList.add('error');
                } else {
                    usernameField.classList.remove('error');
                }
            });

            passwordField.addEventListener('blur', function () {
                if (passwordField.value.trim() === '') {
                    passwordField.classList.add('error');
                } else {
                    passwordField.classList.remove('error');
                }
            });
        });
    </script>
</body>

</html>
