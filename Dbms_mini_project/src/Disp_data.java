import java.io.*;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.*;
import javax.*;

public class Disp_data extends HttpServlet {
	public static String driver = "com.mysql.jdbc.Driver";
	public static String url = "jdbc:mysql://localhost:3306/globalise";
	public static String uname = "root";
	public static String pwd = "root";
	Connection con= DriverManager.getConnection(url,uname,pwd);;
	public static Connection getDatabaseConnection(String driver, String url, String uname, String pwd)throws ClassNotFoundException, SQLException {
		
		Class.forName(driver);
		System.out.println("Driver Loaded Successfully");
		   
		System.out.println("Connection Established successfully");
		
	}

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
			PrintWriter p =response.getWriter();
			response.setContentType("text/html");
			//Enumeration en = request.getParameterNames();
			String parameter;
			String query = "select * from student";
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(query);
			while(rs.next()) {
					System.out.print(rs.getInt(1) + "\t");
					System.out.print(rs.getString(2) + "\t");
	
	
	
	
	}

	}
}
