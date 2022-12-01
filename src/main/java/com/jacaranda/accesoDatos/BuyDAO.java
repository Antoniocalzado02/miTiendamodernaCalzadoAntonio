package com.jacaranda.accesoDatos;

import java.time.LocalDateTime;

import java.util.List;

import org.hibernate.Session;

import com.jacaranda.logica.Article;
import com.jacaranda.logica.Buy;
import com.jacaranda.logica.BuyId;
import com.jacaranda.logica.User;

public class BuyDAO {

	public static boolean addBuy(Article id_article, User user_name, double price, LocalDateTime buy_date, int cant) {
		Session session = ConnectionBD.getSession();
		Buy b = new Buy(id_article, user_name, price, buy_date, cant);
		boolean resul = false;
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(b);
			session.getTransaction().commit();
			resul = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}
		return resul;

	}

	public static Buy findBuy(Article id_article, User user_name) {
		Session session = ConnectionBD.getSession();
		BuyId id = new BuyId(id_article.getId(), user_name.getName());
		Buy b = null;
		b = (Buy) session.get(Buy.class, id);
		return b;
	}

	public static List<Buy> artsCompradosPor(User user_name) {
		Session session = ConnectionBD.getSession();
		List<Buy> arts = (List<Buy>) session
				.createQuery("From BUY b " + " where b.user_name=:user_name order by b.buy_date DESC", Buy.class)
				.setParameter("user_name", user_name).list();
		return arts;

	}
}
