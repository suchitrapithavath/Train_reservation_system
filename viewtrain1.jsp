
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
margin-left:100px;
padding-top:100px; 
 padding-bottom:50px; 
padding-right:100px;
padding-left:100px;
width:900px;
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
<div id="d1">TRAIN DETAILS!</div>
<div class="right">
<form action="reservation1.html"  onsubmit="return svali()" method="POST">
<%
String src=request.getParameter("src");
String dest=request.getParameter("dest");
String curdate=request.getParameter("curdate");
Class.forName("com.mysql.jdbc.Driver");
Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "admin");
Statement stmt = conn.createStatement();
 ResultSet rs=stmt.executeQuery("select trainname,trinno,arrvtime,depttime,seatsava,totalseats,src,des,price,classtype from train where src='"+src+"' and des='"+dest+"' ");
%>
<table border="3" >
	<tr>
		<th>TRAIN NAME</th>
		<th>TRAIN NO</th>
		<th>ARRIVAL TIME</th>
		<th>DEPARTURE TIME</th>
		<th>SEATS AVAILABLE</th>
		<th>TOTAL SEATS</th>
		<th>SOURCE</th>
		<th>DESTINATION</th>
		<th>PRICE RS</th>
		<th>CLASSTYPE</th>
		<th>BOOK</th>
	</tr>
<%
while(rs.next())
{
%>
	<tr>
		<td><%String trainname=rs.getString("trainname");
			out.println(trainname);
			%>
		</td>
		<td><%int trainno=rs.getInt("trinno");
			out.println(trainno);
			%>
		
		</td>
		<td><%String arrvtime=rs.getString("arrvtime");
			out.println(arrvtime);
			%>
		</td>
		<td><%String depttime=rs.getString("depttime");
			out.println(depttime);
			%>
		</td>
		<td><%int seatsava=rs.getInt("seatsava");
			out.println(seatsava);
			%>
		</td>
		<td><%int totalseats=rs.getInt("totalseats");
			out.println(totalseats);
			%>
		</td>
		<td><%
			out.println(src);
			%>
		</td>
		<td><%
			out.println(dest);
			%>
		</td>
		<td><%int price=rs.getInt("price");
			out.println(price);
			%>
		</td>
		<td><%String classtype=rs.getString("classtype");
			out.println(classtype);
			%>
		</td>
		<td>
			<input type="submit" value="book">
		</td>
	</tr>
<%
}

%>


</form>
</div>
</body>
</html>
