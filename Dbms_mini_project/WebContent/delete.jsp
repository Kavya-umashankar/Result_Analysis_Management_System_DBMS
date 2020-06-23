<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!int i=3,j=0; 
String colname;
String sem,query;


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
<% String sem= (String)session.getAttribute("Semester"); %>



<form action="datadisplay.jsp">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="#C3730E">
<td><b>USN</b></td>
<td><b>NAME</b></td>
<td><b>GRANDTOTAL</b></td>
<td><b>PERCENTAGE</b></td>
<td><b>RESULT</b>
</tr>
    
    
  <%

String productSelected = request.getParameter("dropdown");
 // out.println(productSelected);
 String value=request.getParameter("dvalue");
 //out.print(value);
 
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select usn,sname,grandtotal,percentage,result from 2017_sem"+sem+" where "+productSelected+"='"+value+"';";
resultSet = statement.executeQuery(sql);
ResultSetMetaData rsmd = resultSet.getMetaData();
int count = rsmd.getColumnCount();
                      //request.getParameter("sem");
        
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
query="delete from 2017_sem"+sem+" where "+productSelected+"='"+value+"';";
statement.executeUpdate(query);
out.println("<h2>THE RECORD IS DELETED SUCESSFULLY!<h2>");


}
catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<input type="button" value="back" onclick="history.back()">
 
</form>
</body>
</html>