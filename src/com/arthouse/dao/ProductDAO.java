

package com.arthouse.dao;

import com.arthouse.domain.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProductDAO {    
    public final static int PRODUCTS_PER_PAGE = 12;
    
    public ProductDAO() {
        // TODO Auto-generated constructor stub
    }

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
            // object (con)\
        	
        	//con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/painting", "root", "olgaioak8");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/arthouse", "root", "rootroot");
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
                con.close(); // close the connection to the database to end database session            

        } catch (Exception e3) {
            
            throw new SQLException("Could not close connection with the Database Server: " + e3.getMessage());
        }

    }

    public Product findProductByID(int id) throws Exception {
        try {
            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            
            Product product = null;
        
            String query = "SELECT * FROM product WHERE product_id = ?;";
            PreparedStatement stmt1 = con.prepareStatement(query);
            stmt1.setInt(1, id);
            ResultSet rs = stmt1.executeQuery();
            
            if(rs.next()){
                product = new Product(rs.getInt("product_id"), 
                    rs.getInt("user_id"), 
                    rs.getString("title"),  
                    rs.getInt("price"),
                    rs.getString("description"), 
                    rs.getString("dimensions"), 
                    rs.getString("category"), 
                    rs.getString("picture"));
            }

            rs.close();
            stmt1.close();
            
            return product;
        } catch (Exception e) {            
            throw new Exception("An error occured while finding a product in the database: " + e.getMessage());
        }        
    }
    
    public ArrayList<Product> getProducts() throws Exception {
        try {
            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            
            ArrayList<Product> pList = new ArrayList<Product>();
            
            String query = "select * from product;";
            PreparedStatement stmt1 = con.prepareStatement(query);            
            ResultSet rs = stmt1.executeQuery();
            
            while(rs.next()){
                Product p = new Product(rs.getInt("product_id"), 
                        rs.getInt("user_id"), 
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getString("description"),
                        rs.getString("dimensions"),
                        rs.getString("category"),
                        rs.getString("picture"));
                pList.add(p);
            }

            rs.close();
            stmt1.close();
            
            return pList;
        } catch (Exception e) {            
            throw new Exception("An error occured while searching for product in the database: " + e.getMessage());
        }        
    }

    public int countProducts() throws Exception {
        try {
            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            
            String query = "select count(product_id) as count from product;";
            PreparedStatement stmt1 = con.prepareStatement(query);            
            ResultSet rs = stmt1.executeQuery();
            int maxProducts = 0;
            
            if(rs.next()) {
            	maxProducts = rs.getInt("count");
            }

            rs.close();
            stmt1.close();
            
            return maxProducts;
        } catch (Exception e) {            
            throw new Exception("An error occured while searching for product in the database: " + e.getMessage());
        }        
    }
    
    public ArrayList<Product> getProductsByPage(int page) throws Exception {
        try {
            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            ArrayList<Product> pList = new ArrayList<Product>();            
            String query = "select * from product limit ? offset ?;";
            
            PreparedStatement stmt1 = con.prepareStatement(query);   
            stmt1.setInt(1, PRODUCTS_PER_PAGE);  
            stmt1.setInt(2, (page - 1) * PRODUCTS_PER_PAGE);
            ResultSet rs = stmt1.executeQuery();
            
            while(rs.next()){
                Product p = new Product(rs.getInt("product_id"), 
                        rs.getInt("user_id"), 
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getString("description"),
                        rs.getString("dimensions"),
                        rs.getString("category"),
                        rs.getString("picture"));
                pList.add(p);
            }

            rs.close();
            stmt1.close();
            
            return pList;
        } catch (Exception e) {            
            throw new Exception("An error occured while searching for product in the database: " + e.getMessage());
        }        
    }
    
    
	public List<Product> getProductsOrderedByPrice(int page) throws Exception {
		try {
			if(con == null) {
				throw new Exception("You must open a connection first");
			}
			
			ArrayList<Product> pList = new ArrayList<Product>();
			
			//my code here 
			String query = "select * from product order by price limit ? offset ?;";
	        PreparedStatement stmt1 = con.prepareStatement(query);	
            stmt1.setInt(1, PRODUCTS_PER_PAGE);  
            stmt1.setInt(2, (page - 1) * PRODUCTS_PER_PAGE);        
			ResultSet rs = stmt1.executeQuery();
			
			while(rs.next()){
				Product p = new Product(rs.getInt("product_id"), 
						rs.getInt("user_id"), 
						rs.getString("title"),
						rs.getInt("price"),
						rs.getString("description"),
						rs.getString("dimensions"),
						rs.getString("category"),
						rs.getString("picture"));
				pList.add(p);
			}

			rs.close();
			stmt1.close();
			
			return pList;
		} catch (Exception e) {			
			throw new Exception("An error occured while searching for product in the database: " + e.getMessage());
		}		
	}
	
	public List<Product> getProductsWithRating(int page) throws Exception {
		try {
			if(con == null) {
				throw new Exception("You must open a connection first");
			}
			
			ArrayList<Product> pList = new ArrayList<Product>();
			
			//my code here 
			String query = "SELECT p.*, avg(r.grade) as rating FROM product AS p LEFT JOIN rating AS r ON p.product_id = r.product_id group by p.product_id order by rating desc  limit ? offset ?;";
	        PreparedStatement stmt1 = con.prepareStatement(query);	
            stmt1.setInt(1, PRODUCTS_PER_PAGE);  
            stmt1.setInt(2, (page - 1) * PRODUCTS_PER_PAGE);           
			ResultSet rs = stmt1.executeQuery();
			
			while(rs.next()){
				pList.add(new Product(rs.getInt("product_id"), 
						rs.getInt("user_id"), 
						rs.getString("title"),
						rs.getInt("price"),
						rs.getString("description"),
						rs.getString("dimensions"),
						rs.getString("category"),
						rs.getString("picture"),
						rs.getDouble("rating")));
			}

			rs.close();
			stmt1.close();
			
			return pList;
		} catch (Exception e) {			
			throw new Exception("An error occured while searching for product in the database: " + e.getMessage());
		}		
	}
	
	public List<String> getAllCategories() throws Exception {
		try {
			if(con == null) {
				throw new Exception("You must open a connection first");
			}
			
			List<String> cList = new ArrayList<String>();
		
			String query = "SELECT distinct category from product;";
	        PreparedStatement stmt1 = con.prepareStatement(query);   
			ResultSet rs = stmt1.executeQuery();
			
			while(rs.next()){
				cList.add(rs.getString("category"));
			}

			rs.close();
			stmt1.close();
			
			return cList;
		} catch (Exception e) {			
			throw new Exception("An error occured while searching for student in the database: " + e.getMessage());
		}	
	}

    public int countProductsByCategory(String category) throws Exception {
        try {
            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            
            String query = "select count(product_id) as count from product where product.category=?;";
            PreparedStatement stmt1 = con.prepareStatement(query);     
			stmt1.setString(1, category);	       
            ResultSet rs = stmt1.executeQuery();
            int maxProducts = 0;
            
            if(rs.next()) {
            	maxProducts = rs.getInt("count");
            }

            rs.close();
            stmt1.close();
            
            return maxProducts;
        } catch (Exception e) {            
            throw new Exception("An error occured while searching for product in the database: " + e.getMessage());
        }        
    }
    
	public List<Product> getProductsByCategory(String category, int page) throws Exception {
		try {
			if(con == null) {
				throw new Exception("You must open a connection first");
			}
			
			List<Product> prodList = new ArrayList<Product>();
		
			String query = "SELECT * from product where product.category=? limit ? offset ?;" ;
	        PreparedStatement stmt1 = con.prepareStatement(query);
			stmt1.setString(1, category);
            stmt1.setInt(2, PRODUCTS_PER_PAGE);  
            stmt1.setInt(3, (page - 1) * PRODUCTS_PER_PAGE);    
			ResultSet rs = stmt1.executeQuery();
			
			while(rs.next()){
				prodList.add(new Product(rs.getInt("product_id"), 
					rs.getInt("user_id"), 
					rs.getString("title"),
					rs.getInt("price"),
					rs.getString("description"),
					rs.getString("dimensions"),
					rs.getString("category"),
					rs.getString("picture")));
			}

			rs.close();
			stmt1.close();
			
			return prodList;
		} catch (Exception e) {			
			throw new Exception("An error occured while searching for student in the database: " + e.getMessage());
		}		
	}
	
	public int countProductsBySearch(String title) throws Exception {
        try {
            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            
            String query = "select count(product_id) as count from product where product.title LIKE ?;";
            PreparedStatement stmt1 = con.prepareStatement(query);     
			stmt1.setString(1, title);	       
            ResultSet rs = stmt1.executeQuery();
            int maxProducts = 0;
            
            if(rs.next()) {
            	maxProducts = rs.getInt("count");
            }

            rs.close();
            stmt1.close();
            
            return maxProducts;
        } catch (Exception e) {            
            throw new Exception("An error occured while searching for product in the database: " + e.getMessage());
        }        
    }
	
	public List<Product> searchProductsByTitle(String title, int page) throws Exception {
		try {
			if(con == null) {
				throw new Exception("You must open a connection first");
			}
			
			List<Product> prodList = new ArrayList<Product>();
		
			String query = "SELECT product.* FROM product WHERE product.title LIKE ? limit ? offset ?;" ;
	        PreparedStatement stmt1 = con.prepareStatement(query);
			stmt1.setString(1,  "%" + title + "%");
            stmt1.setInt(2, PRODUCTS_PER_PAGE);  
            stmt1.setInt(3, (page - 1) * PRODUCTS_PER_PAGE);    
			ResultSet rs = stmt1.executeQuery();
			
			while(rs.next()){
				prodList.add(new Product(rs.getInt("product_id"), 
					rs.getInt("user_id"), 
					rs.getString("title"),
					rs.getInt("price"),
					rs.getString("description"),
					rs.getString("dimensions"),
					rs.getString("category"),
					rs.getString("picture")));
			}

			rs.close();
			stmt1.close();
			
			return prodList;
		} catch (Exception e) {			
			throw new Exception("An error occured while searching for student in the database: " + e.getMessage());
		}		
	}
	
	public double getAvgScore(int product_id) throws Exception {

        try {

            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            
            float avgscore=0;
            
            String sqlquery="SELECT product.*, avg(rating.grade) FROM product INNER JOIN rating " 
                     + "ON product.product_id=rating.product_id  WHERE product.product_id=?";

             
            PreparedStatement stmt1 = con.prepareStatement(sqlquery);
            stmt1.setInt(1, product_id);
            ResultSet rs = stmt1.executeQuery();
            
            while(rs.next()) {
                                
            avgscore = rs.getFloat("avg(rating.grade)");
                
            }

            rs.close();
            stmt1.close();
            
            return Math.round(avgscore);

        } catch (Exception e) {
            
            throw new Exception("An error occured while getting avg score from database: " + e.getMessage());
        }
        
    }//End of getAvgScore
	
	public List<Product> getSellerProducts(int user_id) throws Exception {
        System.out.println("mphke sth methodo");
        try {

            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            
            String sqlquery= "SELECT * FROM product WHERE user_id= ?;";

            PreparedStatement stmt1 = con.prepareStatement(sqlquery);
            stmt1.setInt(1, user_id );
            ResultSet rs = stmt1.executeQuery();
            
            List<Product> productSellist = new ArrayList<Product>();
                        
            while(rs.next()) { 
                productSellist.add( new Product(rs.getInt("product_id"),rs.getInt("user_id"),rs.getString("title"), rs.getInt("price"),rs.getString("description"),rs.getString("dimensions"),

                        rs.getString("category"),rs.getString("picture") )) ;
                
            }

            rs.close();
            stmt1.close();
            System.out.println(productSellist.toString());
            
            return productSellist;

        } catch (Exception e) {
            
            throw new Exception("An error occured while getting products from database: " + e.getMessage());
        }
        
    }//End of getProducts
	
	public void updateProduct(Product prod) throws Exception {

        try { System.out.println("mphke sto servlet");
        

            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            //UPDATE Customers SET ContactName='Alfred Schmidt', City='Hamburg' WHERE CustomerName='Alfreds Futterkiste';
            
            String sql= "UPDATE product SET title=?, "
                    + "price=?, description=?, dimensions=?, category=?"
                    + " WHERE product_id=?;";
            
            PreparedStatement stmt = con.prepareStatement(sql);
            System.out.println("ekane to preparest");
            
            stmt.setString( 1, prod.getTitle() );
            stmt.setInt( 2, prod.getPrice() );
            stmt.setString( 3, prod.getDescription() );
            stmt.setString( 4, prod.getDimensions() );
            stmt.setString( 5, prod.getCategory() );
            stmt.setInt(6, prod.getProduct_id() );
            System.out.println(stmt.toString());
            stmt.executeUpdate();    
            
            stmt.close();    
            

        } catch (SQLException e) {
            
            throw new Exception("SQL Exception... Bad Luck!");
            
        } catch (Exception e) {
            
            throw new Exception("An error occured while inserting student to database: " + e.getMessage());
        }
        
    }//End of updateProduct
	
	public void uploadProduct(Product prod) throws Exception {

        try { System.out.println("mphke sto servlet");
        

            if(con == null) {
                throw new Exception("You must open a connection first");
            }
            
            String sql= "INSERT into product (user_id,title, price, description, dimensions, category,picture)"
                    + " VALUES (?,?,?,?,?,?,?);";
            
            PreparedStatement stmt = con.prepareStatement(sql);
            System.out.println("ekane to preparest");
            
            
          
            stmt.setInt( 1, prod.getUser_id());
            stmt.setString( 2, prod.getTitle() );
            stmt.setInt( 3, prod.getPrice() );
            stmt.setString( 4, prod.getDescription() );
            stmt.setString( 5, prod.getDimensions() );
            stmt.setString( 6, prod.getCategory() );
            stmt.setString( 7, prod.getPicture() );
            System.out.println(stmt.toString());
            stmt.executeUpdate();    
            
//            String sqlq= "SELECT product_id FROM product ORDER BY product_id DESC LIMIT 1;";
//		      
//		      PreparedStatement stmt1 = con.prepareStatement(sqlq);
//		      ResultSet rs1 = stmt1.executeQuery(sqlq);
//		      rs1.next();
//		      int product_id = rs1.getInt("product_id");
//		      rs1.close(); 
//		      stmt.close();    
//            return product_id;

        } catch (SQLException e) {
            
            throw new Exception("SQL Exception... Bad Luck!");
            
        } catch (Exception e) {
            
            throw new Exception("An error occured while inserting new product in the database: " + e.getMessage());
        }
        
    }//End of uploadProduct
    
}