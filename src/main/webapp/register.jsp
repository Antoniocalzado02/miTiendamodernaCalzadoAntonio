<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="styles/register.css">
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	%>
	<div id="registerData">
		<form action="/miTiendaMartinez/Register" method="post" id="form">
			<p id="regis">Sign here in miTiendaMartinez</p>
			<div id="divUser">
				<label for="user">Enter here your user name</label><br> <input
					type="text" required id="user" name="user">
			</div><br>
			<div id="divPassword">
				<label for="pass">Enter here your password</label><br> <input
					type="password" required id="pass" name="pass">
			</div>
			<br>
			<div id="divCompleteName">
				<label for="cName">Enter here your complete name</label><br> <input
					type="text" required id="cName" name="cName">
			</div>
			<br>
			<div id="divBirthDay">
				<label for="birthday">Enter here your birthday</label><br>
				<input type="date" required id="birthday" name="birthday">
			</div>
			
			<div id="divGender">
				<br><label for=divGender >Enter here your gender</label> <br><br>
				<input
					type="radio" id="male" name="gender" value="M">  
				<label for="male">Male</label>   
				<input type="radio"
					id="female" name="gender" value="F">   <label
					for="female">Female</label>
				<input type="radio"
					id="ne" name="gender" value="N">   <label
					for="ne">I prefer don't say it</label>	
					<br>
			</div>
			<input type="submit" value="Create User"
				id="boton">
		</form>
	</div>
	<br>
	<form action="index.jsp" method="post">
		<input type="submit" name="boton" id="bot" value="Go to login">
	</form>
</body>
</html>