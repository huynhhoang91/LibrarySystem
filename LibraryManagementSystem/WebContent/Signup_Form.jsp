<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="CSS/registration.css" rel="stylesheet" type="text/css">
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

         <nav style="color:black" class="navbar navbar-Inverse">
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
        <form method="post" action="Signup_Form.jsp">
            <h2>Sign Up</h2>

            <h3>Enter a Username</h3>
            <input class="form-control" type="text" name="username" placeholder="Username" required=""/>
            <h3>Enter a Password</h3>
            <input class="form-control" type="password" name="password" placeholder="Password" required="">
            <h3>Confirm a Password</h3>
            <input class="form-control" type="password" name="Cpassword" placeholder="Confirm Password" required="">
            <h3>First Name</h3>
            <input class="form-control" type="text" name="first" placeholder="First Name" required="">
            <h3>Last Name</h3>
            <input class="form-control" type="text" name="last" placeholder="Last Name" required="">
            <h3>Email</h3>
            <input class="form-control" type="text" name="email" placeholder="abc@abc.asb" required=""><br>

<%@ page import ="java.util.*" %>

<%
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        String Cpassword = request.getParameter("Cpassword");
        String firstName = request.getParameter("first");
        String lastName = request.getParameter("last");
        String email = request.getParameter("email");
        if (username != null && password != null 
                && Cpassword!= null && firstName!= null 
                && lastName!= null && email!= null ) {
        	librarysystem.LibrarySystem.signup(username, password, firstName, lastName, email);  
        	out.println("Successfully Signed up! Please Login.");
        }
%>
				 <p class="submit"><input 
                class="btn btn-default" 
                type="submit" 
                value="Signup" 
                style="color: black; width: 70px; height: 30px"></p>
            Already have an account?<a href="Login_Form.jsp">&nbsp;Log In</a>
            </form>
        </div>
</section>
</div>
</body>
</html>
