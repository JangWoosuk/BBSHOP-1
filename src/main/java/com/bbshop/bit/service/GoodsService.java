package com.bbshop.bit.service;

import java.util.List;

import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.ReviewDTO;
import com.bbshop.bit.domain.ReviewVO;

public interface GoodsService {
	
	// 카테고리 int > String
	public String category(int category);
	
	/* 페이징 O, 상품 목록 */
	public List<GoodsVO> getGoodsList(int category, PagingVO pagingVO, String sorting, String min_amount, String max_amount, 
			List<String> positions, List<String> colors_list, List<String> brands);

	/* 카테고리별  goods 데이터 개수 */
	public int getTotalCount(int category);
	
	/* ajax�� ������ �ҷ��� �� ��ü ���� ���ϱ� */
	public int getTotalCountAjax(int category, PagingVO pagingVO, String sorting, String min_amount, String max_amount,
			List<String> positions, List<String> colors_list, List<String> brands);
	

	/* 상품 조회 */
	public GoodsVO getGoodsInfo(Long goods_num);
	
	
	
	
	
	/* 상품 QNA 등록 */
	public void insertGoodsQna(GoodsQnaVO qna);
	
	/* 상품 QNA 목록 */
	public List<GoodsQnaVO> getQnaList(PagingVO pagingVO, long goods_num);
	
	/* 상품 별, QNA 글 개수 */
	public int getQnaCount(long goods_num);
	
	
	
	
	
	/* 상품 REVIEW 등록 */
	public void insertReview(ReviewVO review);
	
	/* 상품 REVIEW 목록 */
	public List<ReviewVO> getReviewList(PagingVO pagingVO, long goods_num, int score);
	
	/* 상품 별, REVIEW 글 개수 */
	public int getReviewCount(long goods_num);
	
	/* 상품 별, 리뷰평균점수, 리뷰개수, 별점 별 리뷰 개수 등.. DTO를 반환 */
	public ReviewDTO getReviewDTO(long goods_num);

	
	

	/* user_key를 이용해 moredetail을 가져온다.*/
	public MoreDetailsVO findDetail(long user_key);
	
	/* 추천상품 - 회원 */
	public List<GoodsVO> recommendGoodsList(MoreDetailsVO moredetail); 
	
	/* 추천상품 - 비회원 */
	public List<GoodsVO> recommendBestList();

	// 장바구니 목록에 상품 넣는 메소드
	public void addGoodsToCart(GoodsVO goods, int qty, long user_key, long goods_detail_num);

	
}
