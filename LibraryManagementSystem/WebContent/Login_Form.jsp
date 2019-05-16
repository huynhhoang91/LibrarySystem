<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Student Login</title>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />
    <link href="CSS/student_login.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>
	<header>
        <div class="logo">
            <img src="images/logo.png">           
        </div>  
        <nav class="Navbar Navbar-Inverse">
            <ul>
                <li><a href="index.html">HOME</a></li>
                <li><a href="">BOOKS</a></li>
                <li><a href="Login_Form.jsp">STUDENT_LOGIN</a></li>
                <li><a href="Admin_Login.jsp">ADMIN_LOGIN</a></li>
                <li><a href="">FEEDBACK</a></li>                
            </ul>
        </nav>
	</header>
	<section>
        <div class="box">
            <form method="post" action="Login_Form.jsp">
                <h2>Log In</h2>
                <input class="form-control" type="text" name="username" placeholder="Username" required=""><br>
                <input class="form-control" type="password" name="password" placeholder="Password" required=""/><br>
                <!-- <a href="msg.html"><input type="button" value="Log In"/></a><br><br> -->

<%@ page import ="java.sql.*" %>
  
<%
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        if (username != null && password != null){
        	Boolean valid = librarysystem.LibrarySystem.login(username, password);                        
        	if(valid){
    			session.setAttribute("username", username);
        		response.sendRedirect("msg.html");
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
