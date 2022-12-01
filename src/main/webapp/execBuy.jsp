<%@page import="com.jacaranda.logica.Article"%>
<%@page import="com.jacaranda.accesoDatos.ArticleDAO"%>
<%@page import="com.jacaranda.logica.ItemCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.jacaranda.logica.Carro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy</title>
<link rel="stylesheet" href="styles/mainArticles.css">
</head>
<body>
	<%
	//Recupero atributos de sesion
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	Carro cart = (Carro) sesion.getAttribute("carrito");

	//Creo una lista con los articulos que tiene el carrito
	ArrayList<ItemCarrito> list = cart.getListaArts();
	

	//Variable que va a mostrar el precio total
	double totalPrice = 0;
	%>
	<h2>You are going to purchase the following items</h2>
	<table border="1">
		<tr>
			<td>Id_Article</td>
			<td>Id_Cat</td>
			<td>Price</td>
			<td>Name</td>
			<td>Quantity</td>
		</tr>
		<%
		for (ItemCarrito i : list) {
			//Por cada item de la lista busco ese articulo
			Article a = ArticleDAO.findArticle(i.getId_article());
			//Sumo al total su precio por la cantidad
			totalPrice += a.getPrice() * i.getCant();
		%>
		<tr>
			<!-- Muestro datos -->
			<td><%=i.getId_article()%></td>
			<td><%=a.getId_cat().getId_cat()%></td>
			<td><%=a.getPrice()%></td>
			<td><%=a.getName()%></td>
			<td><%=i.getCant()%></td>
		</tr>

		<%
		}
		%>
	</table>
	<h3>
		Price of your cart:
		<%=Math.round(totalPrice * 100.0) / 100.0%>$
	</h3>

	<div class=botones>
		<form action="Login" method="post">
			<input type="text" value=<%=name%> name="user" hidden=""> <input
				type="text" value=<%=password%> name="password" hidden=""> <input
				type="submit" name="boton" id="boton" value="Go to main page">
		</form>
		<!-- Manda a la pagina donde se ejecuta la compra -->
		<form action="buyComplete.jsp" method="post">
			<input type="submit" name="boton" id="bot" value="Purchase">

		</form>
	</div>
</body>
</html>