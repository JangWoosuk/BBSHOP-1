package com.bbshop.bit.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.PagingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GoodsServiceTests {

	@Setter(onMethod_ = @Autowired)
	private GoodsService service;
	
	
	@Test	// GoodsService ��ü�� ����� ������ �������� Ȯ��
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test
	public void testGetGoodsList() {
		
		PagingVO pagingVO = new PagingVO();
		
		//8���� 2������
		pagingVO.setPageNum(1);
		pagingVO.setAmount(16);
		

		// service.getGoodsList(1, pagingVO, "lowPrice", "1000", "500000").forEach(goods -> log.info(goods));
	}
	
//	@Test
	public void testGetGoodsInfo() {
		log.info(service.getGoodsInfo(8l));
	}
	
//	@Test
	public void testInsertGoodsQna() {
		GoodsQnaVO qna = new GoodsQnaVO();
		qna.setTitle("�̺����ڱ�ġ�");
		qna.setContent("��ǰ ���� ������ ���� ���� ���� ������ ���� ���� ���ǹ�����! ����! ���ǹȾƤ̹̤��踶 ����");
		qna.setAttached_file("");
		qna.setGoods_num(3);
		
		service.insertGoodsQna(qna);
		
		log.info("������ ��ǰQNA �� ��ȣ : " + qna.getQna_num());
	}
	
//	@Test
	public void testGetQnaList() {
		PagingVO pagingVO = new PagingVO();
		
		//8���� 2������
		pagingVO.setPageNum(1);
		pagingVO.setAmount(6);

		service.getQnaList(pagingVO, 21l);
	}
}