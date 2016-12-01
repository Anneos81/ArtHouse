package com.arthouse.domain;

public class Rating {
	int buyer_id;
	int product_id;
	int grade;
	
	Rating (){
		
	}
	public Rating(int buyer_id, int product_id, int rate ) {		
		this.buyer_id = buyer_id;
		this.product_id = product_id;
		this.grade = rate;
	}
	
	public int getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(int buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getRate() {
		return grade;
	}
	public void setRate(int grade) {
		this.grade = grade;
	}

}
