<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.article.Article"%>
<%@ page import="com.article.FactoryProvider"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Article</title>
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
            margin-top: 20px;
        }

        form {
            width: 50%;
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

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 16px;
        }

        button {
            padding: 12px 20px;
            background-color: #d9534f;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            
        }

        button:hover {
            background-color: #c9302c;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .home-link {
            margin-top: 20px;
            text-align: center;
        }

        .home-link a {
            text-decoration: none;
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            margin-right:1000px;
        }

        .home-link a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>List of Articles</h1>
	<div class="home-link">
        <a href="admin.jsp">Home</a>
    </div>
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
            Session sessionDelete = FactoryProvider.getFactory().openSession();

            try {
                sessionDelete.beginTransaction();
                List<Article> articles = sessionDelete.createQuery("from Article").getResultList();

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
                sessionDelete.getTransaction().commit();
            } finally {
                if (sessionDelete != null && sessionDelete.isOpen()) {
                    sessionDelete.close();
                }
            }
        %>
    </table>

    <h1>Delete Article</h1>
    

    <form action="DeleteArticleAction" method="post">
        <label for="id">Article ID:</label>
        <input type="text" id="id" name="id" placeholder="Enter Article ID to Delete" required />

        <button type="submit">Delete Article</button>
    </form>

    
</body>
</html>
