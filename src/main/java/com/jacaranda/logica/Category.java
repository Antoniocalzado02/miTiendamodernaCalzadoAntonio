package com.jacaranda.logica;


import javax.persistence.*;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name = "CATEGORY")
public class Category {

	@Id
	private int id_cat;
	private String name;
	private String description;
	// En el mapeo especificamos como se llama el campo fk en la clase hija
	@OneToMany(mappedBy = "id_cat", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Article> articleList;

	public Category() {
		super();
	}

	public Category(int id_cat, String name, String description) {
		super();
		this.id_cat = id_cat;
		this.name = name;
		this.description = description;
	}

	public int getId_cat() {
		return id_cat;
	}

	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
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

	public List<Article> getArticleList() {
		List<Article> list=articleList;
		return list;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Category [id_cat=" + id_cat + ", name=" + name + ", description=" + description + "]";
	}

}
