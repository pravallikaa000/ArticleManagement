<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Library Management</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: 'Verdana', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            padding: 20px 0;
            background-color: #ecf0f1;
            color: #3498db;
            margin: 0;
            border-bottom: 2px solid #bdc3c7;
        }

        .welcome-message {
            text-align: center;
            margin-bottom: 20px;
            font-size: 18px;
            color: #7f8c8d;
        }

        .operation-links {
            text-align: center;
            margin-top: 20px;
        }

        .operation-links a {
            text-decoration: none;
            padding: 15px 30px;
            background-color: #3498db;
            color: #fff;
            border: 2px solid #2980b9;
            border-radius: 8px;
            transition: background-color 0.3s;
            display: inline-block;
            font-size: 18px;
            font-weight: bold;
            margin: 10px;
        }

        .operation-links a:hover {
            background-color: #2980b9;
        }

        .back-button {
            margin-top: 20px;
        }

        .back-button a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #2ecc71;
            color: #fff;
            border: 2px solid #27ae60;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        .back-button a:hover {
            background-color: #27ae60;
        }
    </style>
</head>

<body>
    <h1>Article Management</h1>

    <div class="welcome-message">
        <p>Welcome, Admin!</p>
    </div>
    <div class="operation-links">
        <!-- Article Management Links -->
        <a href="addArticle.jsp">Add Article</a>
        <a href="updateArticle.jsp">Update Article</a>
        <a href="displayArticles.jsp">Display Articles</a>
        <a href="deleteArticle.jsp">Delete Article</a>
    </div>

    <div class="back-button">
        <a href="index.jsp">Back</a>
    </div>
</body>

</html>
