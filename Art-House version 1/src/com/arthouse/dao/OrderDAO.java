package com.arthouse.dao;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.arthouse.domain.Order;
import com.arthouse.domain.Product;
import com.mysql.jdbc.Connection;

public class OrderDAO {
	
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
	 
	  public List<Order> printOrdersByBuyer(int buyer_id) throws Exception{
		    try {
		    	if (con == null) {
					throw new Exception("You must open a connection first");
			      }
			      
			      String sql = "SELECT `order`.* " + "FROM `order` "
						+ "WHERE `order`.user_id='"+ buyer_id +"' ";
			      
			      PreparedStatement stmt = con.prepareStatement(sql);
			   //   stmt.setInt(1, buyer_id);
			      ResultSet rs1 = stmt.executeQuery(sql);
			      List<Order> orders = new ArrayList<Order>();
			      while(rs1.next()){
			    	  orders.add(new Order(rs1.getInt("order_id"),rs1.getDouble("amount"),rs1.getInt("quantity"),rs1.getDate("date"),rs1.getInt("user_id")));
			      }
							
			      return orders;
			    } catch (Exception e5) {
			    	throw new Exception("An error occured while printing orders by buyer in the database: " + e5.getMessage());
			    }
		  
	  }
	  
	  public List<Product> printOrderProducts(int order_id) throws Exception{
		  
		    try {
		    	if (con == null) {
					throw new Exception("You must open a connection first");
			      }
			      
			      String sql = "SELECT product.* " + "FROM product " + "INNER JOIN order_product " +"ON product.product_id=order_product.product_id "
						+ "WHERE order_id='"+ order_id+"' ";
			      
			      PreparedStatement stmt = con.prepareStatement(sql);
			  //    stmt.setInt(1, order_id);
			      ResultSet rs1 = stmt.executeQuery(sql);
			      List<Product> productList = new ArrayList<Product>();
			      
			      while (rs1.next()) {

			    	  productList.add(new Product(rs1.getInt("user_id"),rs1.getString("title"), rs1.getInt("price"), rs1.getString("description"),rs1.getString("dimensions"),rs1.getString("category"),rs1.getString("picture")));

					}
			      
			      return productList;
			    } catch (Exception e5) {
			    	throw new Exception("An error occured while printing order products in the database: " + e5.getMessage());
			    }
	  }
		    
	  public int insertOrder(Order ord) throws Exception{
		  
		    try {
		    	if (con == null) {
					throw new Exception("You must open a connection first");
			      }
			      
		    	  String sql= "INSERT INTO  `order` (amount, quantity, date, user_id) VALUES (?, ?, ?, ?);";
			      
			      PreparedStatement stmt = con.prepareStatement(sql);
			      stmt.setDouble( 1, ord.getAmount());
		     	  stmt.setInt( 2, ord.getQuantity());
	        	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		     	 String mysqlDate = sdf.format(ord.getDate());
				  stmt.setString( 3, mysqlDate);
				  stmt.setInt( 4, ord.getBuyer_id());
				  
				  System.out.println(stmt.toString());
				  
				  stmt.executeUpdate();		
				  
				  stmt.close();	
				  
		    	  String sqlq= "SELECT order_id FROM `order` ORDER BY order_id DESC LIMIT 1;";
			      
			      PreparedStatement stmt1 = con.prepareStatement(sqlq);
			      ResultSet rs1 = stmt1.executeQuery(sqlq);
			      rs1.next();
			      int order_id = rs1.getInt("order_id");
			      return order_id;
				  
			    } catch (Exception e6) {
			    	throw new Exception("An error occured while insering order in the database: " + e6.getMessage());
			    	
			    }
		  
		  
	  } // end of insertOrder
	  
	  public void insertOrderProduct(int order_id, int product_id) throws Exception{
		  
		    try {
		    	if (con == null) {
					throw new Exception("You must open a connection first");
			      }
			  
				  String sqlq= "INSERT INTO  order_product (order_id, product_id) VALUES (?, ?);";
				  PreparedStatement stmt1 = con.prepareStatement(sqlq);
			      stmt1.setInt( 1, order_id);
		     	  stmt1.setInt( 2, product_id); 
				  
				  stmt1.executeUpdate();		
				  
				  stmt1.close();
				 
			    } catch (Exception e6) {
			    	throw new Exception("An error occured while inserting values in order_product in the database: " + e6.getMessage());
			    }
		  
		  
	  } // end of insertOrderProduct


}
