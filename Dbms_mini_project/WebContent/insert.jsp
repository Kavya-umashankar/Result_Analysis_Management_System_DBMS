<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!int i,j=0; 
String colname,sem,sql,strqry;
StringBuffer query= new StringBuffer(); %>
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



<%
String sem=(String) session.getAttribute("Semester");
int[] datastoring= new int[70];
String name,usn,result;
int gtotal;
int count ;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

int v;
%><h2>DATA INSERTED SUCCESSFULLY!</h2>
<% 
 usn=request.getParameter("usn");
 name=request.getParameter("Name");
 gtotal=  89;                       //Integer.parseInt( request.getParameter("grandtotal"));
// result='fail';                         //request.getParameter("result");
 try{
 String sql ="select * from 2017_sem"+sem+";";
 resultSet = statement.executeQuery(sql);
 ResultSetMetaData rsmd = resultSet.getMetaData();
 count = rsmd.getColumnCount();
 String temp;
 
 for(int k=3;k<count-2;k++)
 {
	 String sb="marks";
	 sb+=i;
	 out.println(sb);
	 temp=request.getParameter(sb.toString());
	 if(temp!=null && temp=="")
	 {
		 datastoring[k]=Integer.parseInt(temp);
	 }
	 else
		 out.println("value null");
 }
 
 
 
 
 
 
 query.append("insert into 2017_sem"+sem+" values('1GA17IS999','AAA',");
 for( v=3;v<count-2;v++)
 {
	 datastoring[v]=1;
	 query.append(datastoring[v]+",");
 }
 
 float percentage=20;                      //Float.parseFloat( request.getParameter("percentage"));
 query.append(gtotal+","+percentage+",'fail');");
 
 
 strqry=query.toString();
 resultSet = statement.executeQuery(strqry);
 }catch(Exception e)
 {
	 e.printStackTrace();
 }
 try{
 sql="select * from 2017_sem"+sem+" where usn='"+usn+"';";
 resultSet = statement.executeQuery(sql);
 ResultSetMetaData rsmd1 = resultSet.getMetaData();
 int count1 = rsmd1.getColumnCount();
 %>
 <table>
 <tr bgcolor="#FFC300">
 <%
 
 for( v=1;v<=count1;v++)
 {
 	%><td><%=rsmd1.getColumnName(v)%>
 	<%
 }
 %></tr><%
  while(resultSet.next())
  {
 	 %>
 		<tr bgcolor="#DEB887">

 		<td><%=resultSet.getString("usn") %></td>
 		<td><%=resultSet.getString("sname") %></td>
 		<%for(i=3;i<count1-1;i++)
 		{%>
 			<td><%=resultSet.getInt(i) %></td>
 		<%}

 		%>
 		<td><%=resultSet.getFloat("percentage") %></td>
 		<td><%=resultSet.getString("result") %></td>

 		</tr>
 		
 <%
  }
 }catch(Exception e)
 {
	 e.printStackTrace();
 }
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>