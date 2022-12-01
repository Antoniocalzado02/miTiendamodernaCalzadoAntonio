<%@page import="java.util.ArrayList"%>
<%@page import="com.jacaranda.accesoDatos.ArticleDAO"%>
<%@page import="com.jacaranda.logica.ItemCarrito"%>
<%@page import="com.jacaranda.logica.Carro"%>
<%@page import="com.jacaranda.logica.Article"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Added</title>
<link rel="stylesheet" href="styles/index.css">
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");

	int idCat = (int) (sesion.getAttribute("idCat"));
	Carro cart = (Carro) sesion.getAttribute("carrito");
	int cant = Integer.parseInt(request.getParameter("cant"));
	int idArticle = Integer.parseInt(request.getParameter("idArticle"));
	ItemCarrito item = new ItemCarrito(idArticle, cant);

	//Me creo una lista con los items del carro
	ArrayList<ItemCarrito> list = cart.getListaArts();
	//Si el item no esta en la lista lo añado
	if (list.indexOf(item) == -1) {
		list.add(item);
	}
	//Si esta, le saco su pos, y a su cantidad le sumo la nueva cantidad
	//le setteo la nueva cantidad
	else {
		int pos = list.indexOf(item);
		int newCant = list.get(pos).getCant() + cant;
		list.get(pos).setCant(newCant);
	}
	%>

	<h1>Article purchased correctly</h1>
	<h4>
		Id of the article:
		<%=idArticle%></h4>
	<h4>
		Quantity you have purchased:
		<%=cant%></h4>


	<form action="mainArticles.jsp?id=<%=idCat%>" method="post">
		<input type="submit" name="boton" id="boton" value="Go back">
	</form>



</body>
</html>