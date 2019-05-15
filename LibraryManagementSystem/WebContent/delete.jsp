<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@page import="java.util.*" %>

<html>
<head>
<title>Delete</title>
<link rel="stylesheet" href="CSS/admin.css" type="text/css">
        
</head>
<body>
<%
	Enumeration names = request.getParameterNames();
    while (names.hasMoreElements()) {
        String name = (String) names.nextElement();
        StringBuffer sb = new StringBuffer(name);
        sb.deleteCharAt(0);
        librarysystem.LibrarySystem.Delete(sb.toString());
    }

%>
<br>

<div class="navigator">
<a href="add.jsp">Add</a>
<a id="currenttab" href="delete.jsp">Delete</a>
</div>

<br> <br> <br>

<form action="delete.jsp" method="post">
<p>Search:<p><input type='search' name='search_term'></p>
<% 
	String search = request.getParameter("search_term");  
%>
<table>
<tr>
<th>Title</th>
<th>Copies</th>
<th>Borrowed</th>
<th>Category</th>
<th>Price</th>
<th>Cover</th>
</tr> 
<%

	List list = librarysystem.LibrarySystem.GetBooks(search);
	Long id = 0L;
	String box = null;

	Iterator<String> it = list.iterator();

	while (it.hasNext()) {
    	id = Long.parseLong(it.next());
    	out.print("<tr>");
    	for (int i = 0; i < 6; i++) {
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
 
</body>
</html>
