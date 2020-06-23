<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%! String q1,fname; 
int i;
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
q1="select fac_name from faculty_details";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

resultSet = statement.executeQuery(q1);
                  //request.getParameter("sem");
%>


<h3>Insert :</h3>

<style>
body {
background: url('file:///C:/Users/ADMIN/Desktop/img5.jpg') no-repeat
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
<form action="insertdata.jsp" method="get">
<h2>Course ID:</h2>
<input type="text" name="value"  /><br><br>
<br>
<h2>Faculty name:</h2>
<select name="fname">

<option value="NULL">SELECT</option>
<% 
while(resultSet.next()) {
fname = resultSet.getString(1);
%>
<option value="<%=fname%>"><%=fname%></option>

<%} %>
</select><br>

<%}
catch (Exception e) {
e.printStackTrace();
}
%>
<br>
<br>
<br>
<input type="submit" value="Submit"><br>
<input type="button" value="back" onclick="history.back()">
</form>
</body>
