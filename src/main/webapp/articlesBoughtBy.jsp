<%@page import="com.jacaranda.accesoDatos.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.logica.Carro"%>
<%@page import="com.jacaranda.logica.User"%>
<%@page import="com.jacaranda.logica.Buy"%>
<%@page import="com.jacaranda.accesoDatos.BuyDAO"%>

<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>You Have Bought</title>
<link rel="stylesheet" href="styles/mainArticles.css">
</head>
<body>
	<%
	//Creo la sesion para recoger los atributos que ten�a en el login
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	Carro cart = (Carro) sesion.getAttribute("carrito");
	%>

	<%
	User u = UserDAO.findUser(name);
	%>
	<h2>
		Articles bought by
		<%=u.getName()%></h2>
	<table border="1">
		<tr>
			<td>Id_Article</td>
			<td>Name_User</td>
			<td>Date of buy</td>
			<td>Quantity</td>
			<td>Price</td>
		</tr>

		<%
		List<Buy> arts = BuyDAO.artsCompradosPor(u);
		for (Buy b : arts) {
		%>
		<tr>
			<td><%=b.getId_article().getId()%></td>
			<td><%=b.getUser_name().getName()%></td>
			<td><%=b.getBuy_date()%></td>
			<td><%=b.getCant()%></td>
			<td><%=b.getPrice()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<form action="Login" method="post">
		<input type="text" value=<%=name%> name="user" hidden=""> <input
			type="text" value=<%=password%> name="password" hidden=""> <input
			type="submit" name="boton" id="boton" value="Go back">
	</form>
</body>
</html>