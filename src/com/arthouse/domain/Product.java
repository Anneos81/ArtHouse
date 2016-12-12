package com.arthouse.domain;

import java.util.List;

public class Product {

    private int product_id;//PK of product
    private int user_id; //FK seller
    private String title;
    private int price;
    private String description;
    private String dimensions;
    private String category;
    private String picture;
    List<Rating> ratelist;
    double rating;
   
	public Product(int product_id,String title, int price, String description, String dimensions,
            String category, String picture, List<Rating> ratelist) {
      //  super(); 
        this.product_id= product_id;
		this.title = title;
        this.price = price;
        this.description = description;
        this.dimensions = dimensions;
        this.category = category;
        this.picture = picture;
        this.ratelist=ratelist;
    }
    
//	public Product(String title, int price, String description, String dimensions,
//            String category, String picture, List<Rating> ratelist) {
//      //  super(); 
//        this.title = title;
//        this.price = price;
//        this.description = description;
//        this.dimensions = dimensions;
//        this.category = category;
//        this.picture = picture;
//        this.ratelist=ratelist;
//    }
    public Product(int user_id, String title, int price, String description, String dimensions,
            String category, String picture) {
      //  super();
        this.user_id=user_id;
        this.title = title;
        this.price = price;
        this.description = description;
        this.dimensions = dimensions;
        this.category = category;
        this.picture = picture;
    }
    
    public Product(int id, int userID, String title, int price, String description, String dimensions,
            String category, String picture) {
        this.user_id = userID;
        this.product_id = id;
        this.title = title;
        this.price = price;
        this.description = description;
        this.dimensions = dimensions;
        this.category = category;
        this.picture = picture;
    }
    public Product(int id, int userID, String title, int price, String description, String dimensions,
            String category) {
        this.user_id = userID;
        this.product_id = id;
        this.title = title;
        this.price = price;
        this.description = description;
        this.dimensions = dimensions;
        this.category = category;
    }
    public Product(int id, 
            int userID, 
            String title, 
            int price, 
            String description, 
            String dimensions,
            String category, 
            String picture, 
            double rating) {
        this(id, userID, title, price, description, dimensions, category, picture);
        this.rating = rating;
    }

    
    public int getProduct_id() {
        return product_id;
    }
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
    public int getUser_id() {
        return user_id;
    }
    
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getDimensions() {
        return dimensions;
    }
    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getPicture() {
        return picture;
    }
    public void setPicture(String picture) {
        this.picture = picture;
    }
    public List<Rating> getRatelist() {
		return ratelist;
	}

	public void setRatelist(List<Rating> ratelist) {
		this.ratelist = ratelist;
	}
    public double getRating() {
		return Math.round(rating*100.0/100.0);
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	
}