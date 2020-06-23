<html>


<title>Student portal</title>
<h1 align='center'> STUDENT PORTAL</h1>


<body background="C:\Users\ADMIN\Desktop\image2.jpeg" style="background-repeat:no-repeat;">

<form action="data2.jsp" method="get">

<h3 align=><font color="grey">Enter your USN</font></h3>

<input type="text" name="usn"  maxlength="10" title="enter your USN" placeholder="enter your USN" required/>



<h3><font color="grey">SELECT A SEMESTER</font></h3>

<input type="radio" name="SEM" value="1">1<br>
<input type="radio" name="SEM" value="2">2<br>
<input type="radio" name="SEM" value="3">3<br>
<input type="radio" name="SEM" value="4">4<br>
<input type="radio" name="SEM" value="5">5<br>
<input type="radio" name="SEM" value="6">6<br>
<input type="radio" name="SEM" value="7">7<br>
<input type="radio" name="SEM" value="8">8<br>

<input  type="submit" value="Submit"/>
<input type="reset" value="Reset"/>

</form>
<input type="button" value="back" onclick="history.back()">
</body>

</html>