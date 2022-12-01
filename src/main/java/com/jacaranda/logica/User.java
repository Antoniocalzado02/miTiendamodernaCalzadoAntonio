package com.jacaranda.logica;

import java.time.LocalDate;


import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name = "USER")
public class User {

	@Id
	@Column(name = "user_name")
	private String name;
	private String password;
	private String complete_name;
	private LocalDate birthday;
	private String gender;
	private boolean admin;
	@OneToMany(mappedBy = "user_name", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Buy> artComprados;

	public User() {
		super();
	}

	public User(String name, String password, String completr_name, LocalDate birthday, String gender) {
		super();
		this.name = name;
		this.password = password;
		this.complete_name = completr_name;
		this.birthday = birthday;
		this.gender = gender;
		this.admin = false;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public String getCompletr_name() {
		return complete_name;
	}

	public void setCompletr_name(String completr_name) {
		this.complete_name = completr_name;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public String getComplete_name() {
		return complete_name;
	}

	public List<Buy> getArtComprados() {
		return artComprados;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	@Override
	public int hashCode() {
		return Objects.hash(name, password);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(name, other.name) && Objects.equals(password, other.password);
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", password=" + password + ", complete_name=" + complete_name + ", birthday="
				+ birthday + ", gender=" + gender + ", admin=" + admin + "]";
	}

}
