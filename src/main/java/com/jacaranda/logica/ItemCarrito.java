package com.jacaranda.logica;

import java.util.Objects;

public class ItemCarrito {

	private int id_article;
	private int cant;

	public ItemCarrito(int id_article, int cant) {
		super();
		this.id_article = id_article;
		this.cant = cant;
	}

	public int getId_article() {
		return id_article;
	}

	public void setId_article(int id_article) {
		this.id_article = id_article;
	}

	public int getCant() {
		return cant;
	}

	public void setCant(int cant) {
		this.cant = cant;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_article);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ItemCarrito other = (ItemCarrito) obj;
		return id_article == other.id_article;
	}

	@Override
	public String toString() {
		return "ItemCarrito [id_article=" + id_article + ", cant=" + cant + "]";
	}

}
