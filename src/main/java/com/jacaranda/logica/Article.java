package com.jacaranda.logica;

import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name = "ARTICLE")
public class Article {

	@Id
	private int id;
	private String name;
	private String description;
	private double price;
	private int stock;
	@ManyToOne
	@JoinColumn(name = "id_cat")
	private Category id_cat;
	@OneToMany(mappedBy = "id_article", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Buy> userCompradores;

	public Article() {
		super();
	}

	public Article(int id, String name, String description, double price,int stock, Category id_cat) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.stock=stock;
		this.id_cat = id_cat;
	}
	
	public Article(int id, String name, String description, double price, Category id_cat) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.id_cat = id_cat;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getId_cat() {
		return id_cat;
	}

	public void setId_cat(Category id_cat) {
		this.id_cat = id_cat;
	}

	public double getPrice() {
		return price;
	}
	

	public List<Buy> getUserCompradores() {
		return userCompradores;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Article other = (Article) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", stock="
				+ stock + ", id_cat=" + id_cat + "]";
	}

	
}
