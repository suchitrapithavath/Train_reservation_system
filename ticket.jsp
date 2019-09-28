<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>

body
{
background:url(logo.jpg);
background-size:200px 180px;
background-repeat:no-repeat;
padding-top:40px;
margin:30px;
}
.right
{
border-style:solid;
border-color:#eee;
margin-top:50px;
margin-left:300px;
padding-top:50px; 
 padding-bottom:50px; 
padding-right:100px;
padding-left:100px;
position:absolute;
width:600px;
background-color:deepskyblue;
align:center;
}
#d1
{

font-family:"Times New Roman";
font-size:20px;
color:black;
text-align:center;


}
body
{

background-color:white;
}
#p1{
font-family:"Times New Roman";
font-size:20px;
color:black;
}
.button {
    color: white;
background-color: #3333cc;
}
#div1 {
	
	width:550px;
	height:300px;
	border: 3px solid red;
		background-color:white;
}

</style>

<title>TRAIN TICKET</title>
</head>
<body>

<div id="d1">YOUR TRAIN TICKET</div>
<div class="right">
<div id="div1">
<% 
String name=(String)session.getAttribute( "name" );
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","admin");
Statement st= con.createStatement();
ResultSet rs=null;
rs=st.executeQuery("select * from book where username='"+name+"'");
String type="sleeper";
if(rs.next())
{
%>	
<%String username=rs.getString("username");
session.setAttribute( "username", username ); %>
<%String trainname=rs.getString("trainname");
session.setAttribute( "trainname", trainname ); %>
<% int trainno=rs.getInt("trainno");
String trainno1=Integer.toString(trainno);
session.setAttribute( "trainno", trainno1);%>
<%String src=rs.getString("src");
session.setAttribute( "src", src ); %>
<%String dest=rs.getString("dest");
session.setAttribute( "dest", dest );%>
<% type=(String)session.getAttribute( "type" ); %>
<% int noofseats=rs.getInt("noofseats");
String noofseats1=Integer.toString(noofseats);
session.setAttribute( "noofseats", noofseats1);%>
<%int adults=rs.getInt("adults");
String adults1=Integer.toString(adults);
session.setAttribute( "adults", adults1); %>
<%int childs=rs.getInt("childs");
String childs1=Integer.toString(childs);
session.setAttribute( "childs", childs1); %>
<% } 
response.sendRedirect("ticket2.jsp");
%>
</div>
</div>
</body>
</html>

		