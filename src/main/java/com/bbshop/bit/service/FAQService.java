package com.bbshop.bit.service;

import java.util.List;

import com.bbshop.bit.domain.FAQVO;
import com.bbshop.bit.domain.PageDTO;
import com.bbshop.bit.domain.PagingVO;

public interface FAQService {
	
	public FAQVO FAQ_get(long bno);
	
	public List<FAQVO> FAQ_getList(PagingVO pag);
	
	public int getTotal(PagingVO pag);
	
	public List<FAQVO> question(PagingVO pag);
	
	public List<FAQVO> order(PagingVO pag);
	
	public List<FAQVO> trade(PagingVO pag);
	
	public List<FAQVO> cancel(PagingVO pag);
	
	public int getCancelCount(PagingVO pag);
	
	public int getTradeCount(PagingVO pag);
	
	public int getOrderCount(PagingVO pag);
	
	public int getQuestionCount(PagingVO pag);
}
