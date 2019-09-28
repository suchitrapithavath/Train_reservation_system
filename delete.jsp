<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<html>
<head>
<title>delete Operation</title>
</head>
<body>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "admin");
Statement stmt = conn.createStatement();
String trainno=request.getParameter("trainno");
int i=stmt.executeUpdate("DELETE FROM train WHERE trinno='"+trainno+"' ");
if(i==0)
{
	out.println("cannot delete , check train no");
}
else
{
	out.println("deleted");
}
%>
</body>
</html>