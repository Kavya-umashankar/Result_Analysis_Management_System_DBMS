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
String sem=(String) session.getAttribute("Semester");
%>
<h2 align="center"><font><strong>Insert INTO:</strong></font></h2>

<style>
body {
background: url('file:///C:/Users/ADMIN/Desktop/image2.jpeg') no-repeat
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
<form method="get" action="insertfac.jsp">
    <button type="submit">Faculty Details</button>
</form><br>
<br>
<h2>LOAD data from CSV FILE:</h2>
<form method="get" action="loadd.jsp">
    <button type="submit">LOAD DATA</button>
</form>
<input type="button" value="back" onclick="history.back()">
</body>
</html>
