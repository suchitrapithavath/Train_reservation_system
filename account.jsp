
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html>
<body>
<%
String user=request.getParameter("usr");
String pwd=request.getParameter("password");
String email=request.getParameter("email");
String dob=request.getParameter("dob");
String phone=request.getParameter("phone");
String adharno=request.getParameter("adharno");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","admin");
Statement st= con.createStatement();
ResultSet rs;
st.executeUpdate("insert into user values ('"+user+"','"+pwd+"','"+email+"','"+ dob+"','"+phone+"','"+adharno+"')");
out.println("THANK YOU FOR REGISTERING");

%>
<br/>
<input type="button " value="back" onclick="location.href='homepage.html'">
</body>
</html>