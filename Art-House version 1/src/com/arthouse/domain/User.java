package com.arthouse.domain;

public class User {
	
	private int user_id; //PK
	private String username;
	private String password;
	private String name;
	private String surname;
	private String email;
	private int phone_number;
	private String town;
	private String address;
	
	public User(){}
	
	public User(int user_id, String username, String password, String name, String surname, String email,
			int phone_number, String town, String address) {
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.phone_number = phone_number;
		this.town = town;
		this.address = address;

}
	
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", surname=" + surname + ", email=" + email + ", phone_number=" + phone_number + ", town=" + town
				+ ", address=" + address + "]";
	}

	public User(String username, String password, String name, String surname, String email,
			int phone_number, String town, String address) {
		this.username = username;
		this.password = password;
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.phone_number = phone_number;
		this.town = town;
		this.address = address;

}
	public User(String name, String surname){
		this.name=name;
		this.surname=surname;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(int phone_number) {
		this.phone_number = phone_number;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}