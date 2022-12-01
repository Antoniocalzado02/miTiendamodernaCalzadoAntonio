package com.jacaranda.accesoDatos;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.jacaranda.logica.Article;

public class ArticleDAO {

	public static boolean addArticle(Article a) {
		Session session = ConnectionBD.getSession();
		boolean resul = false;
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(a);
			session.getTransaction().commit();
			// Si hace el commit significa que no ha habido error y pongo true
			resul = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}
		return resul;
	}

	public static boolean deleteArticle(int id) {
		Session session = ConnectionBD.getSession();
		boolean resul = false;
		try {
			Article a = (Article) session.get(Article.class, id);
			session.getTransaction().begin();
			session.delete(a);
			session.getTransaction().commit();
			// Si hace el commit significa que no ha habido error y pongo true
			resul = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}
		return resul;
	}

	public static Article findArticle(int id) {
		Session session = ConnectionBD.getSession();
		Article a = null;
		a = (Article) session.get(Article.class, id);
		return a;
	}

	public static boolean changeStock(int cant, int id) {
		Session session = ConnectionBD.getSession();
		boolean resul = false;
		try {
			Article a = findArticle(id);
			a.setStock(cant);
			session.getTransaction().begin();
			session.saveOrUpdate(a);
			session.getTransaction().commit();
			// Si hace el commit significa que no ha habido error y pongo true
			resul = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}
		return resul;
	}

}
