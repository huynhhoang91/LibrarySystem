<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Login</title>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />
    <link href="CSS/student_login.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>
	<%@ include file="header.html" %>
	<section>
        <div class="box">
            <form method="post" action="Admin_Login.jsp">
                <h2> Admin Log In</h2>
                <input class="form-control" type="text" name="username" placeholder="Username" required=""><br>
                <input class="form-control" type="password" name="password" placeholder="Password" required=""/><br>
                <!-- <a href="msg.html"><input type="button" value="Log In"/></a><br><br> -->

<%@ page import ="java.sql.*" %>
  
<%
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        if (username != null && password != null){
        	Boolean valid = librarysystem.LibrarySystem.adminLogin(username, password);                        
        	if(valid){
    			session.setAttribute("username", username);
        		response.sendRedirect("admin_continue.html");
        		out.println("Valid login credentials");
        	}
        	else{
        		//response.sendRedirect("Login_Form.jsp");
        		out.println("Invalid login credentials");  

        	}
        }
     
%>
					<p class="submit"><input 
                    class="btn btn-default" 
                    type="submit" 
                    value="Login" 
                    style="color: black; width: 70px; height: 30px"></p>
                Don't have account?<a href="signup.html">&nbsp;Sign Up</a>
            </form>
        </div>
	</section>
    </body>
</html>
