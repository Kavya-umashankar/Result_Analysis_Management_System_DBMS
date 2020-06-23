<%@ page import ="java.sql.*" %>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%


    /**
	 * 
	 */
	
	
        String un = request.getParameter("username");
        String pw = request.getParameter("password");
         session.setAttribute("username",un );


        try {
            Class.forName("com.mysql.jdbc.Driver");
// loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalise","root","root"); // gets a new connection

            PreparedStatement ps = c.prepareStatement("select uname,pwd from members where uname=? and pwd=?");
            ps.setString(1, un);
            ps.setString(2, pw);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                response.sendRedirect("Teacherportal.jsp");
                return;
            }
            response.sendRedirect("LOGIN.jsp");
            return;
        } catch (ClassNotFoundException | SQLException e) {
            out.println("Wrong username and password! <br>Don't have an account?<br>");
        }
    

%>