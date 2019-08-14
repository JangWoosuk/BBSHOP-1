package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private long total;
	private PagingVO pagingVO;
	
	public PageDTO(PagingVO pagingVO, long total) {
		
		this.pagingVO = pagingVO;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(pagingVO.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / pagingVO.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
}
