<html>
<body>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection,java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"
%>
<%!
String usn1,sem;
public static String driver = "com.mysql.jdbc.Driver";
public static String url = "jdbc:mysql://localhost:3306/globalise";
public static String uname = "root";
public static String pwd = "root";
Connection con;
Statement stmt;
ResultSet rs;
int colno,i;

 %>
 <%
 
 Class.forName(driver);
 con = DriverManager.getConnection(url,uname,pwd); 
 String query ="select * from 2017_sem"+sem+" where usn=\'"+usn1+"\'";
 
 int colno;
 stmt =con.createStatement();
 rs = stmt.executeQuery(query);
 ResultSetMetaData rsmd = rs.getMetaData();
 %>
 <% usn1=request.getParameter("usn"); %>
 <%sem= request.getParameter("SEM"); 
   colno = rsmd.getColumnCount();%>
<form action="Studentportal.jsp"  method="get">
<h5>USN :<% out.print(usn1); %>
NAME : <%out.print( rs.getString(2) ); %>
SEMESTER :<% out.print(sem); %>
</h5>
<table>
<colgroup >
<col span=colno>
<tr><td>SUBJECT<td><td>IA MARKS<td><td>EXTERNAL MARKS<td><td>TOTAL MARKS<td>





	<%for (int i=3;i<colno-4;i++)
	{
	out.print( rsmd.getColumnName(i));
	if(i%3==0){
		out.println();
	}
	}
	i=0;
	while(rs.next())
	{
		out.print(rs.getInt(i));
		if(i%3==0){
			out.println();
		}
	}
	
	
	%>






</table>







</form>

</body>
</html>