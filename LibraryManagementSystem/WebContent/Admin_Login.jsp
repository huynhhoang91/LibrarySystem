<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link href="CSS/student_login.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style type="text/css">
        section
        {
            margin-top: -20px;
        }
    </style>
</head>
<body>
    <div class=wrapper>
<header>

         <nav sytle="color:black" class="navbar navbar-Inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand">ONLINE LIBRARY SYSTEM</a>
            </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.html">HOME</a></li>
                    <li><a href="books.jsp">SEARCH_BOOKS</a></li>
                    <li><a href="user_books.jsp">MY_BOOKS</a></li>
            	</ul>
            	<ul class="nav navbar-nav navbar-right">        
                    <li><a href="Login_Form.jsp"><span class="glyphicon glyphicon-log-in"> STUDENT_LOGIN</span></a></li>
                    <li><a href="Admin_Login.jsp"><span class="glyphicon glyphicon-log-in"> ADMIN_LOGIN</span></a></li>
                    <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"> LOGOUT</span></a></li>
            	</ul>
            </div>
            </nav>

        </header>
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
            </form>
        </div>
	</section>
    </body>
</html>
