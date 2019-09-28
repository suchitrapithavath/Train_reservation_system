

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>



 
<html>
<head>
<title>insert Operation</title>
</head>
<body>


<% 
String username=request.getParameter("adminname");

String pwd=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "admin");
Statement stmt = conn.createStatement();
 ResultSet rs=stmt.executeQuery("select * from train where adminname='"+username+"'");

if(rs.next())
{
    

if(rs.getString(12).equals(pwd))
{
response.sendRedirect("adminoperation.html");



}
else
{



%>
<%@include file="adlogin.html"%>

  <%

}
}
%>  



 
 
</body>
</html>