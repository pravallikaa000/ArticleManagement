<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.article.Article" %>
<%@ page import="com.article.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Article</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        h1 {
            color: #333;
            margin-top: 0;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #28a745; /* Green color for success */
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            margin-right:1100px;
        }
        .btn-primary:hover {
            background-color: #218838; /* Darker shade of green on hover */
        }
        form {
            width: 60%;
            margin: 20px auto;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            box-sizing: border-box;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 16px;
        }
        button {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>List of Articles</h1>
    
<table>
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Content</th>
        <th>Publication Date</th>
        <th>Author</th>
        <th>Category</th>
        <th>Expiration Date</th>
    </tr>
    
<% 
    Session session3 = FactoryProvider.getFactory().openSession();
    
    try {
        session3.beginTransaction();
        List<Article> articles = session3.createQuery("from Article").getResultList();
        
        for (Article article : articles) {
%>
    <tr>
        <td><%= article.getId() %></td>
        <td><%= article.getTitle() %></td>
        <td><%= article.getContent() %></td>
        <td><%= article.getPublicationDate() %></td>
        <td><%= article.getAuthor() %></td>
        <td><%= article.getCategory() %></td>
        <td><%= article.getExpirationDate() %></td>
    </tr>
<%
        }
        session3.getTransaction().commit();
    } finally {
        if (session3 != null && session3.isOpen()) {
            session3.close();
        }
    }
%>
    <div class="container">
        <a href="admin.jsp" class="btn btn-primary">Home</a>
    </div>
</table>

<h1>Update Article</h1>

<form action="UpdateArticleAction" method="post">
    <label for="id">Article ID:</label>
    <input type="text" id="id" name="id" placeholder="Enter Article ID" required />

    <label for="title">Title:</label>
    <input type="text" id="title" name="article.title" placeholder="Enter Title" required />

    <label for="content">Content:</label>
    <textarea id="content" name="article.content" placeholder="Enter Content" rows="8" required></textarea>

    <label for="publicationDate">Publication Date:</label>
    <input type="date" id="publicationDate" name="article.publicationDate" required />

    <label for="author">Author:</label>
    <input type="text" id="author" name="article.author" placeholder="Enter Author" required />

    <label for="category">Category:</label>
    <input type="text" id="category" name="article.category" placeholder="Enter Category" required />

    <label for="expirationDate">Expiration Date:</label>
    <input type="date" id="expirationDate" name="article.expirationDate" required />

    <button type="submit" style="background-color: #28a745;">Update Article</button>
</form>
</body>
</html>
