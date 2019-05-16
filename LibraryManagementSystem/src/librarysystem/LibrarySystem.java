package librarysystem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LibrarySystem {

  static final String url = "jdbc:mysql://localhost:3306/LibrarySystem";
  static final String server = "root";
  static final String password = "root"; 
//all insert SQL
 public static void InsertBook(String isbn, String title, String author,  String copies, String borrowed,
            String category, String price, String publisher, String publishingDate, String cover ,String coverFull) {
     try {

         String books = "INSERT INTO Books(ID, booksName, publisher, Copys, borrows, category, price, cover, coverFull)" +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
         
         String authors = "INSERT IGNORE INTO author(authorName, DOB, gender)" +
                 "VALUES (?, ?, ?)";
         
         String writes = "INSERT INTO writes(booksID, authorName, publishingDate)" +
                 "VALUES (?, ?, ?)";

         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection(url, server, password);

         PreparedStatement ps = con.prepareStatement(books);

         ps.setString(1, isbn);
         ps.setString(2, title);
         ps.setString(3, publisher);
         ps.setString(4, copies);
         ps.setString(5, borrowed);
         ps.setString(6, category);
         ps.setString(7, price);
         ps.setString(8, cover);
         ps.setString(9, coverFull);
         ps.executeUpdate();
         
         PreparedStatement ps2 = con.prepareStatement(authors);
         ps2.setString(1,author);
         ps2.setString(2,"2019-10-1");
         ps2.setString(3,"x");
         ps2.executeUpdate();
         
         PreparedStatement ps3 = con.prepareStatement(writes);
         ps3.setString(1,isbn);
         ps3.setString(2,author);
         ps3.setString(3,publishingDate);
         ps3.executeUpdate();
         
         con.close();

     } catch (Exception ex) {
         Logger.getLogger(LibrarySystem.class.getName()).log(
                          Level.SEVERE, null, ex);
     }
 }

 public static void InsertAuthor(String author,  String DOB, String gender) {
  try {

      
      String authors = "INSERT INTO author(authorName, DOB, gender)" +
              "VALUES (?, ?, ?)";
      

      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection(url, server, password);

      PreparedStatement ps2 = con.prepareStatement(authors);
      ps2.setString(1,author);
      ps2.setString(2,DOB);
      ps2.setString(3, gender);
      ps2.executeUpdate();
            
      con.close();

  } catch (Exception ex) {
      Logger.getLogger(LibrarySystem.class.getName()).log(
                       Level.SEVERE, null, ex);
  }
}
 
public static void InsertWrite(String isbn, String author, String publishingDate) {
  try {

      String writes = "INSERT INTO writes(booksID, authorName, publishingDate)" +
              "VALUES (?, ?, ?)";

      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection(url, server, password);
      
      PreparedStatement ps3 = con.prepareStatement(writes);
      ps3.setString(1,isbn);
      ps3.setString(2,author);
      ps3.setString(3,publishingDate);
      ps3.executeUpdate();
      
      con.close();

  } catch (Exception ex) {
      Logger.getLogger(LibrarySystem.class.getName()).log(
                       Level.SEVERE, null, ex);
  }
}
 
public static void signup(String username, String apassword, String firstName,String lastName, String email) {
	   try {

	       Class.forName("com.mysql.jdbc.Driver");
	       Connection con = DriverManager.getConnection(url, server, password);
	       
	       PreparedStatement pst = con.prepareStatement("INSERT INTO users(username, userPassword, firstName, lastName, email) VALUES(?,?,?,?,?)");
	        pst.setString(1, username);
	        pst.setString(2, apassword);
	        pst.setString(3, firstName);
	        pst.setString(4, lastName);
	        pst.setString(5, email);
	        pst.executeUpdate();
	       
	       con.close();

	   } catch (Exception ex) {
	       Logger.getLogger(LibrarySystem.class.getName()).log(
	                        Level.SEVERE, null, ex);
	   }
	}

public static Boolean login(String username, String apassword) {
	   try {
		   
		    ResultSet rs = null;
		   	Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
	        Connection con = DriverManager.getConnection(url, server, password);    
	        PreparedStatement pst = con.prepareStatement("SELECT username, userPassword FROM users WHERE username=? and userPassword=?");
	        pst.setString(1, username);
	        pst.setString(2, apassword);
	        rs = pst.executeQuery();
	        if(rs.next()){
	        	con.close();	        	
	        	return true;
	        }
	        else{
	        	con.close();	        	
	        	return false;
	        }
	   } catch (Exception ex) {
	       Logger.getLogger(LibrarySystem.class.getName()).log(
	                        Level.SEVERE, null, ex);
	       return false;
	   }
	}

public static Boolean adminLogin(String username, String apassword) {
	   try {
		   
		    ResultSet rs = null;
		   	Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
	        Connection con = DriverManager.getConnection(url, server, password);    
	        PreparedStatement pst = con.prepareStatement("SELECT adminName, adminPassword FROM Admins WHERE adminName=? and adminPassword=?");
	        pst.setString(1, username);
	        pst.setString(2, apassword);
	        rs = pst.executeQuery();
	        if(rs.next()){
	        	con.close();	        	
	        	return true;
	        }
	        else{
	        	con.close();	        	
	        	return false;
	        }
	   } catch (Exception ex) {
	       Logger.getLogger(LibrarySystem.class.getName()).log(
	                        Level.SEVERE, null, ex);
	       return false;
	   }
	}


public static void InsertEquipment(String ID, String equName, String number) {
	   try {

	       String writes = "INSERT INTO writes(ID, equipName, totalNumber)" +
	               "VALUES (?, ?, ?)";

	       Class.forName("com.mysql.jdbc.Driver");
	       Connection con = DriverManager.getConnection(url, server, password);
	       
	       PreparedStatement ps3 = con.prepareStatement(writes);
	       ps3.setString(1,ID);
	       ps3.setString(2,equName);
	       ps3.setString(3,number);
	       ps3.executeUpdate();
	       
	       con.close();

	   } catch (Exception ex) {
	       Logger.getLogger(LibrarySystem.class.getName()).log(
	                        Level.SEVERE, null, ex);
	   }
	}
public static void CheckOutBook(String username, String bookID, String borrowDate, String returnDate) {
    try {
        String check = "INSERT INTO BorrowBook(username, booksID, borrowDate, returnDate)" + 
      		  	"VALUES(?, ?, ?, ?)";

        String update = "update books SET borrows = (borrows + 1) WHERE  ID = ?";
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, server, password);
        PreparedStatement ps = con.prepareStatement(check);

        ps.setString(1, username);
        ps.setString(2, bookID);
        ps.setString(3, borrowDate);
        ps.setString(4, returnDate);
        ps.executeUpdate();
        con.close();
        
        PreparedStatement up = con.prepareStatement(update);

        up.setString(1, bookID);
        up.executeUpdate();
        

    } catch (Exception ex) {
        Logger.getLogger(LibrarySystem.class.getName()).log( 
           Level.SEVERE, null, ex);
    }
}

public static void CheckOutEquipment(String username, String equID, String borrowDate, String returnDate) {
    try {
        String check = "INSERT INTO BorrowEquipment(username, equipmentID, borrowDate, returnDate)" + 
      		  	"VALUES(?, ?, ?, ?)";
        
        String update = "update equipment SET borrows = (borrows + 1) WHERE  ID = ?";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, server, password);
        PreparedStatement ps = con.prepareStatement(check);

        ps.setString(1, username);
        ps.setString(2, equID);
        ps.setString(3, borrowDate);
        ps.setString(4, returnDate);
        ps.executeUpdate();
        
        PreparedStatement up = con.prepareStatement(update);

        up.setString(1, equID);
        up.executeUpdate();
        
        con.close();

    } catch (Exception ex) {
        Logger.getLogger(LibrarySystem.class.getName()).log( 
           Level.SEVERE, null, ex);
    }
}
//update SQL

public static void returnBooks(String username, String bookID, String borrowDate, String returnDate) {
    try {
        String ret = "UPDATE borrowequipment SET returned = 1" + 
       		 "WHERE username = ? and equipmentID = ? and borrowDate = ? and returnDate = ?";
        
        String update = "update equipment SET borrows = (borrows - 1) WHERE  ID = ?";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, server, password);
        PreparedStatement ps = con.prepareStatement(ret);

        ps.setString(1, username);
        ps.setString(2, bookID);
        ps.setString(3, borrowDate);
        ps.setString(4, returnDate);
        ps.executeUpdate();
        
        PreparedStatement up = con.prepareStatement(update);

        up.setString(1, bookID);
        up.executeUpdate();
        
        con.close();

    } catch (Exception ex) {
        Logger.getLogger(LibrarySystem.class.getName()).log( 
           Level.SEVERE, null, ex);
    }
}

public static void returnEquipment(String username, String equID, String borrowDate, String returnDate) {
    try {
        String ret = "UPDATE borrowequipment SET returned = 1" + 
       		 "WHERE username = ? and equipmentID = ? and borrowDate = ? and returnDate = ?";
        
        String update = "update equipment SET borrows = (borrows - 1) WHERE  ID = ?";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, server, password);
        PreparedStatement ps = con.prepareStatement(ret);

        ps.setString(1, username);
        ps.setString(2, equID);
        ps.setString(3, borrowDate);
        ps.setString(4, returnDate);
        ps.executeUpdate();
        
        PreparedStatement up = con.prepareStatement(update);

        up.setString(1, equID);
        up.executeUpdate();
        
        con.close();

    } catch (Exception ex) {
        Logger.getLogger(LibrarySystem.class.getName()).log( 
           Level.SEVERE, null, ex);
    }
}

//projection SQL
 public static List GetBooks(String search_term, String filter) {

     List<String> list = new ArrayList<String>();

     try {
   	  String select = "SELECT * FROM (Books JOIN Writes On Books.ID = Writes.booksID) WHERE " + filter + " LIKE ?";
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection(url, server, password);

         PreparedStatement ps = con.prepareStatement(select);
         ps.setString(1, "%" + search_term + "%");
         ResultSet result = ps.executeQuery();   
         
         while(result.next())
         {
            list.add(result.getString("ID"));
            list.add(result.getString("booksName"));
            list.add(result.getString("authorName"));
            list.add(result.getString("Copys"));
            list.add(result.getString("borrows"));
            list.add(result.getString("category"));
            list.add(result.getString("price"));
            list.add(result.getString("cover"));
         } 

         con.close();

     } catch (Exception ex) {
         Logger.getLogger(LibrarySystem.class.getName()).log( 
                          Level.SEVERE, null, ex);
     }
         return list;
 }

//Delete SQL
 
 public static void Delete(String id) {
     try {
         String delete = "DELETE from Books WHERE ISBN = ?";
         String delete2 = "DELETE from writes WHERE booksID = ?";

         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection(url, server, password);
         PreparedStatement ps = con.prepareStatement(delete);

         ps.setString(1, id);
         ps.executeUpdate();
         
         PreparedStatement ps2 = con.prepareStatement(delete2);

         ps2.setString(1, id);
         ps2.executeUpdate();
         
         con.close();

     } catch (Exception ex) {
         Logger.getLogger(LibrarySystem.class.getName()).log( 
            Level.SEVERE, null, ex);
     }
 }
 
}
