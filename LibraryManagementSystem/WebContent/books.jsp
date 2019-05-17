<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<%@page import="java.util.*" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@ include file="header.html" %>
<%
	String username = (String)session.getAttribute("username");

	int noOfDays = 14; //i.e two weeks
	Calendar calendar = Calendar.getInstance();
	Date bDate = calendar.getTime();
	//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
	calendar.add(Calendar.DAY_OF_YEAR, noOfDays);
	Date rDate = calendar.getTime();
	//String returnDate = dateFormat.format(rDate);

	Enumeration names = request.getParameterNames();
	if(names.hasMoreElements()){
		String nope = (String)names.nextElement();
	}
	while (names.hasMoreElements()) {
    	String name = (String) names.nextElement();
    	StringBuffer sb = new StringBuffer(name);
    	sb.deleteCharAt(0);
    	librarysystem.LibrarySystem.CheckOutBook(username, sb.toString(), bDate, rDate);
	}
%>
<br><br><br>

<br> <br> <br>

<form action="books.jsp" method="post">
<p>Search:<p><input type='search' name='search_term'></p>
<p>Search Type:</p><p><select name="type">
<option value="-1">-Select Filter-</option>
<option value="booksName">title</option>
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
<input type="submit" value="Check Out">

</form>
 </div>
</body>
</html>
