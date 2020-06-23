<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!String sem,query,q1; 
float passperc,total;

int i,num,pass,t;%>
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

<%
	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	query="select usn,sname,grandtotal,percentage,result from 2017_sem"+sem+" where result='distinction' or result='first class' or result='second class' or result='pass';";
	resultSet= statement.executeQuery(query);
	ResultSetMetaData rsmd = resultSet.getMetaData();
	%>
<body background="C:\Users\ADMIN\Desktop\image2.jpeg" style="background-repeat:no-repeat;">

	
	
	
	<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr>

</tr>
	<tr bgcolor="#FFC300">
	<%
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

<%
	}%></table>
	<%
	query="select count(*) from 2017_sem"+sem+" where result='distinction' or result='first class' or result='second class' or result='pass';";
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
	t=(int)total;
	%>
	<%
	passperc=(pass/total)*100;
	out.print("<h3>PASS PERCENTAGE="+passperc+"%</h3>");
	%>
	<h3>no of student's passed:<%=pass %></h3>
	<h3>total no of students:<%=t%></h3>
	
	<input type="button" value="back" onclick="history.back()">
	
	
	
	</body>
	</html>
	
	