package com.bbshop.bit.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbshop.bit.domain.PagingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class MapperTest {

	@Setter(onMethod_ = @Autowired)
	private FAQMapper mapper;
	
//	@Test
//	public void testGetList() {
//		PagingVO p = new PagingVO(); 
//		p.setPageNum(1);
//		p.setType(null);
//		p.setAmount(10); 
//		mapper.getListWithPaging(p, "변경/취소").forEach(board -> log.info(board));
//	}
	
}
