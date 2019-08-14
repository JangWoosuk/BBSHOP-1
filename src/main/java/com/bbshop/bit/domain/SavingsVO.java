package com.bbshop.bit.domain;

public class SavingsVO {

	private String or_date;
	private String or_items;
	private long or_savings;
	private long or_num;
	private long or_savings_total; // 적립금 총합 필드 추가. DB에는 존재하지 않는 컬럼.

	public String getOr_date() {
		return or_date;
	}
	public void setOr_date(String or_date) {
		this.or_date = or_date;
	}
	public String getOr_items() {
		return or_items;
	}
	public void setOr_items(String or_items) {
		this.or_items = or_items;
	}
	public long getOr_savings() {
		return or_savings;
	}
	public void setOr_savings(long or_savings) {
		this.or_savings = or_savings;
	}
	public long getOr_num() {
		return or_num;
	}
	public void setOr_num(long or_num) {
		this.or_num = or_num;
	}
	public long getOr_savings_total() {
		return or_savings_total;
	}
	public void setOr_savings_total(long or_savings_total) {
		this.or_savings_total = or_savings_total;
	}
	
	@Override
	public String toString() {
		return "SavingsVO [or_date=" + or_date + ", or_items=" + or_items + ", or_savings=" + or_savings + ", or_num="
				+ or_num + ", or_savings_total=" + or_savings_total + "]";
	}
	
}
