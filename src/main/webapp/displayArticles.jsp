<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.article.Article" %>
<%@ page import="com.article.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Articles</title>
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
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e0e0e0;
        }
        .container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            margin-right:1100px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>List of Articles</h1>
     <div class="container text-center mt-2">
            <a href="admin.jsp" class="btn btn-primary">Home</a>
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
   
            Session session2 = FactoryProvider.getFactory().openSession();
            
            try {
                session2.beginTransaction();
                List<Article> articles = session2.createQuery("from Article").getResultList();
                
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
                session2.getTransaction().commit();
            } finally {
                if (session2 != null && session2.isOpen()) {
                    session2.close();
                }
            }
        %>
       
    </table>
</body>
</html>
