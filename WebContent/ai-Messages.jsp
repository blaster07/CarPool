<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages</title>
<link rel="stylesheet" type="text/css" href="ai-style.css">
</head>
<STYLE>
body 
{
  background: url(logo.jpg) no-repeat center center fixed; 
  background-size: cover;
}
</STYLE>
</head>
<body>
<header><h1><b>CAR POOLING</b></h1>
<nav id="mmenu" align="right">
<ul >
	<li><a href= "ai-Messages.jsp" >MESSAGES</a></li>
	<li><a href= "ai-Homepage.html" >LOGOUT</a></li>
</ul>	
</nav>
</header>
</br>
</br>
</br>
</br>
</br>
</br>

<table class="white" border="1" border-color="white">
<%
try
{
	 String url="jdbc:mysql://localhost:3306/carpooling";
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection(url,"root","");
	 PreparedStatement pstmt=con.prepareStatement("select * from question");

	 ResultSet rs=pstmt.executeQuery();
	 %>
	 
	 <tr><td align="center"> NAME </td>
	 <td align="center"> EMAIL ID </td>
	 <td align="center"> MESSAGE </td></tr>
	 <%
	 while(rs.next())
    {
    	%>
    	<tr>
    	<td align="center"><%=rs.getString("name") %></td>
    	<td align="center"><%=rs.getString("e_mail") %></td>
    	<td align="center"><%=rs.getString("message") %></td>
    	</tr>
    	<%
    }
   	
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</table>
<footer>Copyright &copy; RASPYDUKE</footer>
</body>
</html>