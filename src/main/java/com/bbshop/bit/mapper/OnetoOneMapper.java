package com.bbshop.bit.mapper;

import java.util.List;

import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.PagingVO;

public interface OnetoOneMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<OnetooneVO> OnetoOne_getList();
	
	public List<OnetooneVO> getListWithPaging(PagingVO pag); 
	
	public void insert(OnetooneVO board);
	
	public Integer OnetoOne_insertSelectKey(OnetooneVO board);
	
	public OnetooneVO OnetoOne_read(Long one_one_num);
	
	public int OnetoOne_delete(Long one_one_num);
	
	public int OnetoOne_update(OnetooneVO board);
	
	public int getTotalCount(PagingVO pag);
}
