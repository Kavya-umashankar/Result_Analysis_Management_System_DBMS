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
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
</tr>
<tr bgcolor="#FFC300">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

String productSelected = request.getParameter("dropdown");
String dvalue = request.getParameter("dvalue");

String upd= request.getParameter("updates");
String colval= request.getParameter("value");
out.println(productSelected);
query="update 2017_sem"+sem+" set "+upd+"="+colval+" where "+productSelected+" ='"+dvalue+"'";
statement.executeUpdate(query);
out.println("<h2>THE RECORD IS UPDATED SUCESSFULLY!<h2>");
q1="select * from 2017_sem"+sem+" where "+productSelected+"='"+dvalue+"'";
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

		<td><%=resultSet.getString("usn") %></td>
		<td><%=resultSet.getString("sname") %></td>
		<%for(i=3;i<count-1;i++)
		{%>
			<td><%=resultSet.getInt(i) %></td>
		<%}

		%>
		<td><%=resultSet.getFloat("percentage") %></td>
		<td><%=resultSet.getString("result") %></td>

		</tr>
		
<%
 }
}
catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<h3>BACK TO THE <a href="datadisplay.jsp">Database display</a>?</h3>
</body>
</html>