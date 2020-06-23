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
q1="select * from 2017_sem"+sem;
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

resultSet = statement.executeQuery(q1);
ResultSetMetaData rsmd = resultSet.getMetaData();

int count = rsmd.getColumnCount();
                      //request.getParameter("sem");
%>


<h3>Update using :</h3>

<style>
body {
background: url('file:///C:/Users/ADMIN/Desktop/img4.jpg') no-repeat
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

<form action='update.jsp' method="get">
  <select name="dropdown">
  <option value="usn">USN</option>
  <option value="sname">Student Name</option>
  
</select><br><br>

<br>
<input type="text" name="dvalue"  /><br><br><br>
<select name="updates">
<option value="NULL">SELECT</option>
<% i=3;

for (int i=3; i<=count-1; i++) 
{
	colname=rsmd.getColumnName(i);
%>
<option value="<%=colname%>"><%=colname%> </option>
<%} %>
</select><br>

<%}
catch (Exception e) {
e.printStackTrace();
}
%>
<br>
<input type="text" name="value"  /><br><br>
<input type="submit" value="Submit"><br>
<input type="button" value="back" onclick="history.back()">
</form>
</body>
</html>