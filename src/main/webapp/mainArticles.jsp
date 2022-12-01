<%@page import="com.jacaranda.accesoDatos.BuyDAO"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.jacaranda.logica.Carro"%>
<%@page import="com.jacaranda.accesoDatos.UserDAO"%>
<%@page import="com.jacaranda.logica.User"%>
<%@page import="com.jacaranda.accesoDatos.CategoryDAO"%>
<%@page import="com.jacaranda.logica.Category"%>
<%@page import="com.jacaranda.logica.Article"%>
<%@page import="com.jacaranda.logica.Buy"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/mainArticles.css">
<meta charset="UTF-8">
<title>Articles</title>
</head>
<body>

	<%
	//Creo la sesion para recoger los atributos que tenï¿½a en el login
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	Carro cart = (Carro) sesion.getAttribute("carrito");

	//Cojo el id de categorï¿½a que me han mandado para mostrar sus articulos
	int id = Integer.parseInt(request.getParameter("id"));
	Category c = CategoryDAO.findCategory(id);

	//Le añado a la sesion el idCat que me va a hacer falta despues
	sesion.setAttribute("idCat", id);

	//Si el nomnbre o password son nulos le redirijo al error
	if (name == null || password == null) {
		response.sendRedirect("error.jsp");
	}
	//Si los datos son validos empiezo a procesar:
	else {
		//Con esos atributos busco y guardo ese user
		User u = UserDAO.findUser(name);
	%>
	<h1>
		Usuario:
		<%=name%></h1>
	<div id=cat>
		<h2>
			Category:
			<%=c.getName()%></h2>
	</div>
	<%
	//Si es admin le saco que pueda aï¿½adir article
	if (u.isAdmin()) {
	%>

	<a href="addArticle.jsp?id=<%=id%>">
		<button>Add new product</button>
	</a>
	<br>

	<%
	}
	%>


	<table border="1">
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Description</td>
			<td>Price</td>
			<td>Id_cat</td>
			<td>Stock</td>
			<td>
		</tr>
		<%
		//Hago una lista con los productos de esa categoria
		List<Article> list = c.getArticleList();
		for (Article a : list) {
		%>
		<tr>
			<!-- Muestro datos por cada articulo -->
			<td><%=a.getId()%></td>
			<td><%=a.getName()%></td>
			<td><%=a.getDescription()%></td>
			<td><%=a.getPrice()%></td>
			<td><%=a.getId_cat().getId_cat()%></td>
			<td><%=a.getStock()%></td>
			<td>
				<!-- En este campo le esta el form para añadir al carrito
				 Manda el id de ese articulo y una cantidad -->
				<form action="addToCart.jsp" class="formBuy" method="post"
					id="formCarrito">
					<input type="number" name="cant" id="cant" placeholder="Quantity">
					<input type="number" value=<%=a.getId()%> name="idArticle"
						hidden=""> <input type="submit" value="Add"
						id="cantButton">
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<div class="botones">
		<!-- Form oculto para volver al login con esos atributos -->
		<form action="Login" method="post">
			<input type="text" value=<%=name%> name="user" hidden=""> <input
				type="text" value=<%=password%> name="password" hidden=""> <input
				type="submit" name="boton" id="boton" value="Go back">
		</form>
		<!-- Manda a la lista del carro para finalizar compra -->
		<form action="execBuy.jsp" method="post">
			<input type="submit" name="botonCart" id="botonCart" value="Purchase">
		</form>
	</div>
	<%
	}
	%>
	<script src="articles.js"></script>
</body>
</html>