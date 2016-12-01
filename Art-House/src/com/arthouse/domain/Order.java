package com.arthouse.domain;

import java.util.Date;
import java.util.List;

public class Order {
	private int order_id;
	private double amount;
	private int quantity;
	private Date date;
	private int buyer_id;
	List<Product> prodlist;
	
	Order(){
		
	}
	public Order(int order_id,double amount,int quantity,Date date,int buyer_id){
		this.order_id=order_id;
		this.amount=amount;
		this.quantity=quantity;
		this.date=date;
		this.buyer_id=buyer_id;
		
	}
	
	public Order(double amount,int quantity,Date date,int buyer_id){
		this.amount=amount;
		this.quantity=quantity;
		this.date=date;
		this.buyer_id=buyer_id;
		
	}
	
	public Order(double amount,int quantity,Date date,int buyer_id, List<Product> prodlist){
		this.amount=amount;
		this.quantity=quantity;
		this.date=date;
		this.buyer_id=buyer_id;
		
	}
	
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	
	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	public int getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(int buyer_id) {
		this.buyer_id = buyer_id;
	}

}
