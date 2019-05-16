<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Student Registration</title>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />
    <link href="CSS/registration.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<%@ include file="header.html" %>

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
            Already have an account?<a href="login.html">&nbsp;Log In</a>
            </form>
        </div>
</section>
</body>
</html>
