<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!String sem,query; %>
<%String sem=request.getParameter("sem");
session.setAttribute("Semester",sem);
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "globalise";
String userId = "root";
String password = "root";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<% 
	sem=(String) session.getAttribute("Semester");
	String url;
	url=request.getParameter("url");
	String q1;
	q1="load data local infile \""+url+"\" into table "+dbName+".2017_sem5 fields terminated by ',' lines terminated by '\n';";
	try{ 
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		statement.execute(q1);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

%><html>
<body><h1>DATA LOADED SUCCESSFULLY!</h1>
<h2>visit Teachers portal to select to view it!<a href="Teacherportal.jsp">Click Here!</a></h2>
</body>
</html>