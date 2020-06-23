<%@ page import ="java.sql.*" %>

<%
try{    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
   out.println(user+pwd);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalise","root", "root");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into members(uname, pwd) values ('"+ user + "','" + pwd + "')");
    if (i > 0) {
       // session.setAttribute("userid", user);
        response.sendRedirect("LOGIN.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("error.jsp");
    }
    
}
catch(Exception e)
{
	e.printStackTrace();
}
%>