package com.bbshop.bit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insertReply(ReplyVO vo);
	
	public ReplyVO readReply(long reply_num);
	
	public int deleteReply(long reply_num);
	
	public int updateReply(ReplyVO vo);
	
	// 게시물 페이징 처리와 다르게, 추가적으로 특정한 게시물의 댓글들만을 대상으로 하기 때문에 추가로 게시물의 번호 필요.
	// 따라서 두 개 이상의 데이터를 파라미터로 전달함
	// @Param("") 의 내용이 mapper.xml의 #{} 와 매칭됨
	public List<ReplyVO> getListWithPaging(
			@Param("pagingvo") PagingVO pagingvo,
			@Param("BOARD_NUM") long board_num);

	public int getCountByBno(long board_num);
}
