<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!String sem,query,q1; 


int i;%>
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
<h2>FAILED STUDENTS ARE:</h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr>

</tr>
<tr  bgcolor="#FFC300">
<%int i=3,j=0;
String sem=(String) session.getAttribute("Semester");
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
query="select usn,sname,grandtotal,percentage,result from 2017_sem"+sem+" where result='fail';";
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

<td><%=resultSet.getString("usn") %></td>
<td><%=resultSet.getString("sname") %></td>
<td><%=resultSet.getInt("grandtotal") %></td>
<td><%=resultSet.getFloat("percentage") %></td>
<td><%=resultSet.getString("result") %></td>

</tr>

<%  }
%></table>
<br>
<br>
<br>
<input type="button" value="back" onclick="history.back()">
 <%
} catch (Exception e) {
e.printStackTrace();
}
%>

</html>