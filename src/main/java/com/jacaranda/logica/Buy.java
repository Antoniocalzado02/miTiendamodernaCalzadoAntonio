package com.jacaranda.logica;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="BUY")
@IdClass(BuyId.class)
public class Buy {

	@Id
	@ManyToOne
	@JoinColumn(name = "id_article")
	private Article id_article;
	@Id
	@ManyToOne
	@JoinColumn(name = "user_name")
	private User user_name;
	private double price;
	@Id
	private LocalDateTime buy_date;
	private int cant;

	public Buy(Article id_article, User user_name, double price, LocalDateTime buy_date, int cant) {
		super();
		this.id_article = id_article;
		this.user_name = user_name;
		this.price = price;
		this.buy_date = buy_date;
		this.cant = cant;
	}
	
	public Buy() {
		super();
	}

	public Article getId_article() {
		return id_article;
	}

	public void setId_article(Article id_article) {
		this.id_article = id_article;
	}

	public User getUser_name() {
		return user_name;
	}

	public void setUser_name(User user_name) {
		this.user_name = user_name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public LocalDateTime getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(LocalDateTime buy_date) {
		this.buy_date = buy_date;
	}

	public int getCant() {
		return cant;
	}

	public void setCant(int cant) {
		this.cant = cant;
	}

	
	
}
