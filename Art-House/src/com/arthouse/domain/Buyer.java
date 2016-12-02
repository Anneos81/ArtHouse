package com.arthouse.domain;

public class Buyer extends User {
	
	
	public Buyer(){
		super();
	}

	public Buyer(int user_id, String username, String password, String name, String surname, String email) {
		super(user_id, username, password, name, surname, email);
		
	}
	
	public Buyer(String username, String password, String name, String surname, String email) {
		super(username, password, name, surname, email);
		
	}
	
	
	
}
