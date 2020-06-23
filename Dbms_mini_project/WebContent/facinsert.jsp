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
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<body>
<h3>data inserted Successfully</h3>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr>

</tr>
<tr  bgcolor="#FFC300">
<td>Faculty_id</td>
<td>Faculty Name</td>
<td>Gender</td>
<td>Designation</td>
<td>Date of birth</td>
<td>Email ID</td>
<td>Phone no</td>
<td>age</td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

String fid = request.getParameter("id");
String name = request.getParameter("name");
String gen= request.getParameter("gender");
String des= request.getParameter("desig");
String phone=  request.getParameter("phone");
String dob= request.getParameter("dob");
String email= request.getParameter("email");
String classteacher;
if(request.getParameter("semester")!=null)
{
	classteacher= request.getParameter("semester");
}
else
	classteacher="null";
query="insert into faculty_details values('"+fid+"','"+name+"','"+gen+"','"+des+"','"+dob+"','"+email+"',"+phone+","+classteacher+");";
statement.executeUpdate(query);
CallableStatement stmt=connection.prepareCall("{call getage()}");
resultSet= stmt.executeQuery();
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("fid") %></td>
<td><%=resultSet.getString("fac_name") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("designation") %></td>
<td><%=resultSet.getDate("date_of_birth") %></td>
<td><%=resultSet.getString("email_id") %></td>
<td><%=resultSet.getLong("phone_no") %></td>
<td><%=resultSet.getInt("age") %>
</tr>


<%
}
}
catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<input type="button" value="back" onclick="history.back()">

</body>
</html>