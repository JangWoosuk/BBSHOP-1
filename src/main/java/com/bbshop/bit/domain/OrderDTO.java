package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class OrderDTO {
	
	private String name;
	private int price;
	private int qntty;
	private int totalPrice;
	private int allPrice;

}
