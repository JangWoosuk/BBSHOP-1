package com.bbshop.bit.mapper;

import java.util.HashMap;

import com.bbshop.bit.domain.MemberVO;
import com.bbshop.bit.domain.MoreDetailsVO;

public interface MemberMapper {
	
	public void insertMember(MemberVO member);
	public int memberLogin(HashMap<String, String> map);
	public String memberPw(MemberVO member);
	public void GetKey(String user_id, String key);
	public void moreDetailsRegister(MoreDetailsVO md);
	public long getUser_key(MemberVO vo);	
	public int getId(MemberVO vo);
	public int getNickname(MemberVO vo);
	public MemberVO getMemberInfo(long user_key);
}
