<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,java.sql.*,java.lang.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="ui-style.css">
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
<script>
function succReg() {
    alert("You are successsfully registered!!!");
}
function passNM() {
    alert("Password not matched!!! Try again.");
}
</script>
<% try{
			String url="jdbc:mysql://localhost:3306/carpooling";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection(url,"root","");
			PreparedStatement pstmt=con.prepareStatement("insert into ui_login values(?,?,?,?)");
			
			String t1=request.getParameter("rn");
			String t2=request.getParameter("rem");
			String t3=request.getParameter("rmn");
			String t4=request.getParameter("rp");
			String t5=request.getParameter("rcp");
			
			response.setContentType("text/html");  
		  
			
			if(t4.equals(t5))
			{   
				pstmt.setString(1,t1);
				pstmt.setString(2,t2);
				pstmt.setString(3,t3);
				pstmt.setString(4,t4);
				
				int i=pstmt.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("ui-Homepage.html");
					
					%>
					<!-- <iframe  src="ui-Homepage.html" onload="succReg()" frameborder="0" height=686px width=100% scrolling=no>
				
					</iframe>  -->
					<%
					
				}
				else
				{
					
				}
			}
			else
			{
				response.sendRedirect("ui-Register.html");
				
				%>
				<!--  <iframe  src="ui-Register.html" onload="passNM()" frameborder="0" height=686px width=100% scrolling=no>
				
				</iframe> -->
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