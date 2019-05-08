<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="CSS\login.css" rel="stylesheet" type="text/css" />
	<title>Untitled Document</title>
	</head>
	<body>
        <div class="signin">
            <form method="post" action="Login_Form.jsp">
                <h2>Log In</h2>
                <input type="text" name="username" placeholder="Username"/><br><br>
                <input type="password" name="password" placeholder="Password"/><br><br>
                <a href="msg.html"><input type="button" value="Log In"/></a><br><br>
                <p class="submit"><input type="submit"   value="Login"></p>
                Don't have account?<a href="Signup_Form.jsp">&nbsp;Sign Up</a>
            </form>
        </div>
    </body>
</html> -->

<%@ page import ="java.sql.*" %>
  
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibrarySystem?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("SELECT username, password FROM users WHERE username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){
        	response.sendRedirect("msg.html");
        	out.println("Valid login credentials");

        }
        else{
        	//response.sendRedirect("Login_Form.jsp");
        	out.println("Invalid login credentials");  

        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>