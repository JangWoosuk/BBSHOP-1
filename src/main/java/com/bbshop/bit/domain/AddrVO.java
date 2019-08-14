package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class AddrVO {

	private long user_key;
	private long zc_key;
	private int num; // 개인별 배송지 목록 번호
	private String roadAddress;
	private String name;
	private String addr;
	private String contact;
}
