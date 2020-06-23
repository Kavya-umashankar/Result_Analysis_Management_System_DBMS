<html>

<style>
body {
background: url('file:///C:/Users/ADMIN/Desktop/img5.jpg') no-repeat
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

<h3>delete using :</h3>

<form action="delete.jsp" method="post">
  <select name="dropdown">
  <option value="usn">USN</option>
  <option value="sname">Student Name</option>
</select>

<br>
<br>
<br>
<input type="text" name="dvalue"  /><br><br>
<input type="submit" value="Submit"><br>
<input type="button" value="back" onclick="history.back()">
</form>
</body>
</html>
