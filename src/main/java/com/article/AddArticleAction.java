package com.article;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.article.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import com.article.Article;

public class AddArticleAction extends ActionSupport {
    private Article article = new Article();

    public String post() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.persist(article);
            tx.commit();
            addActionMessage("Article added successfully!");
            return SUCCESS;
        } catch (Exception e) {
            // Rollback the transaction in case of an exception
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            // Handle any exceptions that occur during the article addition process
            addActionError("Error adding article: " + e.getMessage());
            return ERROR;
        } finally {
            // Close the Hibernate session
            session.close();
        }
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}