package com.bbshop.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bbshop.bit.domain.CommunityVO;
import com.bbshop.bit.domain.FAQVO;
import com.bbshop.bit.domain.Gd_BallVO;
import com.bbshop.bit.domain.Gd_BatVO;
import com.bbshop.bit.domain.Gd_GloveVO;
import com.bbshop.bit.domain.Gd_ShoesVO;
import com.bbshop.bit.domain.Gd_UniformVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.ReportBoardVO;

public interface AdminMapper {

	public List<GoodsVO> getGoodsList();
	public List<Object> getGloveList(long goods_num);
	public List<Object> getBatList(long goods_num);
	public List<Object> getUniformList(long goods_num);
	public List<Object> getShoesList(long goods_num);
	public List<Object> getBallList(long goods_num);
	public void insertGoods(GoodsVO vo);
	public void insertGoodsGlove(Gd_GloveVO glove);
	public void insertGoodsBat(Gd_BatVO bat);
	public void insertGoodsBall(Gd_BallVO ball);
	public void insertGoodsShoes(Gd_ShoesVO shoes);
	public void insertGoodsUniform(Gd_UniformVO uniform);
	public int getGoodsNum(GoodsVO vo);
	public void deleteGoods(Map<String, Object> deleteMap);
	public List<FAQVO> getFAQList();
	public void write_FAQ(FAQVO faq);
	public void deleteFAQ(Map<String, Object> deleteMap);
	public FAQVO getFAQ(int faq_num);
	public void ModifyFAQ(FAQVO faq);
	public List<OnetooneVO> getOnetoone();
	public List<OnetooneVO> searchOtoCategory(Map<String,Object> map);
	public List<OnetooneVO> searchOtoAnswer(String answer);
	public List<ReportBoardVO> getReportBoard();
	public List<CommunityVO> getBoard(Map<String, Object> map);
	public List<CommunityVO> getBoardAll();
	public void deleteBoard(Map<String, Object> deleteMap);
}
