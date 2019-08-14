package com.bbshop.bit.service;

import java.util.List;

import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.PagingVO;

public interface OnetoOneService {
	public void OnetoOne_register(OnetooneVO board);
	
	public OnetooneVO OnetoOne_get(Long bno);
	
	public boolean OnetoOne_modify(OnetooneVO board);
	
	public boolean OnetoOne_remove(Long bno);	
	
	public List<OnetooneVO> OnetoOne_getList(PagingVO pag);
	
	public int getTotal(PagingVO pag);
}
