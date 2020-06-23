<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!String sem,query,name,usn; %>
<%!int [] marks= new int[50];
float percentage;


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

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<body background="C:\Users\ADMIN\Desktop\image2.jpeg" style="background-repeat:no-repeat;">

<h2><font color="grey">STUDENT RESULT:</font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr>

</tr>
<tr  bgcolor="#FFC300">
<%int i=3,j=0;
sem=request.getParameter("SEM");
session.setAttribute("Semester",sem);
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String usn= request.getParameter("usn");
query="select *from 2017_sem"+sem+" where usn='"+usn+"';";

resultSet= statement.executeQuery(query);
ResultSetMetaData rsmd = resultSet.getMetaData();
int count = rsmd.getColumnCount();
for(int v=1;v<=count;v++)
{
	%><td><%=rsmd.getColumnName(v)%>
	<%
}
%></tr><%
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">
<td><%=resultSet.getString("usn")  %>
<td><%=resultSet.getString("sname") %></td>
<%for(i=3;i<count-1;i++)
{%>
	<td><%=resultSet.getInt(i) %></td>
<%}
%>
<td><%=resultSet.getFloat("percentage") %></td>
<td><%=resultSet.getString("result") %></td>

</tr>
<%  }

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<input type="button" value="back" onclick="history.back()">
</body>
</html>