package com.jacaranda.accesoDatos;



import java.time.LocalDate;
import java.time.LocalDateTime;

import org.hibernate.Session;
import com.jacaranda.logica.User;


public class UserDAO {
	

	public static boolean validateUser(String login, String password) {
		Session session = ConnectionBD.getSession();
		boolean valid = false;
		User u = (User) session.get(User.class, login);
		if (u == null) {
			u = new User();
		} else {
			if (u.getPassword().toUpperCase().equalsIgnoreCase(password.toUpperCase())) {
				valid = true;
			}

		}
		return valid;
	}
	
	public static boolean addUser(String name, String password,String cName, LocalDate birthday, String gender) {
		Session session = ConnectionBD.getSession();
		boolean resul=false;
		User u= new User(name, password, cName, birthday, gender);
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(u);
			session.getTransaction().commit();
			resul=true;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}
		
		
		return resul;
	}
	
	public static User findUser(String name) {
		Session session = ConnectionBD.getSession();
		User u=null;
		u=(User)session.get(User.class, name);
		return u;
	}
	
}