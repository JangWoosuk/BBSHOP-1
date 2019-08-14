package com.bbshop.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbshop.bit.domain.FAQVO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.mapper.FAQMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service("faqservice")
@AllArgsConstructor
public class FAQServiceImpl implements FAQService{
	
	@Autowired
	private FAQMapper FAQMapper;

	@Override
	public FAQVO FAQ_get(long FAQ_NUM) {
		log.info("get.........." + FAQ_NUM);
		// TODO Auto-generated method stub
		return FAQMapper.FAQ_read(FAQ_NUM);
	}

	@Override
	public List<FAQVO> FAQ_getList(PagingVO pag) {
		// TODO Auto-generated method stub
		log.info("get List with Paging: " + pag);
		return FAQMapper.getListWithPaging(pag);
	}
	
	@Override
	public int getTotal(PagingVO pag) {
		
		log.info("get total count");
		return FAQMapper.getTotalCount(pag);
	}

	@Override
	public List<FAQVO> question(PagingVO pag) {
		// TODO Auto-generated method stub
		return FAQMapper.question(pag);
	}

	@Override
	public List<FAQVO> order(PagingVO pag) {
		// TODO Auto-generated method stub
		return FAQMapper.order(pag);
	}

	@Override
	public List<FAQVO> trade(PagingVO pag) {
		// TODO Auto-generated method stub
		return FAQMapper.trade(pag);
	}

	@Override
	public List<FAQVO> cancel(PagingVO pag) {
		// TODO Auto-generated method stub
		return FAQMapper.cancel(pag);
	}

	@Override
	public int getCancelCount(PagingVO pag) {
		// TODO Auto-generated method stub
		log.info("get Cancel count");
		return FAQMapper.getCancelCount(pag);
	}

	@Override
	public int getTradeCount(PagingVO pag) {
		// TODO Auto-generated method stub
		log.info("get Trade count");
		return FAQMapper.getTradeCount(pag);
	}

	@Override
	public int getOrderCount(PagingVO pag) {
		// TODO Auto-generated method stub
		log.info("get Order count");
		return FAQMapper.getOrderCount(pag);
	}

	@Override
	public int getQuestionCount(PagingVO pag) {
		// TODO Auto-generated method stub
		log.info("get Question count");
		return FAQMapper.getQuestionCount(pag);
	}


}
