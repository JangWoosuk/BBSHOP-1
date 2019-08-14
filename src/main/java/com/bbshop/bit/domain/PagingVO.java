package com.bbshop.bit.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PagingVO {
	
	private long pageNum;
	private long amount;
	private String type;
	private String keyword;
	
	public PagingVO() {
		this(1, 10);
	}
	
	public PagingVO(long pageNum, long amount) {
		
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[]  getTypeArr() {
		      
		return type == null ? new String[] {} : type.split("");
	}

	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
				
		return builder.toUriString();
	}
}
