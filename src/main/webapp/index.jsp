<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.net.URI"%>
<%@page import="com.jacaranda.logica.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<link rel="stylesheet" href="styles/index.css">
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String backUrl = request.getHeader("referer");
	//Inicializo el carro que va a tener en la session
	Carro cart = new Carro();
	sesion.setAttribute("carrito", cart);
	//Si la url de la que viene es null invalido la session para que tengan que hacer que login
	if (backUrl != null) {
		//Anulo y vuelvo a crear una session y carrito diferentes
		sesion.invalidate();
		sesion = request.getSession();
		cart = new Carro();
		sesion.setAttribute("carrito", cart);
	}
	%>

	<div id="loginData">
		<form action="Login" method="post" id="form">
			<p id="login">miTienda</p>
			<div id="divUser">
				User<br> <input type="text" required id="user" name="user">
			</div>

			<div id="divPass">
				Password<br> <input type="password" required id="password"
					name="password">
			</div>
			<br> <input type="submit" value="Iniciar Sesión" id="boton">
		</form>
	</div>
	<br>
	<div id="register">
		<a href="register.jsp">Sign Here!</a>
	</div>



</body>
</html>