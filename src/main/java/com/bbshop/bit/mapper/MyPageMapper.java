package com.bbshop.bit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbshop.bit.domain.AddrVO;
import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.MemberVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.OrderVO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.ReviewVO;
import com.bbshop.bit.domain.SavingsVO;

public interface MyPageMapper {
	
	// 데이터 목록 가져오는 매퍼
	
	public long getTotalCount(@Param("pagingVO") PagingVO pagingVO, @Param("table") String table, @Param("user_key") long user_key);

	public List<SavingsVO> getSavingsList(@Param("pagingVO") PagingVO pagingVO, @Param("total") long total, @Param("key") long key);	

	public List<OrderVO> getOrdersList(@Param("pagingVO") PagingVO pagingVO, @Param("total") long total, @Param("key") long key);

	public List<OrderVO> getOrdersListStss(@Param("pagingVO") PagingVO pagingVO, @Param("total") long total, @Param("key") long key, @Param("stts_list") List<String> stts_list);
	
	public List<ReviewVO> getReviewList(@Param("pagingVO") PagingVO pagingVO, @Param("total") long total, @Param("key") long key);

	public List<OnetooneVO> getOnetooneList(@Param("pagingVO") PagingVO pagingVO, @Param("total") long total, @Param("key") long key);
	
	public List<GoodsQnaVO> getQnaList(@Param("pagingVO") PagingVO pagingVO, @Param("total") long total, @Param("key") long key);
	
	public void cancelOrder(long order_num);
	
	// 회원 정보 관련 매퍼

	public MemberVO getUserInfo(long key);

	public void updateUserInfo(MemberVO memberVO);

	public void deleteUserInfo(long key);
	
	// 배송지 관련 매퍼
	
	public void updateAddrInfo(AddrVO addrVO);

	public void insertAddrInfo(AddrVO addrVO);

	public void deleteAddrInfo(@Param("key") long key, @Param("num") int num);
	
	public List<AddrVO> getAddrList(long key);
	
	// 추가 정보 관련 매퍼

	public MoreDetailsVO getDetail(long key);

	public void updateDetailInfo(@Param("moreDetailsVO") MoreDetailsVO moreDetailsVO, @Param("key") long key);

	public int nickCheck(String nickname);

	public List<OrderVO> getAllOrdersList(long key);

	public List<Long> getAllSavings(long key);



}
