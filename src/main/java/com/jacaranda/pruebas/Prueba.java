package com.jacaranda.pruebas;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import com.jacaranda.accesoDatos.ArticleDAO;
import com.jacaranda.accesoDatos.BuyDAO;
import com.jacaranda.accesoDatos.CategoryDAO;
import com.jacaranda.accesoDatos.UserDAO;
import com.jacaranda.logica.Article;
import com.jacaranda.logica.Buy;
import com.jacaranda.logica.Category;
import com.jacaranda.logica.User;

public class Prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println(UserDAO.addUser("Zari", "zari", "Fernando", LocalDate.now(), "M"));
//		Article a=ArticleDAO.findArticle(1);
//		User u=UserDAO.findUser("javi");
//
//		Buy b=BuyDAO.findBuy(a,u);
//		System.out.println(b);
	}

}
