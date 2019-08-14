package com.bbshop.bit.mapper;

import java.util.List;

import com.bbshop.bit.domain.FAQVO;
import com.bbshop.bit.domain.PagingVO;

public interface FAQMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<FAQVO> FAQ_getList();
	
	public List<FAQVO> getListWithPaging(PagingVO pag); 
	
	public FAQVO FAQ_read(long FAQ_NUM);
	
	public String getNickName(long USER_KEY);
	
	public int getTotalCount(PagingVO pag);

	public List<FAQVO> question(PagingVO pag); 
	
	public List<FAQVO> order(PagingVO pag); 
	
	public List<FAQVO> trade(PagingVO pag); 
	
	public List<FAQVO> cancel(PagingVO pag); 
	
	public int getCancelCount(PagingVO pag);
	
	public int getTradeCount(PagingVO pag);

	public int getOrderCount(PagingVO pag);
	
	public int getQuestionCount(PagingVO pag);
}
