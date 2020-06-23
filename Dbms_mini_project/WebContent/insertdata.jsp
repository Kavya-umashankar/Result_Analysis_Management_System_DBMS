<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!int i=3,j=0; 
String colname;

String query,q1;

%>
<%
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
String sem=(String) session.getAttribute("Semester");
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<body>
<table>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr>

</tr>
<tr bgcolor="#FFC300">

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String dvalue = request.getParameter("value");
String upd= request.getParameter("fname");

query="insert into cf"+sem+" values('"+dvalue+"','"+upd+"')";
statement.executeUpdate(query);
out.println("<h2>THE RECORD IS inserted SUCESSFULLY!<h2>");
q1="select * from cf"+sem+";";
resultSet = statement.executeQuery(q1);
ResultSetMetaData rsmd = resultSet.getMetaData();
int count = rsmd.getColumnCount();
for(int v=1;v<=count;v++)
{
	%><td><%=rsmd.getColumnName(v)%>
	<%
}
%></tr><%
 while(resultSet.next())
 {
	 %>
		<tr bgcolor="#DEB887">

		<td><%=resultSet.getString("course_id") %></td>
		<td><%=resultSet.getString("fname") %></td>
				</tr>
		
<%
 }
}
catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<input type="button" value="back" onclick="history.back()">
</body>
</html>