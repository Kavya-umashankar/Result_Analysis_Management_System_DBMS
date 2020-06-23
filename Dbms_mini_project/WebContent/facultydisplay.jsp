<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!String sem,query; %>
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
%><table align="center" cellpadding="5" cellspacing="5" border="1">

<tr>

</tr>
<tr  bgcolor="#FFC300">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();


CallableStatement stmt=connection.prepareCall("{call getage()}");
resultSet= stmt.executeQuery();
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

<td><%=resultSet.getString("fid") %></td>
<td><%=resultSet.getString("fac_name") %></td>
<td><%=resultSet.getString("gender") %>
<td><%=resultSet.getString("designation") %>
<td><%=resultSet.getDate("date_of_birth") %>
<td><%=resultSet.getString("email_id") %></td>
<td><%=resultSet.getLong("phone_no") %></td>
<td><%=resultSet.getInt("classteacher") %>
<td><%=resultSet.getInt("age") %>
</tr>
<%  }

} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<form method="get" action="fac.jsp">
    <button type="submit">INSERT</button>
</form>


<input type="button" value="back" onclick="history.back()">
</html>