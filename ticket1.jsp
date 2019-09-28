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
ResultSet rs=st.executeQuery("select * from book where username='"+name+"'");
int i=0,j=0;
String type=null ;
if(rs.next())
{
%>	
<p> USER NAME:</p> <%=rs.getString("username") %>
<p> TRAIN NAME: </p> <%=rs.getString("trainname") %>
<p> TRAIN NO:</p>
<%  i=rs.getInt("trainno");
out.print(i); %>
<p> SOURCE : </p><%=rs.getString("src") %>
<p> DESTINATION : </p><%=rs.getString("dest")%>
<p> CLASS TYPE: </p><% type=rs.getString("classtype"); out.println(type); %>
<p> TOTAL NO OF SEATS: </p> <% j=rs.getInt("noofseats"); out.print(j);%>
<p> ADULTS</p><%=rs.getInt("adults") %>
<p> CHILDREN</p><%=rs.getInt("childs") %>
<% } 
out.println( i);
out.println( j);
%>
</div>
</div>
</body>
</html>

		