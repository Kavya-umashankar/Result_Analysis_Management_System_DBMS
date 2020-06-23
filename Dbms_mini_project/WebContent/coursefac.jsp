<html>

<style>
body {
background: url('file:///C:/Users/ADMIN/Desktop/img3.jpeg') no-repeat
center center fixed;
background-size: cover; /* for IE9+, Safari 4.1+, Chrome 3.0+, Firefox 3.6+ */
-webkit-background-size: cover; /* for Safari 3.0 - 4.0 , Chrome 1.0 - 3.0 */
-moz-background-size: cover; /* optional for Firefox 3.6 */
-o-background-size: cover; /* for Opera 9.5 */
margin: 0; /* to remove the default white margin of body */
padding: 0; /* to remove the default white margin of body */
overflow: hidden;
}
</style>
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
sem=(String)session.getAttribute("Semester");
query="select * from cf"+sem+";";

resultSet= statement.executeQuery(query);
%>
<th>COURSE_ID</th>
<th>FACULTY NAME</th>


</tr><%
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("course_id") %></td>
<td><%=resultSet.getString("fname") %></td>

</tr>
<%  }

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<input type="button" value="back" onclick="history.back()">
</html>