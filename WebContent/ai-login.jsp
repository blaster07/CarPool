<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="ai-style.css">
</head>
<STYLE>
body 
{
  background: url(logo.jpg) no-repeat center center fixed; 
  background-size: cover;
}

font.det
{
color : white;
text-transform: uppercase;
float:right;
}

</STYLE>
<body>

<% try{
			String url="jdbc:mysql://localhost:3306/carpooling";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection(url,"root","");
			PreparedStatement pstmt=con.prepareStatement("select * from admin");
			
			ResultSet rs=pstmt.executeQuery();
			String un=request.getParameter("ai_un");
			String p=request.getParameter("ai_pass");
			
			int flag=0;
			while(rs.next())
			{
				String str3=rs.getString("username");
				String str4=String.valueOf(rs.getString("password"));
			if(un.equals(str3) && p.equals(str4))
				{
					flag=1;
				}
			}
			
			if(flag==1)
			{
				
				%>
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

<footer>Copyright &copy; RASPYDUKE</footer>
				
				<%
				
			}
				
	}
catch(Exception e)
{
	out.println(e);
}        

				

%>


</body>
</html>