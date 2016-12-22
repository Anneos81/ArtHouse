package com.arthouse.dao;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import com.arthouse.domain.Product;

import com.arthouse.domain.Rating;

public class RatingDAO {

    private Connection con = null;

    public RatingDAO() {};

    public void open() throws SQLException {

        try {

            // dynamically load the driver's class file into memory

            Class.forName("com.mysql.jdbc.Driver").newInstance();

        } catch (Exception e) {

            throw new SQLException("MySQL Driver error: " + e.getMessage());
        }

        try {

            // establish a connection with the database and creates a Connection
            // object (con)

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



	public int getRating(int user_id, int product_id) throws Exception {

        try {    

            if(con == null) {

                throw new Exception("You must open a connection first");

            }
            int grade = 0;
            
            String sqlquery="select grade from rating where user_id=? and product_id=?";

             
            PreparedStatement stmt1 = con.prepareStatement(sqlquery);
            stmt1.setInt(1, user_id);
            stmt1.setInt(2, product_id);
            
            ResultSet rs = stmt1.executeQuery();
            
            while(rs.next()) {
                                
            grade = rs.getInt("grade");
                
            }

            rs.close();
            stmt1.close();
            
            return grade;
            

        } catch (SQLException e) {

            throw new Exception("SQL Exception... Bad Luck!"); 

        } catch (Exception e) {

            throw new Exception("An error occured while inserting new product in the database: " + e.getMessage());
        }        

    }//End of getRating

	

	public void addRating(Rating rating) throws Exception {

        try {    

            if(con == null) {

                throw new Exception("You must open a connection first");

            }

            

            String sql= "INSERT into rating (user_id, product_id, grade) VALUES (?,?,?) on DUPLICATE key update grade = ?;";

            

            PreparedStatement stmt = con.prepareStatement(sql);



            stmt.setInt(1, rating.getBuyer_id());

            stmt.setInt(2, rating.getProduct_id());

            stmt.setInt(3, rating.getRate());

            stmt.setInt(4, rating.getRate());

            stmt.executeUpdate();    

            

            stmt.close();

        } catch (SQLException e) {

            

            throw new Exception("SQL Exception... Bad Luck!");

            

        } catch (Exception e) {

            

            throw new Exception("An error occured while inserting new product in the database: " + e.getMessage());

        }

        

    }//End of uploadProduct

}