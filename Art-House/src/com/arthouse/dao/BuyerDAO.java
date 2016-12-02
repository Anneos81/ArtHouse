package com.arthouse.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.arthouse.domain.Buyer;
import com.arthouse.domain.Product;
import com.arthouse.domain.Rating;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class BuyerDAO {

	 private Connection con = null;
	

	 public void open() throws SQLException {
			try {
				// dynamically load the driver's class file into memory
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (Exception e) {

				throw new SQLException("MySQL Driver error: " + e.getMessage());
			}

			try {
				// establish a connection with the database and creates a Connection
				con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/arthouse", "root", "rootroot");
				//con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/painting", "root", "olgaioak8");
			} catch (Exception e) {
				con = null;
				// throw SQLException if a database access error occurs
				throw new SQLException("Could not establish connection with the Database Server: " + e.getMessage());
			}

		} // End of open
	  
	 public void close() throws SQLException {
			try {
				// if connection is open
				if (con != null)
					con.close(); // close the connection to the database to end
									// database session

			} catch (Exception e3) {

				throw new SQLException("Could not close connection with the Database Server: " + e3.getMessage());
			}

		}// end of close
	 
	  public List<Product> printRatedProductsByBuyer(int buyer_id) throws Exception {
		    try {
		    	if (con == null) {
					throw new Exception("You must open a connection first");
				}
		      
		      String sql = "SELECT product.*, rating.* " +"FROM product " + "INNER JOIN rating "
					+ "ON product.product_id= rating.product_id "
					+ "WHERE rating.user_id='"+ buyer_id +"' ORDER BY grade desc ";
		      
		    
		 	  PreparedStatement stmt = con.prepareStatement(sql);
		      //stmt.setInt(1, buyer_id);
		 	  ResultSet rs1 = stmt.executeQuery(sql);
		      
		      List<Product> ratedProductList = new ArrayList<Product>();
		      List<Rating> ratelist = new ArrayList<Rating>();
		      
		      while (rs1.next()){
		    	  ratelist.add(new Rating(rs1.getInt("user_id"), rs1.getInt("product_id"),rs1.getInt("grade"))); 
		    	  ratedProductList.add(new Product(rs1.getInt("product_id"),rs1.getString("title"), rs1.getInt("price"), rs1.getString("description"),
			    			 rs1.getString("dimensions"),rs1.getString("category"),rs1.getString("picture"), ratelist));
		      }

				rs1.close();
				stmt.close();

				return ratedProductList;
		      
		    } catch (Exception e5) {
		    	throw new Exception("An error occured while getting rated products from database: " + e5.getMessage());
			}
		   
		  }
	  
		public Buyer authenticateBuyer (String username, String password) throws Exception {
			
			if(con == null) {
				throw new Exception("You must open a connection first");
			}
			
			String sqlquery= "SELECT * FROM buyer WHERE username='"+ username +"' AND password='"+ password +"';";
			
			try {
				
				PreparedStatement stmt2 = con.prepareStatement(sqlquery);
//				stmt2.setString( 1, username );
//				stmt2.setString( 2, password );
				
				ResultSet rs = stmt2.executeQuery();
				
				if(!rs.next()) {
					rs.close();
					stmt2.close();
					throw new Exception("Wrong username or password");
				}
				
				rs.previous();
				
				Buyer buyer = null;
				
				while(rs.next()) {
					buyer = new Buyer(rs.getInt("user_id"),rs.getString("username"), rs.getString("password"),rs.getString("name"), rs.getString("surname"), rs.getString("email"))  ;				
				}
				
				rs.close();
				stmt2.close();
				
				return buyer;			
				
			} catch (Exception e) {
				throw new Exception(e.getMessage());
			}		
			
		} //End of authenticateBuyer
		
		public void registerBuyer(Buyer buyer) throws Exception {

			try {

				if(con == null) {
					throw new Exception("You must open a connection first");
				}
				
				// "INSERT INTO  buyer (username, password, name, surname, email) VALUES (?, ?, ?, ?, ?);";
				 String sql= "INSERT INTO `buyer`(`username`, `password`, `name`, `surname`, `email`) VALUES (?, ?, ?, ?, ?);";

				
				PreparedStatement stmt = con.prepareStatement(sql);
				
//				stmt.setInt( 1, buyer.getUser_id() );
				stmt.setString( 1, buyer.getUsername());
				stmt.setString( 2, buyer.getPassword());
				stmt.setString( 3, buyer.getName());
				stmt.setString( 4, buyer.getSurname());
				stmt.setString( 5, buyer.getEmail());
				System.out.println("register buyer method"+stmt.toString());
				stmt.executeUpdate();			
				
				stmt.close();	
				
			} catch (SQLException e) {
				
				throw new Exception("Buyer already exists.");
				
			} catch (Exception e) {
				
				throw new Exception("An error occured while inserting buyer to database: " + e.getMessage());
			}
			
		}//End of registerBuyer
}