<%@page import="java.util.ArrayList"%>
<%@page import="com.jacaranda.accesoDatos.BuyDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.jacaranda.accesoDatos.UserDAO"%>
<%@page import="com.jacaranda.accesoDatos.ArticleDAO"%>
<%@page import="com.jacaranda.logica.Carro"%>
<%@page import="com.jacaranda.logica.User"%>
<%@page import="com.jacaranda.logica.Article"%>
<%@page import="com.jacaranda.logica.ItemCarrito"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyComplete</title>
<link rel="stylesheet" href="styles/index.css">
</head>
<body>

	<h1>Success!</h1>

	<%
	//Recojo atributos de la sesion
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	Carro cart = (Carro) sesion.getAttribute("carrito");

	//Creo una lista con los articulos del carro
	ArrayList<ItemCarrito> list = cart.getListaArts();

	for (ItemCarrito i : list) {

		//Consigo el articulo con el id
		Article a = ArticleDAO.findArticle(i.getId_article());
		//Consigo el user
		User u = UserDAO.findUser(name);
		double article_price = a.getPrice();
		int cant = i.getCant();
		//Hago la inserción en base de datos con los datos
		BuyDAO.addBuy(a, u, article_price, LocalDateTime.now().plusHours(1), cant);
		//Resto lo que me han comprado al stock
		int newCant=a.getStock()-cant;
		ArticleDAO.changeStock(newCant, a.getId());
	}
	cart.getListaArts().clear();
	%>

	<form action="Login" method="post">
		<input type="text" value=<%=name%> name="user" hidden=""> <input
			type="text" value=<%=password%> name="password" hidden=""> <input
			type="submit" name="boton" id="boton" value="Go to main page">
	</form>


</body>
</html>