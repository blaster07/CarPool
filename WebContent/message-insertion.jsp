<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,java.sql.*,java.lang.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css" href="ui-style.css">
</head>
<STYLE>

body 
{
  background: url(logo.jpg) no-repeat center center fixed; 
  background-size: cover;
}

</STYLE>
<body>

<script type="text/javascript">
function queSucc() {
    alert("Your query has been sent!!!");
}
function queFail() {
    alert("Error!!! Try again.");
}
</script>
<% try{
	String url="jdbc:mysql://localhost:3306/carpooling";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,"root","raspy");
	PreparedStatement pstmt=con.prepareStatement("insert into question values(?,?,?)");
	
	String t1=request.getParameter("mn");
	String t2=request.getParameter("mem");
	String t3=request.getParameter("mme");
	
	pstmt.setString(1,t1);
	pstmt.setString(2,t2);
	pstmt.setString(3,t3);
	
	int i=pstmt.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("ui-Contact-Us.html");
		//RequestDispatcher rd=request.getRequestDispatcher("/ui-Contact-Us.html");  
		//rd.include(request, response);
		%>
		<script type="text/javascript"> window.onload = queSucc; </script>
		<%
		
}
else
{
	response.sendRedirect("ui-Contact-Us.html");
	%>
	<script type="text/javascript"> window.onload = queFail; </script>
	<!-- <iframe  src="ui-Contact-Us.html" onload="queFail()" frameborder="0" height=686px width=100% scrolling=no>
	
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