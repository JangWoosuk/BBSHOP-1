package com.bbshop.bit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbshop.bit.domain.AddrVO;
import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.MemberVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.OrderVO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.SavingsVO;
import com.bbshop.bit.domain.ReviewVO;
import com.bbshop.bit.mapper.MyPageMapper;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SavingsVO> getSavingsList(PagingVO pagingVO, long total, long key) {
						
		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		return myPageMapper.getSavingsList(pagingVO, total, key);
	}

	@Override
	public long getTotal(PagingVO pagingVO, String table, long user_key) {
		
		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);
		
		return myPageMapper.getTotalCount(pagingVO, table, user_key);
	}

	@Override
	public List<OrderVO> getOrdersList(PagingVO pagingVO, long total, long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);
		
		return myPageMapper.getOrdersList(pagingVO, total, key);
	}

	@Override
	public List<ReviewVO> getReviewList(PagingVO pagingVO, long total, long key) {
		
		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);
		
		return myPageMapper.getReviewList(pagingVO, total, key);
	}

	@Override
	public void cancelOrder(long order_num) {
		
		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);
		
		myPageMapper.cancelOrder(order_num);
	}

	@Override
	public MemberVO getUserInfo(long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);
		
		return myPageMapper.getUserInfo(key);
	}

	@Override
	public void updateUserInfo(MemberVO memberVO) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		myPageMapper.updateUserInfo(memberVO);
	}

	@Override
	public List<AddrVO> getAddrList(long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		return myPageMapper.getAddrList(key);
	}

	@Override
	public void updateAddrInfo(AddrVO addrVO) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		myPageMapper.updateAddrInfo(addrVO);
	}

	@Override
	public void deleteUserInfo(long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		myPageMapper.deleteUserInfo(key);
	}

	@Override
	public void insertAddrInfo(AddrVO addrVO) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		myPageMapper.insertAddrInfo(addrVO);
	}

	@Override
	public void deleteAddrInfo(long key, int num) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		myPageMapper.deleteAddrInfo(key, num);
	}

	@Override
	public MoreDetailsVO getDetail(long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		return myPageMapper.getDetail(key);
	}

	@Override
	public void updateDetailInfo(MoreDetailsVO moreDetailsVO, long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		System.out.println("service에서 VO : " + moreDetailsVO.toString());
		
		myPageMapper.updateDetailInfo(moreDetailsVO, key);
	}

	@Override
	public int nickCheck(String nickname) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		return myPageMapper.nickCheck(nickname);
	}

	@Override
	public List<OrderVO> getAllOrdersList(long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		return myPageMapper.getAllOrdersList(key);
	}

	@Override
	public List<Long> getAllSavings(long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		return myPageMapper.getAllSavings(key);
	}

	@Override
	public List<OnetooneVO> getOnetooneList(PagingVO pagingVO, long total, long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);

		return myPageMapper.getOnetooneList(pagingVO, total, key);
	}

	@Override
	public List<GoodsQnaVO> getQnaList(PagingVO pagingVO, long total, long key) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);
		
		return myPageMapper.getQnaList(pagingVO, total, key);
	}

	@Override
	public List<OrderVO> getOrdersListStss(PagingVO pagingVO, long total, long key, List<String> stts_list) {

		MyPageMapper myPageMapper = sqlSession.getMapper(MyPageMapper.class);
		
		return myPageMapper.getOrdersListStss(pagingVO, total, key, stts_list);
	}

}
