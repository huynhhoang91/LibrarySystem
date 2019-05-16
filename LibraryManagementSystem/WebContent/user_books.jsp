<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<%@page import="java.util.*" %>


<html>
<head>
<title>My Books</title>
<link href="CSS/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />      
</head>
<body>
<div class=wrapper>

<%@ include file="header.html" %>
<%
	String username = (String)session.getAttribute("username");

	out.println("Welcome " + username + "!");
	Enumeration names = request.getParameterNames();
	if(names.hasMoreElements()){
		String nope = (String)names.nextElement();
	}
	while (names.hasMoreElements()) {
    	String name = (String) names.nextElement();
    	StringBuffer sb = new StringBuffer(name);
    	sb.deleteCharAt(0);
    	librarysystem.LibrarySystem.returnBooks(username, sb.toString());
	}
%>
<br><br><br>

<div class="navigator">
<a href="search.jsp">Search</a>
<a id="currenttab" href="user_books.jsp">My Books</a>
</div>

<br> <br> <br>

<form action="user_books.jsp" method="post">
<table>
<tr>
<th>Title</th>
<th>Author</th>
<th>Copies</th>
<th>Borrowed</th>
<th>Category</th>
<th>Price</th>
<th>Cover</th>
<th>Date Borrowed</th>
<th>Date To Return By</th>
</tr>
<%
	List list = librarysystem.LibrarySystem.GetUserBooks(username);
	Long id = 0L;
	String box = null;

	Iterator<String> it = list.iterator();

	while (it.hasNext()) {
    	id = Long.parseLong(it.next());
    	out.print("<tr>");
    	for (int i = 0; i < 9; i++) {
        	out.print("<td>");
        	out.print(it.next());
        	out.print("</td>");
	}
	out.print("<td>");
	box = "<input name=r" + id + " type='checkbox'>";
	out.print(box);
	out.print("</td>");
	out.print("</tr>");
	}
%>
 
</table>
 
<br>
<input type="submit" value="Return">

</form>
</div> 
</body>
</html>
