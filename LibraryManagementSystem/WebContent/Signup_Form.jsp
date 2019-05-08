<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="CSS\signup.css" rel="stylesheet" type="text/css" />
    <title>Untitled Document</title>
    </head>
    <body>
        <div class="signup">
            <form method="post" action="Signup_Form.jsp">
                <h2>Sign Up</h2>
                <h3>Enter a Username</h3><br>
                <input type="text" name="username" placeholder="Username"/><br><br>
                <h3>Enter a Password</h3>
                <input type="password" name="password" placeholder="Password"><br><br>
                <h3>Confirm a Password</h3>
                <input type="password" name="Cpassword" placeholder="Confirm Password"><br><br>
                <h3>First Name</h3>
                <input type="text" name="first" placeholder="First Name"><br><br>
                <h3>Last Name</h3>
                <input type="text" name="last" placeholder="Last Name"><br><br>
                <h3>Email</h3>
                <input type="text" name="email" placeholder="abc@abc.asb"><br><br>                   
                <p class="submit"><input type="submit"   value="Signup"></p>
                Already have an account?<a href="Login_Form.jsp">&nbsp;Log In</a>
            </form>
        </div>
	</body>
</html> -->

<%@ page import ="java.sql.*" %>

<%
	try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        String Cpassword = request.getParameter("Cpassword");
        String firstName = request.getParameter("first");
        String lastName = request.getParameter("last");
        String email = request.getParameter("email");
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibrarySystem?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("INSERT INTO users(username, password, firstName, lastName, email) VALUES(?,?,?,?,?)");
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, firstName);
        pst.setString(4, lastName);
        pst.setString(5, email);
        pst.executeUpdate();
        out.println("Successfully Signed up! Please Login.");
	}
	catch(SQLException e){       
    out.println("Something went wrong !! Please try again");       
	}  
%>