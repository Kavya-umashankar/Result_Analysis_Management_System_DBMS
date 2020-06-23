import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
public class Display extends HttpServlet {
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "globalise";
	String userId = "root";
	String password = "root";
	String query;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generate
		try {
			Class.forName(driverName);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
			response.setContentType("text/html");
			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
			PrintWriter p = response.getWriter();
			p.write("<html><body><table>");
			p.write("<tr bgcolor=\"#FFC300\">");
			p.write("<td>COURSEID</td>");
			p.write("<td>Faculty_name</td>");
		try{ 
					connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
					statement=connection.createStatement();
					String usn= request.getParameter("usn");
					query="select *from cf1;";

					resultSet= statement.executeQuery(query);
					while(resultSet.next()) {
					p.write("<td>"+resultSet.getString("course_id")+"</td>");
					p.write("<td>"+resultSet.getString("fname")+"</td>");
					}


			}
		catch (Exception e) {
		e.printStackTrace();
		}
		p.write("</table></body></html>");
		
		}

}
