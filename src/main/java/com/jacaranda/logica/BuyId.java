package com.jacaranda.logica;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

public class BuyId implements Serializable {

	private int id_article;
	private String user_name;
	private LocalDateTime buy_date;

	public BuyId() {
		
		super();
	}

	public BuyId(int id_article, String user_name) {
		super();
		this.id_article = id_article;
		this.user_name = user_name;
	}

	public int getId_article() {
		return id_article;
	}

	public void setId_article(int id_article) {
		this.id_article = id_article;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public LocalDateTime getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(LocalDateTime buy_date) {
		this.buy_date = buy_date;
	}

	@Override
	public int hashCode() {
		return Objects.hash(buy_date, id_article, user_name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BuyId other = (BuyId) obj;
		return Objects.equals(buy_date, other.buy_date) && id_article == other.id_article
				&& Objects.equals(user_name, other.user_name);
	}

}
