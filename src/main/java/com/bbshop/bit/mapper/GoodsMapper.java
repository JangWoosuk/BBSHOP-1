package com.bbshop.bit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.domain.ReviewVO;

public interface GoodsMapper {
	
	// 페이징 - 상품 목록, sorting값에 따라 동적쿼리
	// hashmap[pagingVO(pageNum,amount), category, sorting]
	public List<GoodsVO> getGoodsList(HashMap<String, Object> map);
	
	// 카테고리 별, goods 상품 개수
	public int getTotalCount(int category);
	
	// 상품 조회
	public GoodsVO getGoodsInfo(long goods_num);
	
	
	
	

	/* QNA 관련 */
	// 상품 QNA 등록 - insert문이 실행되고 생성된  pk(시퀀스) 값을 알아야 하는 경우
	public void insertGoodsQnaSelectKey(GoodsQnaVO qna);
	
	// 상품 QNA 목록 (goods_num이 카테고리)
	// hashmap[pagingVO(pageNum, amount), goods_num]
	public List<GoodsQnaVO> getQnaList(HashMap<String, Object> map);
	
	// 상품 별, QNA 글 개수
	public int getQnaCount(long goods_num);
	
	
	
	
	
	/* REVIEW 관련 */
	// 상품 REVIEW 등록 
	public void insertReview(ReviewVO review);
		
	// 상품 REVIEW 목록 출력 (goods_num이 상품 카테고리)
	// hashmap[pagingVO(pageNum, amount), goods_num]
	public List<ReviewVO> getReviewList(HashMap<String, Object> map);
	
	// 상품 별, REVIEW 글 개수
	public int getReviewCount(long goods_num);
	
	// 상품 별, REVIEW 점수 평균
	public double getReviewAvg(long goods_num);
	
	// 상품 별, 별점 별 REVIEW 글 개수
	public int getScoreCount(@Param("goods_num") long goods_num, @Param("score") long score);
	
	
	
	
	
	// user_key로 nickname 가져오기
	public String getNickName(long user_key);
	
	
	
	
	

	// user_key를 이용해 moredetail을 가져온다.
	public MoreDetailsVO findDetail(long user_key);
	
	// 추천 상품 - 회원
	public List<GoodsVO> recommendGoodsList(MoreDetailsVO moredetail);
	
	// 추천 상품 - 비회원
	public List<GoodsVO> recommendBestList();

	/* ajax�� ������ �ҷ��� �� ��ü ���� ���ϱ� */	
	public int getTotalCountAjax(HashMap<String, Object> map);

	// 장바구니 목록에 상품을 넣는 메소드
	public void addGoodsToCart(@Param("goods") GoodsVO goods, @Param("qty") int qty, @Param("user_key") long user_key
			, @Param("goods_detail_num") long goods_detail_num);
}
