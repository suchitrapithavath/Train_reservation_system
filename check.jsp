
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<html>

<style type="text/css">
body { background-color:white}
.button
{
	color:white;
	background-color:#3333cc;
	
	
}
h1
{
	background-color:#3333cc;
	color:#eee;
margin-top:0px;


}
a:link {text-decoration:none;}    /* unvisited link */
a:visited {text-decoration:none;} /* visited link */
a:hover {text-decoration:underline;}   /* mouse over link */
a:active {text-decoration:underline;}  /* selected link */
p.sansserif{font-family:Arial,Helvetica,sans-serif;}
.right
{
border-style:solid;
border-color:#eee;
margin-top:100px;
margin-left:300px;
padding-top:100px; 
 padding-bottom:50px; 
padding-right:100px;
padding-left:100px;
width:500px;
background-color:deepskyblue;
}
#d1
{

font-family:"Times New Roman";
font-size:20px;
color:black;
text-align:center;


}
</style>

<body>

<div id="d1">PNR STATUS!

</div>
<form action="homepage.html" method="GET">
<div id="h1"><input type="submit" value="logout" class="button"></div>

</form>
<div class="right">

<%
String pnrno=request.getParameter("pnrno");
Class.forName("com.mysql.jdbc.Driver");
Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "admin");
Statement stmt = conn.createStatement();
 ResultSet rs=stmt.executeQuery("select *from pnr where pnrno='"+pnrno+"' ");
%>
<table border="3" >
	<tr>
		<th>PNRNO</th>
		<th>PASSENGER</th>
		<th>BOOKINGSTATUS</th>
		<th>CURRENTSTATUS</th>
	</tr>
<%
while(rs.next())
{
%>
	<tr>
		
		<td><%int seatsava=rs.getInt("pnrno");
			out.println(seatsava);
			%>
		</td>
		<td><%int totalseats=rs.getInt("passenger");
			out.println(totalseats);
			%>
		</td>
		
		<td><%String classtype=rs.getString("bookingstatus");
			out.println(classtype);
			%>
		</td>
		<td><%String current=rs.getString("currentstatus");
			out.println(current);
			%>
		</td>
		
	</tr>
<%
}

%>


</div>

</body>
</html>
