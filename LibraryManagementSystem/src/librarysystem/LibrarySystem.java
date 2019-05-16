package librarysystem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LibrarySystem {
	
//Change for different server
  static final String url = "jdbc:mysql://localhost:3306/library";
  static final String server = "root";
  static final String password = "39043904"; 
  
  public static void InsertBook(String isbn, String title, String author,  String copies, String borrowed,
             String category, String price, String publisher, String publishingDate, String cover ,String coverFull) {
      try {

          String books = "INSERT INTO Books(ID, booksName, publisher, Copys, borrows, category, price, cover, coverFull)" +
                  "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
          
          String authors = "INSERT INTO author(authorName, DOB, gender)" +
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

  public static List GetBooks(String search_term) {

      List<String> list = new ArrayList<String>();

      try {
    	  String select = "SELECT * FROM Books WHERE booksName LIKE ?";
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(url, server, password);

          PreparedStatement ps = con.prepareStatement(select);
          ps.setString(1, "%" + search_term + "%");
          ResultSet result = ps.executeQuery();   
          
          while(result.next())
          {
             list.add(result.getString("ID"));
             list.add(result.getString("booksName"));
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

  public static void Delete(String id) {
      try {
          String delete = "DELETE from Books WHERE ID = ?";

          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(url, server, password);
          PreparedStatement ps = con.prepareStatement(delete);

          ps.setString(1, id);
          ps.executeUpdate();
          con.close();

      } catch (Exception ex) {
          Logger.getLogger(LibrarySystem.class.getName()).log( 
             Level.SEVERE, null, ex);
      }
  }
  
  public static void CheckOut(String username, String bookID, String borrowDate, String returnDate) {
      try {
          String check = "INSERT INTO BorrowBook(username, booksID, borrowDate, returnDate)" + 
        		  	"VALUES(?, ?, ?, ?)";

          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(url, server, password);
          PreparedStatement ps = con.prepareStatement(check);

          ps.setString(1, username);
          ps.setString(2, bookID);
          ps.setString(3, borrowDate);
          ps.setString(4, returnDate);
          ps.executeUpdate();
          con.close();

      } catch (Exception ex) {
          Logger.getLogger(LibrarySystem.class.getName()).log( 
             Level.SEVERE, null, ex);
      }
  }
}
