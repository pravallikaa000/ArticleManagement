package com.article;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.opensymphony.xwork2.ActionSupport;
import com.article.Article;

public class UpdateArticleAction extends ActionSupport {
    private int id;
    private Article article;

    public String post() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // Fetch the existing article from the database using ID
            Article existingArticle = session.get(Article.class, id);

            if (existingArticle != null) {
                // Update the article details
                existingArticle.setId(id);
                existingArticle.setTitle(article.getTitle());
                existingArticle.setContent(article.getContent());
                existingArticle.setPublicationDate(article.getPublicationDate());
                existingArticle.setAuthor(article.getAuthor());
                existingArticle.setCategory(article.getCategory());
                existingArticle.setExpirationDate(article.getExpirationDate());

                // Save the changes
                session.merge(existingArticle);

                tx.commit();
                addActionMessage("Article updated successfully!");
                return SUCCESS;
            } else {
                addActionError("Article with ID " + id + " not found.");
                return ERROR;
            }
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error updating article: " + e.getMessage());
            return ERROR;
        } finally {
            session.close();
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}
