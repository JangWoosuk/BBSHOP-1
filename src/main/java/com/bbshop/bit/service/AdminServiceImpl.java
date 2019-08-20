package com.bbshop.bit.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.bbshop.bit.mapper.AdminMapper;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<GoodsVO> getGoodsList() {
		System.out.println("상품 목록을 받아오겠습니다.");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<GoodsVO> goodsList = mapper.getGoodsList();
		System.out.println(goodsList);
		
		return goodsList;
	}
	
	
	//대표상품의 옵션들을 가져오는 메소드.
	@Override
	public List<Object> getGdList(int category, long goods_num) {
		// TODO Auto-generated method stub
		//System.out.println("상품 옵션 목록을 받아오겠습니다.");
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<Object> goodsList = new ArrayList<Object>();
		//카테고리의 숫자에 따라 mapper에서 사용되는 메소드가 다르다.
		switch(category) {
		//글러브
		case 1: {
			goodsList = mapper.getGloveList(goods_num);	
		//	System.out.println(goodsList);
			break;
		}//방망이
		case 2: {
			goodsList = mapper.getBatList(goods_num);	
	//		System.out.println(goodsList);
			break;
		}//유니폼
		case 3: {
			goodsList = mapper.getUniformList(goods_num);	
			//System.out.println(goodsList);
			break;
		}//야구화
		case 4: {
			goodsList = mapper.getShoesList(goods_num);	
		//	System.out.println(goodsList);
			break;
		}//야구공
		case 5: {
			goodsList = mapper.getBallList(goods_num);	
	//		System.out.println(goodsList);
			break;
		}
		}
		
		
		return goodsList;
	}


	@Override
	public void insertGoods(GoodsVO vo, Object obj) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		mapper.insertGoods(vo);
		//System.out.println("데이터 삽입이 제대로 이뤄졌다.");
		System.out.println("vo의 굿즈넘"+mapper.getGoodsNum(vo));
		vo.setGoods_num((long)mapper.getGoodsNum(vo));
//		System.out.println(obj.getClass().getName());
//		String goodsObj = obj.getClass().getName().substring(22);
//		System.out.println(goodsObj);
		
		switch(vo.getCategory()) {
			
			case 1:{
				System.out.println("glove입니다.");
				Gd_GloveVO glove = (Gd_GloveVO)obj;
				glove.setGOODS_NUM(vo.getGoods_num());
				System.out.println("glove GoodsNUM"+glove.getGOODS_NUM());
				mapper.insertGoodsGlove(glove);
				break;
			}
			
			case 2:{
				System.out.println("bat입니다");
				Gd_BatVO bat = (Gd_BatVO)obj;
				bat.setGOODS_NUM(vo.getGoods_num());
				mapper.insertGoodsBat(bat);
				break;
			}
			case 3:{
				System.out.println("uniform입니다");
				Gd_UniformVO uniform = (Gd_UniformVO)obj;
				uniform.setGOODS_NUM(vo.getGoods_num());
				mapper.insertGoodsUniform(uniform);
				break;
			}
			case 4:{
				System.out.println("shoes입니다");
				Gd_ShoesVO shoes = (Gd_ShoesVO)obj;
				shoes.setGOODS_NUM(vo.getGoods_num());
				mapper.insertGoodsShoes(shoes);
				break;
			}
			case 5:{
				System.out.println("ball입니다");
				Gd_BallVO ball = (Gd_BallVO)obj;
				ball.setGOODS_NUM(vo.getGoods_num());
				mapper.insertGoodsBall(ball);
				break;
			}
			
		
		
		
		}
		
	}


	@Override
	public void deleteGoods(Map<String, Object> deleteMap) {
		// TODO Auto-generated method stub
		System.out.println("상품삭제합니다");
		
		System.out.println(deleteMap);
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		try {
		mapper.deleteGoods(deleteMap);
		System.out.println("상품삭제성공");
		
		}
		catch(Exception e) {
			System.out.println("delete실패..");
			e.printStackTrace();
		}
		
	}


	@Override
	public List<FAQVO> getFAQList() {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		
		
		return mapper.getFAQList();
	}


	@Override
	public void write_FAQ(FAQVO faq) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		try {
		mapper.write_FAQ(faq);
		System.out.println("등록 성공!");
		}
		catch(Exception e) {
			System.out.println("등록 실패");
		}
	}


	@Override
	public void deleteFAQ(Map<String, Object> deleteMap) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		try {
		mapper.deleteFAQ(deleteMap);
		System.out.println("삭제성공");
		}
		catch(Exception e) {
			System.out.println("삭제 실패");
		}
		
	}


	@Override
	public FAQVO getFAQ(int faq_num) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		FAQVO faq = new FAQVO();
		try {
			faq=mapper.getFAQ(faq_num);
			System.out.println("찾기성공");
		}
		catch(Exception e) {
			System.out.println("찾기실패");
		}
		return faq;
	}


	@Override
	public void ModifyFAQ(FAQVO faq) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		try {
			mapper.ModifyFAQ(faq);
			System.out.println("수정성공");
		}
		catch(Exception e) {
			System.out.println("수정 실패");
		}
		
	}


	@Override
	public List<OnetooneVO> getOnetoone() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<OnetooneVO> list = new ArrayList<OnetooneVO>();
		try {
			list= mapper.getOnetoone();
			System.out.println("List 불러오기 성공");
		}
		catch(Exception e) {
			System.out.println("List 불러오기 실패");
		}
		
		
		return list;
	}


	@Override
	public List<OnetooneVO> searchOtoCategory(Map<String,Object> map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<OnetooneVO> list = new ArrayList<OnetooneVO>();
		System.out.println(map);
		try {
			list= mapper.searchOtoCategory(map);
			System.out.println(list);
			System.out.println("List 불러오기 성공");
		}
		catch(Exception e) {
			System.out.println(list);
			System.out.println("List 불러오기 실패");
		}
		return list;
	}


	@Override
	public List<OnetooneVO> searchOtoAnswer(String answer) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<OnetooneVO> list = new ArrayList<OnetooneVO>();
		
		System.out.println("impl에서 answer값 ="+answer);
		
		try {

			list =mapper.searchOtoAnswer(answer);
			
			System.out.println("답변여부 찾기 성공"+list);
		}
		catch(Exception e) {
			System.out.println(list);
			System.out.println("답변 여부 찾기 실패");
		}
		return list;
	}


	@Override
	public List<ReportBoardVO> getReportBoard() {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<ReportBoardVO> ReportBoardList =mapper.getReportBoard();
		return ReportBoardList;
	}


	@Override
	public List<CommunityVO> getBoard(List<ReportBoardVO> reportList) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<CommunityVO> boardList = new ArrayList<CommunityVO>();
		try {
			List<Integer> reportNum = new ArrayList<Integer>();
			for(int i = 0 ; i < reportList.size();i++) {
		reportNum.add(i, (int) reportList.get(i).getBOARD_NUM());
			}
			System.out.println(reportNum);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("reportNum", reportNum);
		boardList = mapper.getBoard(map);
		System.out.println("게시글 가져오기 성공");
		System.out.println(boardList);
		}
		catch(Exception e) {
			System.out.println("게시글 가져오기 실패");
		}
		return boardList;
	}


	@Override
	public List<CommunityVO> getBoardAll() {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<CommunityVO> boardList = new ArrayList<CommunityVO>();
		
		try {
			boardList=mapper.getBoardAll();
			System.out.println("게시글 전체 불러오기 성공!!");
		}
		catch(Exception e) {
			System.out.println("게시글 전체 불러오기 실패");
		}
		return boardList;
	}


	@Override
	public void deleteBoard(Map<String, Object> deleteMap) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		mapper.deleteBoard(deleteMap);
	}


	@Override
	public List<CommunityVO> searchBoardCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<CommunityVO> resultList = mapper.searchBoardCategory(map);
		System.out.println("카테고리에서 찾은것"+resultList);
		return resultList;
	}


	@Override
	public List<ReportBoardVO> searchReportCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		sqlSession.getMapper(AdminMapper.class);
		List<ReportBoardVO> resultList = mapper.searchReportCategory(map);
		System.out.println("카테고리에서 찾은것"+resultList);
		return resultList;
		
	}
}
