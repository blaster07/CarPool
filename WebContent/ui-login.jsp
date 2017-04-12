<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="ui-style.css">
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

.dp {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0);
    transition: 0.3s;
    width: 50px;
    border-radius: 150px;
}

.dp:hover {
    opacity: 0.7;
}

img {
    border-radius: 150px 150px 150px 150px;
}

</STYLE>
<body>

<% try{
			String url="jdbc:mysql://localhost:3306/carpooling";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection(url,"root","raspy");
			PreparedStatement pstmt=con.prepareStatement("select * from ui_login");
			PreparedStatement pstmt1=con.prepareStatement("select * from ui_login where e_mail=?");
			
			String uiun=request.getParameter("ui_un");
			
			ResultSet rs=pstmt.executeQuery();
			String un=request.getParameter("ui_un");
			String p=request.getParameter("ui_pass");
			
			int flag=0;
			while(rs.next())
			{
				String str3=rs.getString("e_mail");
				String str4=String.valueOf(rs.getString("password"));
			if(un.equals(str3) && p.equals(str4))
				{
					flag=1;
				}
			}
				if(flag==1)
				{
					//hs=request.getSession();
					String de=request.getParameter("ui-un");
					%>
<header><h1><b>CAR POOLING</b></h1>
<nav id="mmenu" align="right">
	<ul >
		<li><a class="active" href= "ui-Homepage.html" >HOME</a></li>
		<li><a href= "ui-about.html" >ABOUT</a></li>
		<li><a href= "ui-Contact-Us.html" >CONTACT US</a></li>
		<li><a href= "#" class="dp"><img src="male.png" alt="Avatar" style="width:100%"></a></li>
	</ul>	
</nav>
</header>
</br>
</br>
</br>
</br>
</br>
</br>

<%
	 pstmt1.setString(1,uiun);
	 ResultSet rsun=pstmt1.executeQuery();
     while(rsun.next())
     {
%>
    	 <font color="white" class="det">WELCOME <%=rsun.getString("name")%></font>
    	 
    	 <% }%>
    	 </br>
    	 <input type="button" value="Logout" style="float:right" onclick="window.location.href='ui-Homepage.html'">

<table class="white">
<form action="" method="post">
<tr><td colspan="2" align="center"><h2>Pool a Car</h2></td></tr>
<tr><td>No. of Passenger : </td><td><input type="number" name="nop" min="1" max="4" required></td></tr>
<tr><td>Pickup Point : </td><td><input type="text" required></td></tr>
<tr><td>Drop Point : </td><td><input type="text" required></td></tr>
<tr><td></td><td><input type="submit" value="Book"></td></tr>
</table>
<footer>Copyright &copy; RASPYDUKE</footer>

					<%
				}
				else 
				{
					%>
					<header><h1><b>CAR POOLING</b></h1>
<nav id="mmenu" align="right">
	<ul >
		<li><a class="active" href= "ui-Homepage.html" >HOME</a></li>
		<li><a href= "ui-about.html" >ABOUT</a></li>
		<li><a href= "ui-Contact-Us.html" >CONTACT US</a></li>
	</ul>	
</nav>
</header>
</br>
</br>
</br>
</br>
</br>
</br>
<table class="white">
<form method="post" action="ui-login.jsp">
<tr><td colspan="2" align="center"><h2>Login</h2></td></tr>
<tr><td>Username : </td><td><input type="text" name="ui_un" required></td></tr>
<tr><td>Password : </td><td><input type="password" name="ui_pass" required></td></tr>
<tr><td></td><td><input type="submit" value="login"></td></tr>
<tr><td colspan="2">Not registered yet!!!<a href="ui-Register.html"> Resister Now</a></td></tr>
</form>
</table>
<font color=red >Wrong Username or Password!!! Try again.</font>
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