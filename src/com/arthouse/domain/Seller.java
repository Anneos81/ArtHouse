package com.arthouse.domain;

public class Seller extends User {
	private String photo_seller;
	
	public Seller(){}
	
	public Seller(int user_id, String username, String password, String name, String surname, String email) {
		super(user_id, username, password, name, surname, email);
		// TODO Auto-generated constructor stub
	}
	public Seller(int user_id, String username, String password, String name, String surname, String email,String photo) {
		super(user_id, username, password, name, surname, email);
		this.photo_seller=photo;
	}
	public Seller(String username, String password, String name, String surname, String email,String photo) {
		super(username, password, name, surname, email);
		this.photo_seller=photo;
	}

	public Seller(String name, String surname,String photo){
		super(name,surname);
		this.photo_seller=photo;
		
	}
	public String getPhoto_seller() {
		
		return photo_seller;
	}

	@Override
	public String toString() {
		return "Seller [photo_seller=" + photo_seller + "]";
	}

	public void setPhoto_seller(String photo_seller) {
		this.photo_seller = photo_seller;
	}
}