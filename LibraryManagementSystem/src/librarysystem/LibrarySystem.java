package librarysystem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LibrarySystem {

  static final String url = "jdbc:mysql://localhost:3306/LibrarySystem";

  public static void Insert(String isbn, String title, 
          String copies, String borrowed, String category, String price, String cover) {
      try {

          String insert = "INSERT INTO Books(ID, booksName, Copys, borrows, category, price, cover)" +
                  "VALUES (?, ?, ?, ?, ?, ?, ?)";

          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(url, "root", "root");
 
          PreparedStatement ps = con.prepareStatement(insert);

          ps.setString(1, isbn);
          ps.setString(2, title);
          ps.setString(3, copies);
          ps.setString(4, borrowed);
          ps.setString(5, category);
          ps.setString(6, price);
          ps.setString(7, cover);
          ps.executeUpdate();
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
          Connection con = DriverManager.getConnection(url, "root", "root");

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
          Connection con = DriverManager.getConnection(url, "root", "root");
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
          Connection con = DriverManager.getConnection(url, "root", "root");
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
