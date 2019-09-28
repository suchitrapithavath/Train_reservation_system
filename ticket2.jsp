<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="javax.sql.*" %>

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
	height:500px;
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
<%!int pnrno=12311;%>

<%


String name=(String)session.getAttribute( "name" );
String trainname=(String)session.getAttribute( "trainname" );
String trainno=(String)session.getAttribute("trainno");
String src=(String)session.getAttribute( "src" );
String dest=(String)session.getAttribute( "dest" );
String type1=(String)session.getAttribute( "type" ); 
String num=(String)session.getAttribute( "noofseats");
String adults=(String)session.getAttribute( "adults");  
String childs=(String)session.getAttribute( "childs");  
%>
<p> USER NAME: <%out.print(name); %></p>
<p> TRAIN NAME: <%out.print(trainname);%></p>
<p> TRAIN NO:<% out.print(trainno); %></p>
<p> SOURCE : <%out.print(src); %></p>
<p> DESTINATION :<%out.print(dest);%></p>
<p> CLASS TYPE:<%out.println(type1); %></p>
<p> TOTAL NO OF SEATS: <% out.println(num);%></p>
<p> ADULTS:<%out.println(adults); %></p>
<p> CHILDREN:<%out.println(childs); %></p>
<% 
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","admin");
Statement st= con.createStatement();
String classtype="sleeper";
ResultSet rs=st.executeQuery("select arrvtime,depttime,totalseats,seatsava,price  from train where trinno='"+trainno+"' and classtype='"+classtype+"' and src='"+src+"' and des='"+dest+"' ");
int avail=0,total=0;
String no1=(String)session.getAttribute( "noofseats");
int no=Integer.parseInt(no1);
if(rs.next())
{ %> 
<p>DEPARTURE TIME:<%=rs.getString("depttime") %></p>
<p>ARRIVAL TIME:<%=rs.getString("arrvtime") %></p>
<p> FARE: <% int price1=rs.getInt("price"); int fare=price1*no ; out.print(fare); %></p> 
<p>SEAT NUMBERS:<%
total=rs.getInt("totalseats"); 
avail=rs.getInt("seatsava"); }
if(avail>=no)
{
 
 int p=total-avail; 
 for (int count=1; count<=no;count++)
 {
	out.println(p=p+1);
 }
 st.executeUpdate("update train set seatsava=seatsava-'"+no+"' where trinno='"+trainno+"' and classtype='"+classtype+"' and src='"+src+"' and des='"+dest+"' ");
}
else
{
	out.print("waiting ");
}

%></p>
<p> PNR NUMBER:<%

 out.print(pnrno=pnrno+1);
String status; 
if(avail>=no)
{
	status="booked";
	for(int count1=1;count1<=no;count1++)
	{
		st.executeUpdate(" insert into pnr values( '"+pnrno+"','"+count1+"','"+status+"','"+status+"' )");
	}
}
else
{
	status="waiting";
	for(int count2=1;count2<=no;count2++)
	{
		st.executeUpdate(" insert into pnr values( '"+pnrno+"','"+count2+"','"+status+"','"+status+"' )");
	}
}
%></p>
</div>
</div>
</body>
</html>