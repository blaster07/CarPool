<!--vishal aaj tujhe is pe kaam krna hai-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,java.sql.*,java.lang.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Insert an Image into MySQL Database!</h1>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/carpooling";
            FileInputStream fis = null;
 
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, "root","raspy");
                File image = new File("C:/Users/SUBRAT/Desktop/o.jpg");
                pstmt = conn.prepareStatement("insert into image(firstname, lastname, image, email) " + "values(?,?,?,?)");
                pstmt.setString(1, "Sumanth");
                pstmt.setString(2, "Garakarajula");
                pstmt.setString(4, "sumanth@codesuggestions.com");
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(3, (InputStream) fis, (int) (image.length()));
 
                int count = pstmt.executeUpdate();
                if (count > 0) {
                    System.out.println("The image has been inserted successfully");
                } else {
                    System.out.println("The image did not insert successfully");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (pstmt != null) {
                        pstmt.close();
                        pstmt = null;
                    }
                    if (conn != null) {
                        conn.close();
                        conn = null;
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
 
        %>

</body>
</html>