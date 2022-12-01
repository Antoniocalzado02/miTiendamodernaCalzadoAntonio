package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacaranda.accesoDatos.UserDAO;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		//Parametros que me han mandado
		String name = request.getParameter("user");
		String password = Login.getMD5(request.getParameter("pass"));
		
		try {
			String cName = request.getParameter("cName");
			LocalDateTime birthdayToConvert = LocalDateTime.of(LocalDate.parse(request.getParameter("birthday")),LocalTime.now());
			LocalDate birthday=birthdayToConvert.toLocalDate();
			String gender = request.getParameter("gender");
			long edad=ChronoUnit.YEARS.between(birthday, LocalDate.now());
			long mayor=18;
			//Si ya existe ese user le digo que ya esta
			if (UserDAO.findUser(name) != null && edad>=mayor) {
				out.print("<html><link rel=\"stylesheet\" href=\"styles/index.css\"></head><body><h1>There is already an user with this name</h1>"
							+ "<form action=\"index.jsp\" method=\"post\">\r\n"
							+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
							+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
							+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
							+ "	</body></form>"
							+ "</html>");
			} 
			//Si devuelve boolean el metodo de addUser le muestro que se ha creado
			else if (UserDAO.addUser(name, password, cName, birthday, gender) && edad>=mayor) {
				out.print("<html><link rel=\"stylesheet\" href=\"styles/index.css\"></head><body><h1>User created</h1>"
						+ "<form action=\"index.jsp\" method=\"post\">\r\n"
						+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
						+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
						+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
						+ "	</body></form>"
						+ "</html>");
			} 
			//Si devolviera false le doy un error
			else {
				out.print("<html><link rel=\"stylesheet\" href=\"styles/index.css\"></head><body><h1>It seems there was a problem...</h1>"
						+ "<form action=\"index.jsp\" method=\"post\">\r\n"
						+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
						+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
						+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
						+ "	</form>"
						+ "</body></html>");
			}
			
		//Si hay error en la bd le digo
		} catch (Exception e) {
			out.println("<html><link rel=\"stylesheet\" href=\"styles/index.css\"></head><body><h1>Problem connecting with database</h1>"
						+ "<form action=\"index.jsp\" method=\"post\">\r\n"
						+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
						+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
						+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
						+ "	</form>"
						+ "<body></html>");
		}

	}

}
