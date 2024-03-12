<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Article</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #343a40;
            text-align: center;
            padding: 20px 0;
            background-color: #6c757d;
            color: #fff;
            margin: 0;
        }
        .form-container {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
            overflow: hidden;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #343a40;
        }
        .form-group input[type="text"], .form-group input[type="date"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ced4da;
            border-radius: 3px;
        }
        .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ced4da;
            border-radius: 3px;
            resize: vertical;
        }
        .form-group input[type="submit"] {
            background-color: #6c757d;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #5a6268;
        }
        .form-group .redirect-button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 20px;
        }
        .form-group .redirect-button:hover {
            background-color: #0056b3;
        }
        .myButton {
      display: inline-block;
      padding: 10px 20px;
      font-size: 16px;
      text-align: center;
      text-decoration: none;
      cursor: pointer;
      outline: none;
      border: 2px solid #4CAF50;
      background-color: #4CAF50;
      color: white;
      border-radius: 5px;
      margin-left:30px;
      margin-top:20px;
    }

    
    </style>
</head>
<body>
    
    <h1>Add Article</h1>
    <button class="myButton" onclick="redirectToAdmin()">Home</button>
    
    <div class="form-container">
        <form action="AddArticleAction" method="post">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" name="article.title" required />
            </div>
            <div class="form-group">
                <label for="content">Content:</label>
                <textarea name="article.content" rows="8" required></textarea>
            </div>
            <div class="form-group">
                <label for="publicationDate">Publication Date:</label>
                <input type="date" name="article.publicationDate" required />
            </div>
            <div class="form-group">
                <label for="author">Author:</label>
                <input type="text" name="article.author" required />
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" name="article.category" required />
            </div>
            <div class="form-group">
                <label for="expirationDate">Expiration Date:</label>
                <input type="date" name="article.expirationDate" required />
            </div>
            <div class="form-group">
                <input type="submit" value="Add Article" />
            </div>
        </form>
    </div>
     <script>
    // JavaScript function to redirect to admin.jsp
    function redirectToAdmin() {
      window.location.href = 'admin.jsp';
    }
  </script>
</body>
</html>
