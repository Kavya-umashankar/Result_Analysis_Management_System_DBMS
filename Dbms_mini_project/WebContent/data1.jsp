<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!String sem,query,colname,name;
String[] cname= new String[50];
int[] marks= new int[50];
float per;
String res;
int grandtotal;
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
sem=request.getParameter("SEM");
String usn= request.getParameter("usn");
%>

<h3>USN:<%=usn %></h3>
<br>
<h3>SEMESTER:<%=sem %></h3>
<br>
<br>
<br>
<%int i=3,j=0,delimter;

try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
query="select *from 2017_sem"+sem+" where usn='"+usn+"';"; //table name is 2017_sem1 ,2017_sem2 and so on;

resultSet= statement.executeQuery(query);
ResultSetMetaData rsmd = resultSet.getMetaData();
int count = rsmd.getColumnCount();

for(int v=3;v<=count;v+=3)
{
	colname=rsmd.getColumnName(v);
	delimter=colname.indexOf("_");
	cname[v]= colname.substring(0, delimter);
}

while(resultSet.next()){

	name=resultSet.getString("sname") ;
	for(i=3;i<count-1;i++)
	{
		marks[i]=resultSet.getInt(i);
	}
	grandtotal= resultSet.getInt("grandtotal");
	per= resultSet.getFloat("percentage");
	res=resultSet.getString("result");
}
%>
<h3>NAME:<%=name %></h3>

<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr  bgcolor="#FFC300">
<th>SUBJECT CODE</th>
<th>IA MARKS</th>
<th>EXTERNAL MARKS</th>
<th>TOTAL MARKS</th>
</tr>
<tr>
<%

	for(i=3;i<count-3;i+=3)
	{
%>
<tr><th><%=cname[i] %></th><td><%=marks[i] %></td><td><%=marks[i+1]%></td><td><%=marks[i+2] %></td></tr>

<%}%></table>
<h3>GRANDTOTAL: <%=grandtotal %></h3>
<h3>PERCENTTAGE: <%=per %></h3>
<h3>RESULT:<b><%=res %></b></h3>
<%

}
catch (Exception e) {
e.printStackTrace();
}

%>

</html>