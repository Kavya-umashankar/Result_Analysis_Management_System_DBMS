<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!String query,q1;
int total,pass;



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

try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

String selected = request.getParameter("dropdown");
if(selected=="top_10")
{
	query="select top 10 usn,sname,grandtotal,percentage from 2017_sem"+sem+" order by grandtotal desc;";
	q1="select count(top 10) where 2017_sem"+sem+" ;";
}
else if(selected=="pass_percentage")
{
	query="select count(result) from 2017_sem"+sem+" where result!='fail';";
	resultSet=statement.executeQuery(query);
	
	if(resultSet.next())
	{
		pass=resultSet.getInt(1);
	}
	query="select count(*) from 2017_sem"+sem+" ;";
	resultSet=statement.executeQuery(query);
	if(resultSet.next())
	{
		 total=resultSet.getInt(1);
	}
	
	float passperc=(float)(pass/total)*100;
	out.print("<h3>PASS PERCENTAGE="+passperc+"</h3>");
	query="select usn,sname,grandtotal,percentage,result from 2017_sem"+sem+" where result!='fail';";
	q1="select count(*) from 2017_sem"+sem+" where result!='fail';";
}
else if(selected=="no_of_fail")
{

	query="select * from 2017_sem"+sem+" where result='fail';";
	q1="select count(*) from 2017_sem"+sem+" where result='fail'";
}
else if(selected=="no_of_distinction")
{
	query="select * from 2017_sem"+sem+" where result='distinction';";
	q1="select count(*) from 2017_sem"+sem+" where result='distinction'";
	
}
else if(selected=="no_of_first_class")
{
	query="select * from 2017_sem"+sem+" where result='first class';";
	q1="select count(*) from 2017_sem"+sem+" where result='first class'";
	
}
else if(selected=="no_of_second_class")
{
	query="select * from 2017_sem"+sem+" where result='second class';";
	q1="select count(*) from 2017_sem"+sem+" where result='second class'";
}
out.println("<h3>"+selected+"</h3>");

%>
<table>
<tr bgcolor="#FFC300">
<th>USN</th><th>NAME</th><th>GRAND TOTAL</th><th>PERCENTAGE</th><th>RESULT</th>
</tr>
<%
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


<%
} catch (Exception e) {
e.printStackTrace();
}
%>


</html>
