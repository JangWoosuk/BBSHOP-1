package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class Cart_GDVO {
	
	public long GOODS_NUM;
	public int PRICE;
	public int QNTTY;
	public long GD_CT_KEY;
	public int SAVINGS;
	public int STOCK;
	public int GD_DETAILS;
	public long USER_KEY;
	public int TOTALPRICE;
}
