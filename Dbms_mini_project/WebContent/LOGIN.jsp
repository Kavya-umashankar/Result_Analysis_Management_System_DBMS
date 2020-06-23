
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login page</title>
</head>


<style>
body {
background: url('file:///C:/Users/ADMIN/Desktop/login.jpg') no-repeat
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

<h1>LOG-IN PAGE, WELCOME!</h1>
<br>

<form action="logincontroller.jsp" method="post">
    <h3>Enter username :</h3><input type="text" name="username"> <br>
  <h3> Enter password :</h3> <input type="password" name="password"><br>
    <input type="submit" value="Login">
   
</form>
<form action="register.jsp" method ="post">
<input type="submit"  value="Create new account">
<br>
<br>
<br>
<br>
<h3> NOT A TEACHER? CLICK HERE FOR <a href="Studentportal.jsp">STUDENT PORTAL</a></h3>
</form>
</body>
</html>