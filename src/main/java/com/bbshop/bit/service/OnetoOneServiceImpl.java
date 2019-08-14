package com.bbshop.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.mapper.OnetoOneMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service("onetooneService")
@AllArgsConstructor
public class OnetoOneServiceImpl implements OnetoOneService{
	
	@Autowired
	private OnetoOneMapper mapper;

	@Override //등록
	public void OnetoOne_register(OnetooneVO board) {
		log.info("register......" + board);
		
		mapper.OnetoOne_insertSelectKey(board);
	}

	@Override //글상세
	public OnetooneVO OnetoOne_get(Long ONE_ONE_NUM) {
		log.info("get......." + ONE_ONE_NUM);
		// TODO Auto-generated method stub
		
		return mapper.OnetoOne_read(ONE_ONE_NUM);
	}

	@Override //수정
	public boolean OnetoOne_modify(OnetooneVO board) {
		// TODO Auto-generated method stub
		log.info("modify......" + board);
		return mapper.OnetoOne_update(board) == 1;
	}

	@Override //삭제
	public boolean OnetoOne_remove(Long ONE_ONE_NUM) {
		
		log.info("remove......" + ONE_ONE_NUM);
		// TODO Auto-generated method stub
		return mapper.OnetoOne_delete(ONE_ONE_NUM) == 1;
	}

	@Override //목록보기
	public List<OnetooneVO> OnetoOne_getList(PagingVO pag) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(pag);
	}

	@Override
	public int getTotal(PagingVO pag) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(pag);
	}

	
}
