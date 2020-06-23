<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<title>option display</title>
<%String sem=request.getParameter("SEM");
session.setAttribute("Semester",sem); %>
<style>
body {
background: url('file:///C:/Users/ADMIN/Desktop/img2.jpg') no-repeat
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
<br><br><br><br>
<form method="get" action="datadisplay.jsp">
    <button style='width:100px;margin:0 50%;position:relative;left:-50px;' type="submit">Display data</button>
</form>
<form method="get" action="coursefac.jsp">
    <button style='width:100px;margin:0 50%;position:relative;left:-50px;' type="submit">Faculty In charge</button>
</form>

<form method="get" action="StudentDetails.jsp">
    <button style='width:100px;margin:0 50%;position:relative;left:-50px;' type="submit">Student Details</button>
</form>


<form method="get" action="facultydisplay.jsp">
    <button style='width:100px;margin:0 50%;position:relative;left:-50px;' type="submit">Faculty Details</button>
</form>

<form method="get" action="inoption.jsp">
    <button style='width:100px;margin:0 50%;position:relative;left:-50px;' type="submit">Insertion</button>
</form>

<form method="get" action="classteacher.jsp">
    <button style='width:100px;margin:0 50%;position:relative;left:-50px;' type="submit">Classteacher</button>
</form>


</body></html>

