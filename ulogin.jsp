

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
String username=request.getParameter("username");
session.setAttribute("username",username);
String pwd=request.getParameter("pswd");
Class.forName("com.mysql.jdbc.Driver");
Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "admin");
Statement stmt = conn.createStatement();
 ResultSet rs=stmt.executeQuery("select * from user where username='"+username+"'");

if(rs.next())
{
    

if(rs.getString(2).equals(pwd))
{
response.sendRedirect("user.html");



}
else
{



%>
<%@include file="userlogin.html"%>

  <%

}
}
%>  



 
 
</body>
</html>