package com.jacaranda.logica;


import java.util.ArrayList;
import java.util.Objects;

public class Carro {
	
	private ArrayList<ItemCarrito> listaArts;

	public Carro() {
		super();
		listaArts=new ArrayList<ItemCarrito>();
	}

	public ArrayList<ItemCarrito> getListaArts() {
		return listaArts;
	}
	
	public boolean addItem(ItemCarrito item) {
		return listaArts.add(item);
	}

	@Override
	public int hashCode() {
		return Objects.hash(listaArts);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Carro other = (Carro) obj;
		return Objects.equals(listaArts, other.listaArts);
	}

	@Override
	public String toString() {
		return "Carro [listaArts=" + listaArts + "]";
	}

	
	
}
