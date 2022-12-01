<%@page import="com.jacaranda.accesoDatos.CategoryDAO"%>
<%@page import="com.jacaranda.logica.*"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Article</title>
<link rel="stylesheet" href="styles/register.css">
</head>
<body>
	<h1>Add a product</h1>

	<%
	
	List<Category> list = CategoryDAO.devuelveCategories();
	HttpSession sesion = request.getSession();
	int id = Integer.parseInt(request.getParameter("id"));
	Category c=CategoryDAO.findCategory(id);
	%>


	<form action="execAdd.jsp" method="post">
		<label>Id</label><br> 
		<input type="number" name="idArticle"
			id="idArticle" min="1" required><br> <label>Name</label><br>
		<input type="text" id="name" name="name" required><br> <label>Description</label><br>
		<input type="text" name="desc" id="desc" required><br> 
		<label>Price</label><br>
		<input type="number" min="1" step=".01" id="price" name="price" required>
		<input type="number" id="id_cat" name="id_cat" value="<%=c.getId_cat()%>" hidden=""></input><br>
		<br> <input type="submit" name="boton" id="bot" value="Enviar">
	</form>
	<br>
	<a href="mainArticles.jsp?id=<%=c.getId_cat()%>">
		<button>Go back</button>
	</a>
</body>
</html>