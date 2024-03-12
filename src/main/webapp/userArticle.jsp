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
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #007bff;
            text-align: center;
            padding: 20px;
            background-color: #fff;
            margin: 0;
            border-bottom: 1px solid #dee2e6;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #dee2e6;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .comment-box {
            margin-top: 20px;
            background-color: #fff;
            border: 1px solid #dee2e6;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            resize: vertical;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            margin-right: 5px;
            border-radius: 5px;
        }

        button:hover {
            background-color: #0056b3;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f2f2f2;
            border-radius: 5px;
        }

        .comment-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .comment-text {
            flex-grow: 1;
        }

        .container {
            text-align: center;
            margin: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
            cursor: pointer;
            margin-right:1000px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <h1>List of Articles</h1>
     <div class="container">
        <a href="userlogin.jsp" class="btn btn-primary">Back</a>
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
                <tr>
                    <td colspan="7">
                        <!-- Comment Box for the current article -->
                        <div class="comment-box">
                            <h2>Comments</h2>
                            <ul id="commentList_<%= article.getId() %>"></ul>
                            <textarea id="commentText_<%= article.getId() %>" rows="4" cols="50" placeholder="Add a comment"></textarea>
                            <br>
                            <button onclick="addComment('<%= article.getId() %>')">Add Comment</button>
                        </div>
                    </td>
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

   

    <script>
        function addComment(articleId) {
            var commentText = document.getElementById("commentText_" + articleId).value;
            if (commentText.trim() !== "") {
                var commentList = document.getElementById("commentList_" + articleId);
                var commentItem = document.createElement("li");
                commentItem.classList.add("comment-item");
                commentItem.innerHTML = `
                    <div class="comment-text">${commentText}</div>
                    <button onclick="deleteComment(this)">Delete</button>
                `;
                commentList.appendChild(commentItem);
                document.getElementById("commentText_" + articleId).value = "";

                // Display a pop-up message
                alert("Comment added successfully!");
            }
        }

        function deleteComment(button) {
            var commentItem = button.parentNode;
            commentItem.parentNode.removeChild(commentItem);
        }
    </script>
</body>

</html>
