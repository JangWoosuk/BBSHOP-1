package com.bbshop.bit.service;

import java.util.List;

import com.bbshop.bit.domain.AddrVO;
import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.MemberVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.OrderVO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.ReviewVO;
import com.bbshop.bit.domain.SavingsVO;

public interface MyPageService {
	
	// 테이블 안의 데이터 개수 구하기
	public long getTotal(PagingVO pagingVO, String table, long user_key);
	

	// 적립금 내역 가지고 오기
	public List<SavingsVO> getSavingsList(PagingVO pagingVO, long total, long key);

	// 주문 내역 가지고 오기
	public List<OrderVO> getOrdersList(PagingVO pagingVO, long total, long key);
	
	// 주문 내역 주문 상태에 따라 가지고 오기
	public List<OrderVO> getOrdersListStss(PagingVO pagingVO, long total, long key, List<String> stts_list);
	
	// 리뷰 내역 가지고 오기
	public List<ReviewVO> getReviewList(PagingVO pagingVO, long total, long key);
	
	// 1:1 문의 내역 가지고 오기
	public List<OnetooneVO> getOnetooneList(PagingVO pagingVO, long total, long key);

	
	// 주문 전체 불러 오기
	public List<OrderVO> getAllOrdersList(long key);
	
	// 주문 취소하기
	public void cancelOrder(long order_num);

	
	// 회원 정보 불러오기
	public MemberVO getUserInfo(long key);

	// 회원 정보 수정
	public void updateUserInfo(MemberVO memberVO);
	
	// 회원 정보 삭제
	public void deleteUserInfo(long key);
	

	// 배송지 조회
	public List<AddrVO> getAddrList(long key);

	// 배송지 수정
	public void updateAddrInfo(AddrVO addrVO);

	// 배송지 등록
	public void insertAddrInfo(AddrVO addrVO);

	// 배송지 삭제
	public void deleteAddrInfo(long key, int num);
	

	// 회원 추가 정보 들고오기
	public MoreDetailsVO getDetail(long key);

	// 회원 추가 정보 수정하기
	public void updateDetailInfo(MoreDetailsVO moreDetailsVO, long key);

	// 닉네임 중복 확인
	public int nickCheck(String nickname);
	

	// 전체 적립금 내역 가져 오기
	public List<Long> getAllSavings(long key);

	// Qna 내역 가져 오기
	public List<GoodsQnaVO> getQnaList(PagingVO pagingVO, long total, long key);


}
