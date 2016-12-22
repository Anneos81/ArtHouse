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
import com.arthouse.domain.Seller;
import com.mysql.jdbc.Connection;

public class SellerDAO {
	
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
				con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "12345");
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
	 
	  public Seller printProductSeller(int seller_id) throws Exception {
		  try {
		    	if (con == null) {
					throw new Exception("You must open a connection first");
				}
		      
		      String sql = "SELECT seller.name,seller.surname,seller.photo " +"FROM seller " 
					+ "WHERE user_id='"+ seller_id +"' ";
		      
		 	  PreparedStatement stmt = con.prepareStatement(sql);
		    //  stmt.setInt(1, seller_id);
		 	  ResultSet rs1 = stmt.executeQuery(sql);
		 	  Seller newseller = null ;
		      
		      while (rs1.next()) {
		    	  
		    	  newseller = new Seller(rs1.getString("name"), rs1.getString("surname"),rs1.getString("photo"));

				}

				rs1.close();
				stmt.close();

				return newseller;
		    } catch (Exception e5) {
		    	throw new Exception("An error occured while printing seller details from database: " + e5.getMessage());
		    }
		  }
	  
		public Seller authenticateSeller (String username, String password) throws Exception {
			
			if(con == null) {
				throw new Exception("You must open a connection first");
			}
			
			String sqlquery= "SELECT * FROM seller WHERE username=? AND password=?;";
			
			try {
				
				PreparedStatement stmt2 = con.prepareStatement(sqlquery);
				stmt2.setString( 1, username );
				stmt2.setString( 2, password );
				
				ResultSet rs = stmt2.executeQuery();
				
				if(!rs.next()) {
					rs.close();
					stmt2.close();
					throw new Exception("Wrong username or password");
				}
				
				rs.previous();
				
				Seller seller = null;
				
				while(rs.next()) {
					seller = new Seller(rs.getInt("user_id"),rs.getString("username"), rs.getString("password"),rs.getString("name"), rs.getString("surname"), rs.getString("email"), rs.getString("photo"))  ;				
				}
				
				rs.close();
				stmt2.close();
				
				return seller;			
				
			} catch (Exception e) {
				throw new Exception(e.getMessage());
			}		
			
		} //End of authenticateSeller
		
		public void registerSeller(Seller seller) throws Exception {

			try {System.out.println("mphke sth seller dao sth register seller");

				if(con == null) {
					throw new Exception("You must open a connection first");
				}
				
				String sql= "INSERT INTO  seller (username, password, name, surname, email, photo) VALUES (?, ?, ?, ?, ?, ?);";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				
//				stmt.setInt( 1, buyer.getUser_id() );
				stmt.setString( 1, seller.getUsername());
				stmt.setString( 2, seller.getPassword());
				stmt.setString( 3, seller.getName());
				stmt.setString( 4, seller.getSurname());
				stmt.setString( 5, seller.getEmail());
				stmt.setString( 6, seller.getPhoto_seller());
				System.out.println("stmt : "+stmt.toString());
				stmt.executeUpdate();			
				
				stmt.close();	
				
			} catch (SQLException e) {
				
				throw new Exception("Seller already exists.");
				
			} catch (Exception e) {
				
				throw new Exception("An error occured while inserting seller to database: " + e.getMessage());
			}
			
		}//End of registerSeller
		
		public Seller getSellerByID(int id) throws Exception {
			try { System.out.println("mphke");
				if(con == null) {
					throw new Exception("You must open a connection first");
				}
				
				Seller seller = null;
			
				String query = "SELECT * FROM seller WHERE user_id = ?";
		        PreparedStatement stmt1 = con.prepareStatement(query);
				stmt1.setInt(1, id);
				ResultSet rs = stmt1.executeQuery();
				
				if(rs.next()){
					seller = new Seller(rs.getInt("user_id"), 
						rs.getString("username"),  
						rs.getString("password"),
						rs.getString("name"), 
						rs.getString("surname"), 
						rs.getString("email"), 
						rs.getString("photo"));
				}

				rs.close();
				stmt1.close();
				System.out.println(seller.toString());	
				return seller;
			} catch (Exception e) {			
				throw new Exception("An error occured while searching for seller in the database: " + e.getMessage());
			}	
		} //end of getSellerByID
		
		public void deleteProduct(int product_id) throws Exception {

	        try { System.out.println("mphke sto servlet");
	        

	            if(con == null) {
	            	 System.out.println("prod id" + product_id);}
	            
	            String sql= "DELETE FROM product WHERE product_id=?;";
	            
	            PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setInt(1, product_id);
	            System.out.println("ekane to preparest");
	            
	            System.out.println(stmt.toString());
	            stmt.executeUpdate();    
	            
	            stmt.close();    
	            

	        } catch (SQLException e) {
	            
	            throw new Exception("SQL Exception... Bad Luck!");
	            
	        } catch (Exception e) {
	            
	            throw new Exception("An error occured while deleting product from database: " + e.getMessage());
	        }
	        
	    }//End of deleteProduct

		
		


}
