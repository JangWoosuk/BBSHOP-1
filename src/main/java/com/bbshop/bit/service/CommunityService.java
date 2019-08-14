package com.bbshop.bit.service;

import java.util.List;
import java.util.Map;

import com.bbshop.bit.domain.CommunityVO;

public interface CommunityService {
	
	public int insertPost(CommunityVO community);
	public String getNickname(int user_key);
	public CommunityVO getPost(long board_num);
	public List<CommunityVO> getList(Map<String,Object> map);
	public int deletePost(long board_num);
	public long getBoardNum(long user_key);
	public int updatePost(CommunityVO community);
	public Long findNextPost(String team_name, Long board_num);
	public Long findPreviousPost(String team_name, Long board_num);
	public long updateHit(long board_num);
	public int getTotal(Map<String, Object> map);

}
