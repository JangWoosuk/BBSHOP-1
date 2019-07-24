package com.bbshop.bit.domain;

import java.util.Date;

public class GoodsVO {
	
	private Long goods_num;		// ��ǰ ��ȣ
	private int category;		// ī�װ� (1:�۷���, 2:��Ʈ, 3:������, 4:�߱�ȭ, 5:�߱���)
	private String name;		// ��ǰ��
	private Long stock;			// ��� �� (���� - default:100)
	private Long price;			// ����
	private String brand;		// �귣�� (10��)
	private String main_img;	// ���� ����(goodsList)
	private String dtl_img1;	// �� ����1(goodsInfo - ��ǥ)
	private String dtl_img2;	// �� ����2(goodsInfo - �󼼼��� ���� ���)
	private int best;			// �α��ǰ (0:�Ϲ�, 1:�α��ǰ)
	private Long discount;		// ������
	private int soldout;		// ǰ������ (0:ǰ���ƴ�, 1:ǰ��)
	private Long sales;			// �Ǹ� ����
	private Date regdate;		// �����
	
	
	public Long getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(Long goods_num) {
		this.goods_num = goods_num;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getDtl_img1() {
		return dtl_img1;
	}
	public void setDtl_img1(String dtl_img1) {
		this.dtl_img1 = dtl_img1;
	}
	public String getDtl_img2() {
		return dtl_img2;
	}
	public void setDtl_img2(String dtl_img2) {
		this.dtl_img2 = dtl_img2;
	}
	public int getBest() {
		return best;
	}
	public void setBest(int best) {
		this.best = best;
	}
	public Long getDiscount() {
		return discount;
	}
	public void setDiscount(Long discount) {
		this.discount = discount;
	}
	public int getSoldout() {
		return soldout;
	}
	public void setSoldout(int soldout) {
		this.soldout = soldout;
	}
	public Long getSales() {
		return sales;
	}
	public void setSales(Long sales) {
		this.sales = sales;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
