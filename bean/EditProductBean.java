package com.mvc.bean;

import java.sql.Blob;

public class EditProductBean {
	
	String productId;
	String productName;
	String stock;
	String productPrice;
	Blob productImage;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getPrice() {
		return productPrice;
	}
	public void setPrice(String price) {
		this.productPrice = price;
	}
	public Blob getProductimage() {
		return productImage;
	}
	public void setProductimage(Blob productimage) {
		this.productImage = productimage;
	}

}
