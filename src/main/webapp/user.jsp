<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.article.Article" %>
<%@ page import="com.article.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Books</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
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
            <th>Scheduled</th>
            <th>Expiration Date</th>
        </tr>
        
        <% 
   
            Session session1 = FactoryProvider.getFactory().openSession();
            
            try {
                session1.beginTransaction();
                List<Article> articles = session1.createQuery("from Article").getResultList();
                
                for (Article article : articles) {
        %>
                <tr>
                	<td><%= article.getId() %></td>
                    <td><%= article.getTitle() %></td>
                    <td><%= article.getContent() %></td>
                    <td><%= article.getPublicationDate() %></td>
                    <td><%= article.getAuthor() %></td>
                    <td><%= article.getCategory() %></td>
                    <td><%= article.isScheduled() %></td>
                    <td><%= article.getExpirationDate() %></td>
                </tr>
        <%
                }
                session1.getTransaction().commit();
            } finally {
                if (session1 != null && session1.isOpen()) {
                    session1.close();
                }
            }
        %>
        <div class="container text-center mt-2">
        	<a href="index.jsp" class="btn btn-primary">Home</a>
        </div>
    </table>
</body>
</html>
