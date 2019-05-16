<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Books database</title>
<link rel="stylesheet" href="CSS/admin.css" type="text/css">
</head>
<body>

<br>

<div class="navigator">
<a id="currenttab" href="add.jsp">Add</a>
<a href="delete.jsp">Delete</a>
</div>
<%
  String isbn = request.getParameter("id");
  String title = request.getParameter("title");
  String copies = request.getParameter("copies");
  String category = request.getParameter("category");
  String price = request.getParameter("price");
  String cover = request.getParameter("cover");
  String coverFull = request.getParameter("coverFull");
  String author = request.getParameter("authorName");
  String publisher = request.getParameter("publisher");
  String publishingDate = request.getParameter("publishingDate");
  
  if (isbn != null && title != null 
          && copies != null && category!= null 
          && price!= null && cover!= null ) {
	  librarysystem.LibrarySystem.InsertBook(isbn, title, author, copies, "0", category, price, publisher,publishingDate, cover, coverFull);
  }
  
%>

<br> <br> <br>
<form method="post" action="add.jsp">


<table>

<tr>    
<td>ISBN*<td><input type="text" maxlength="13" name="id"></td>
</tr>
<tr>
<td>Title*</td><td><input type="text" name="title"></td>
</tr>
<tr>    
<td>Author*</td><td><input type="text" name="authorName"></td>
</tr>
<tr>
<td>Copies</td><td> <input type="text" name="copies" ></td>
</tr>
<tr>
<td>Category</td><td> <input type="text" name="category"></td>
</tr>
<tr>
<td>Price</td><td> <input type="text" name="price" placeholder="9.99"></td>
</tr>
<tr>
<td>Publisher</td><td><input type="text" name="publisher"></td>
</tr>
<tr>
<td>Publishing Date</td><td> <input type="text" name="publishingDate" placeholder="2019-10-1"></td>
</tr>
<tr>
<td>CoverImage</td><td> <input type="text" name="cover"></td>
</tr>
<tr>
<td>CoverImage Large</td><td> <input type="text" name="coverFull"></td>
</tr>



</table>


<br>
<input type="submit" value="submit">
</form>
</body>
</html>
