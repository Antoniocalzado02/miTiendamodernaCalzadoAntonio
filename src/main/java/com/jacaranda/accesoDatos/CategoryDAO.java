package com.jacaranda.accesoDatos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import com.jacaranda.logica.Article;
import com.jacaranda.logica.Category;

public class CategoryDAO {


	public static boolean addCategory(Category c) {
		Session sesion = ConnectionBD.getSession();
		boolean resul = false;
		try {
			sesion.getTransaction().begin();
			sesion.saveOrUpdate(c);
			sesion.getTransaction().commit();
			// Si hace el commit significa que no ha habido error y pongo true
			resul = true;
		} catch (Exception e) {
			sesion.getTransaction().rollback();
			System.out.println(e.getMessage());
		}
		return resul;
	}

	public static Category findCategory(int id) {
		Session sesion = ConnectionBD.getSession();
		Category aux = null;
		try {
			aux = sesion.get(Category.class, id);
		} catch (Exception e) {
			sesion.getTransaction().rollback();
			System.out.println(e.getMessage());
		}
		return aux;
	}

	public static List<Category> devuelveCategories() {
		Session sesion = ConnectionBD.getSession();
		Query query = sesion.createQuery("SELECT a FROM com.jacaranda.logica.Category a");
		List<Category> conjunto = (List<Category>) query.getResultList();
		return conjunto;
	}
}
