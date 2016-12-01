package com.arthouse.domain;

public class Buyer extends User {
	
	
	public Buyer(){
		super();
	}

	public Buyer(int user_id, String username, String password, String name, String surname, String email,
			int phone_number, String town, String address) {
		super(user_id, username, password, name, surname, email, phone_number, town, address);
		
	}
	
	public Buyer(String username, String password, String name, String surname, String email,
			int phone_number, String town, String address) {
		super(username, password, name, surname, email, phone_number, town, address);
		
	}
	
	
	
}
