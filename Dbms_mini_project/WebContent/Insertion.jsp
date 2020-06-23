<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!int i,j=0; 
String colname,sem,query;%>
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
;
%>
<body>
<form action="insert.jsp" method="post">
<%String sem= (String)session.getAttribute("Semester"); %>
<%
int[] datastoring= new int[70];
String name,usn,result;
int gtotal;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

String sql ="select * from 2017_sem"+sem+";";
resultSet = statement.executeQuery(sql);
ResultSetMetaData rsmd = resultSet.getMetaData();
int count = rsmd.getColumnCount();
session.setAttribute("userId", count);
int v;
%>

<h4>enter the USN:</h4>
 <input type="text" name="usn" maxlength="10" title="enter your USN" placeholder="enter your USN" required/><br>
 <h4>enter the NAME:</h4>
 <input type="text" name="Name" title="enter your name" placeholder="enter your name" required/><br>
 
 <% 
	
 	for(i=3;i<count-2;i++)
 	{
 		String sb="marks";
 		sb+=i; 

 		%><h4>enter the marks of <%=rsmd.getColumnName(i) %></h4>
 		 <input type="number" name="<%=sb %>" maxlength="3" title="enter the marks "placeholder="enter the marks" required/><br>
 		<%
 		out.println(sb);
 		
 	}
 %>
 <h4>enter the grand total</h4>
 		 <input type="number" name="grandtotal" maxlength="3" title="enter the grandtotal "placeholder="enter the grandtotal" required/><br>
 <h4>enter the Percentage</h4>
 		 <input type="number" step="any" name="percentage" maxlength="5" title="enter the marks "placeholder="enter the percentage" required/><br>
 <h4>enter the result</h4>
 		 <input type="text" name="result" title="[pass/fail/secondclass/distinction/firstclass] "placeholder="enter the result" required/><br>
 

 <%
 
 } catch (Exception e) {
e.printStackTrace();
}
%>
 
 <input  type="submit" value="Submit"/>
 </form>
<input type="reset" value="Reset"/>
<input type="button" value="back" onclick="history.back()">
 
 </body>
 </html>