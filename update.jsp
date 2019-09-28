<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<html>
<head>
<title>update Operation</title>
</head>
<body>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "admin");
Statement stmt = conn.createStatement();
String trainno=request.getParameter("trainno");
String arrvtime=request.getParameter("arrvtime");
String depttime=request.getParameter("depttime");
int i=stmt.executeUpdate("UPDATE train SET arrvtime='"+arrvtime+"', depttime='"+depttime+"' where trinno='"+trainno+"'");
if(i==0)
{
	out.println("cannot UPDATE , check train no");
}
else
{
	out.println("successfully updated");
}
%>
</body>
</html>