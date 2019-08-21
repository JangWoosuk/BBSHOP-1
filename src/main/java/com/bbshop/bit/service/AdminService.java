package com.bbshop.bit.service;

import java.util.List;
import java.util.Map;

import com.bbshop.bit.domain.CommunityVO;
import com.bbshop.bit.domain.FAQVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.ReportBoardVO;

public interface AdminService {

	public List<GoodsVO> getGoodsList();
	public List<Object> getGdList(int category, long goods_NUM);
	public void insertGoods(GoodsVO vo, Object obj);
	public void deleteGoods(Map<String, Object> deleteMap);
	public List<FAQVO> getFAQList();
	public void write_FAQ(FAQVO faq);
	public void deleteFAQ(Map<String, Object> deleteMap);
	public FAQVO getFAQ(int faq_num);
	public void ModifyFAQ(FAQVO faq);
	public List<OnetooneVO> getOnetoone();
	public List<OnetooneVO> searchOtoCategory(Map<String, Object> map);
	public List<OnetooneVO> searchOtoAnswer(String answer);
	public List<ReportBoardVO> getReportBoard();
	public List<CommunityVO> getBoard(List<ReportBoardVO> reportList);
	public List<CommunityVO> getBoardAll();
	public void deleteBoard(Map<String, Object> deleteMap);
	public List<CommunityVO> searchBoardCategory(Map<String, Object> map);
	public List<ReportBoardVO> searchReportCategory(Map<String, Object> map);
	public void sanctionsUser(String user, String board_num);
}
