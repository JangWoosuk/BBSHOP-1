package com.bbshop.bit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.ReviewDTO;
import com.bbshop.bit.domain.ReviewVO;
import com.bbshop.bit.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	
	private GoodsMapper mapper;
	

	// 카테고리 int > String
	@Override
	public String category(int category) {
		switch(category) {
			case 1: return "글러브";
			case 2: return "배트";
			case 3: return "유니폼";
			case 4: return "야구화";
			default: return "야구공";
		}
	}
	
	/* 페이징 O */
	@Override
	public List<GoodsVO> getGoodsList(int category, PagingVO pagingVO, String sorting, String min_amount, String max_amount, 
			List<String> positions, List<String> colors, List<String> brands) {
		
		log.info("getGoodsList...Ajax..With Paging................");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", category);
		map.put("pagingVO", pagingVO);
		map.put("sorting", sorting);
		
		if ((min_amount != null && !("".equals(min_amount))) && (max_amount != null && !("".equals(max_amount)))) {
			map.put("min_amount", Integer.parseInt(min_amount));
			map.put("max_amount", Integer.parseInt(max_amount));
		}
		
		// �˻� ����Ʈ �迭�� ���� ��� ������, map�� ��´�.
		if (positions != null) {
		
			map.put("positions", positions);
		}
		
		if (colors != null) {
			
			map.put("colors", colors);
		}
		
		if (brands != null) {
			
			map.put("brands", brands);
		}
		
		return mapper.getGoodsList(map);
	}
	
	/* 카테고리별  goods 데이터 개수 */
	@Override
	public int getTotalCount(int category) {
		log.info("get Total Count - " + category);
		
		return mapper.getTotalCount(category);
	}
	
	/* 상품 조회 */
	@Override
	public GoodsVO getGoodsInfo(Long goods_num) {
		log.info("getGoodsInfo....goods_num : "+goods_num+"............");
		
		return mapper.getGoodsInfo(goods_num);
	}
	
	
	
	
	/* 상품 QNA 등록 */
	@Override
	public void insertGoodsQna(GoodsQnaVO qna) {
		log.info("Service - insertGoodsQna");
		
		mapper.insertGoodsQnaSelectKey(qna);
	}

	/* 상품 QNA 목록 */
	@Override
	public List<GoodsQnaVO> getQnaList(PagingVO pagingVO, long goods_num) {
		log.info("Service - getQnaList");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pagingVO", pagingVO);
		map.put("goods_num", goods_num);
		
		List<GoodsQnaVO> qnaList = mapper.getQnaList(map);
		
		for(int i=0; i<qnaList.size(); i++) {
			qnaList.get(i).setNickname(mapper.getNickName(qnaList.get(i).getUser_key()));
			String regdate = qnaList.get(i).getRegdate().substring(0,10);
			qnaList.get(i).setRegdate(regdate);
		}

		return qnaList;
	}
	
	/* 상품 별, QNA 글 개수 */
	public int getQnaCount(long goods_num) {
		return mapper.getQnaCount(goods_num);
	}
	
	
	
	
	
	/* 상품 REVIEW 등록 */
	@Override
	public void insertReview(ReviewVO review) {
		log.info("Service - insertReview");
		
		mapper.insertReview(review);
	}
	
	/* 상품 REVIEW 목록 */
	@Override
	public List<ReviewVO> getReviewList(PagingVO pagingVO, long goods_num, int score) {
		log.info("Service - getReviewList");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pagingVO", pagingVO);
		map.put("goods_num", goods_num);
		map.put("score", score);

		List<ReviewVO> reviewList = mapper.getReviewList(map);
		
		for(int i=0; i<reviewList.size(); i++) {
			reviewList.get(i).setNickname(mapper.getNickName(reviewList.get(i).getUser_key()));
			String regdate = reviewList.get(i).getRe_date().substring(0,10);
			reviewList.get(i).setRe_date(regdate);
		}

		return reviewList;
	}
	
	/* 상품 별, REVIEW 글 개수 */
	public int getReviewCount(long goods_num) {
		return mapper.getReviewCount(goods_num);
	}

	/* 상품 별, 리뷰개수, 별점 개수, 등.. DTO를 반환 */
	@Override
	public ReviewDTO getReviewDTO(long goods_num) {
		ReviewDTO reviewDTO = new ReviewDTO();
		
		// 리뷰 평균
		reviewDTO.setAvg(mapper.getReviewAvg(goods_num));
		System.out.println("reviewDTO.getAvg() : " + reviewDTO.getAvg());
		
		// 리뷰 개수
		reviewDTO.setTotal(mapper.getReviewCount(goods_num));
		System.out.println("reviewDTO.getTotal() : " + reviewDTO.getTotal());
		
		int[] scoreCount = new int[5];
		
		for(int i=0; i<5; i++) {
			scoreCount[i] = mapper.getScoreCount(goods_num, i+1);
		}
		// 리뷰 - 별점 별, 리뷰 개수
		reviewDTO.setScoreCount(scoreCount);
		
		return reviewDTO;
	}

	
	
	
	
	/* user_key를 이용해 moredetail을 가져온다. */
	@Override
	public MoreDetailsVO findDetail(long user_key) {
		return mapper.findDetail(user_key);
	}
	
	/* 추천상품 - 회원 */
	@Override
	public List<GoodsVO> recommendGoodsList(MoreDetailsVO moredetail) {
		return mapper.recommendGoodsList(moredetail);
	}
	
	/* 추천상품 - 비회원 */
	@Override
	public List<GoodsVO> recommendBestList() {
		return mapper.recommendBestList();
	}
	
	/* ajax�� ������ �ҷ��� �� ��ü ���� ���ϱ� */	
	@Override
	public int getTotalCountAjax(int category, PagingVO pagingVO, String sorting, String min_amount, String max_amount,
			List<String> positions, List<String> colors, List<String> brands) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", category);
		map.put("pagingVO", pagingVO);
		map.put("sorting", sorting);
		
		if ((min_amount != null && !("".equals(min_amount))) && (max_amount != null && !("".equals(max_amount)))) {
			map.put("min_amount", Integer.parseInt(min_amount));
			map.put("max_amount", Integer.parseInt(max_amount));
		}
		
		// �˻� ����Ʈ �迭�� ���� ��� ������, map�� ��´�.
		if (positions != null) {
		
			map.put("positions", positions);
		}
		
		if (colors != null) {
			
			map.put("colors", colors);
		}
		
		if (brands != null) {
			
			map.put("brands", brands);
		}
		
		return mapper.getTotalCountAjax(map);
	}
	

	@Override
	public void addGoodsToCart(GoodsVO goods, int qty, long user_key, long goods_detail_num) {

		mapper.addGoodsToCart(goods, qty, user_key, goods_detail_num); 
	}


	
	
}
