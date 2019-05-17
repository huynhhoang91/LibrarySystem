<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>

<%@page import="java.util.*" %>

<%@ include file="header.html" %>
<%
	String username = (String)session.getAttribute("username");

	Enumeration names = request.getParameterNames();
	while (names.hasMoreElements()) {
    	String name = (String) names.nextElement();
    	StringBuffer sb = new StringBuffer(name);
    	sb.deleteCharAt(0);
    	librarysystem.LibrarySystem.returnBooks(username, sb.toString());
	}
%>

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
<th>Returned?</th>
</tr>
<%
	List list = librarysystem.LibrarySystem.GetUserBooks(username);
	String id = "";
	String box = null;

	Iterator<String> it = list.iterator();

	while (it.hasNext()) {
    	id = it.next();
    	out.print("<tr>");
    	for (int i = 0; i < 10; i++) {
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
</body>
</html>
