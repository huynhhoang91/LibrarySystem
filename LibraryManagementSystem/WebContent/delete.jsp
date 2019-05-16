<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@page import="java.util.*" %>

<html>
<head>
<title>Delete Books</title>
<link href="CSS/style.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />

</head>
<body>
<div class=wrapper>

<%@ include file="header.html" %>
<%
	Enumeration names = request.getParameterNames();
    while (names.hasMoreElements()) {
        String name = (String) names.nextElement();
        StringBuffer sb = new StringBuffer(name);
        sb.deleteCharAt(0);
        librarysystem.LibrarySystem.Delete(sb.toString());
    }

%>
<br><br><br>

<div class="navigator">
<a href="add.jsp">Add</a>
<a id="currenttab" href="delete.jsp">Delete</a>
</div>

<br> <br> <br>

<form action="delete.jsp" method="post">
<p>Search:<p><input type='text' name='search_term'></p>
<p>Filter:</p><p><select name="type">
<option value="-1">-Select Filter-</option>
<option value="booksName">Title</option>
<option value="authorName">Author</option>
<option value="ID">ISBN</option>
<option value="category">Category</option>
</select></p>
<p><input type="submit" value="Search Book" /></p>
<% 
	String search = request.getParameter("search_term");  
	String filter = request.getParameter("type"); 
%>
<table>
<tr>
<th>Title</th>
<th>Author</th>
<th>Copies</th>
<th>Borrowed</th>
<th>Category</th>
<th>Price</th>
<th>Cover</th>
</tr> 
<%

	List list = librarysystem.LibrarySystem.GetBooks(search, filter);
	Long id = 0L;
	String box = null;

	Iterator<String> it = list.iterator();

	while (it.hasNext()) {
    	id = Long.parseLong(it.next());
    	out.print("<tr>");
    	for (int i = 0; i < 7; i++) {
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
<input type="submit" value="Delete">

</form>
</div>
</body>
</html>
